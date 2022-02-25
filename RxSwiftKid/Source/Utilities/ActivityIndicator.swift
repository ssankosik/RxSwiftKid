import RxCocoa
import RxSwift
import RxSwiftExt

private struct ActivityToken<E>: ObservableConvertibleType, Disposable {
    private let _source: Observable<E>
    private let _dispose: Cancelable

    init(source: Observable<E>, disposeAction: @escaping () -> Void) {
        _source = source
        _dispose = Disposables.create(with: disposeAction)
    }

    func dispose() {
        _dispose.dispose()
    }

    func asObservable() -> Observable<E> {
        _source
    }
}

private struct SingleActivityToken<E>: Disposable {
    private let _source: Single<E>
    private let _dispose: Cancelable

    init(source: Single<E>, disposeAction: @escaping () -> Void) {
        _source = source
        _dispose = Disposables.create(with: disposeAction)
    }

    func dispose() {
        _dispose.dispose()
    }

    func asSingle() -> Single<E> {
        _source
    }
}

/**
Enables monitoring of sequence computation.
If there is at least one sequence computation in progress, `true` will be sent.
When all activities complete `false` will be sent.
*/
public class ActivityIndicator: SharedSequenceConvertibleType {
    public typealias Element = Bool
    public typealias SharingStrategy = DriverSharingStrategy

    private let _lock = NSRecursiveLock()
    private let _relay = BehaviorRelay(value: 0)
    private let _loading: SharedSequence<SharingStrategy, Bool>

    public init() {
        _loading = _relay.asDriver()
            .map { $0 > 0 }
            .distinctUntilChanged()
    }

    fileprivate func trackActivityOfObservable<Source: ObservableConvertibleType>(_ source: Source) -> Observable<Source.Element> {
        Observable.using({ () -> ActivityToken<Source.Element> in
            self.increment()
            return .init(source: source.asObservable(), disposeAction: self.decrement)
        }, observableFactory: { t in
            t.asObservable()
        })
    }
    
    fileprivate func trackActivityOfSingle<Source: PrimitiveSequenceType>(_ source: Source) -> Single<Source.Element> where Source.Trait == SingleTrait {
        Single.using({ () -> SingleActivityToken<Source.Element> in
            self.increment()
            return .init(source: source.primitiveSequence, disposeAction: self.decrement)
        }, primitiveSequenceFactory: { t in
            t.asSingle()
        })
    }

    private func increment() {
        _lock.lock()
        _relay.accept(_relay.value + 1)
        _lock.unlock()
    }

    private func decrement() {
        _lock.lock()
        _relay.accept(_relay.value - 1)
        _lock.unlock()
    }

    public func asSharedSequence() -> SharedSequence<SharingStrategy, Element> {
        _loading
    }
}

extension ObservableConvertibleType {
    public func trackActivity(_ activityIndicator: ActivityIndicator) -> Observable<Element> {
        activityIndicator.trackActivityOfObservable(self)
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func trackActivity(_ activityIndicator: ActivityIndicator) -> Single<Element> {
        activityIndicator.trackActivityOfSingle(self)
    }
}
