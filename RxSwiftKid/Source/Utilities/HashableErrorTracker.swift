import RxCocoa
import RxSwift
import RxSwiftExt

public final class HashableErrorTracker<T: Hashable & RawRepresentable & CaseIterable>:
    SharedSequenceConvertibleType
{
    public typealias Element = (T, Error)
    public typealias SharingStrategy = SignalSharingStrategy
    private let _errorTrackers: [T: ErrorTracker]
    private let _errors: SharedSequence<SharingStrategy, Element>
    
    public init() {
        _errorTrackers = .init(uniqueKeysWithValues: T.allCases.map({ ($0, .init()) }))
        _errors = Observable
            .from(
                _errorTrackers
                    .map({ key, value in
                        value.asDriver()
                            .map({ (key, $0) })
                    })
            )
            .merge()
            .asSignalOnErrorJustComplete()
    }

    public func trackError<O: ObservableConvertibleType>(
        observable: O,
        type: T
    ) -> Observable<O.Element> {
        guard let errorTracker = _errorTrackers[type] else { return .empty() }
        return errorTracker.trackError(from: observable)
    }
    
    public func trackError<O: PrimitiveSequenceType>(
        single: O,
        type: T
    ) -> Single<O.Element> where O.Trait == SingleTrait {
        guard let errorTracker = _errorTrackers[type] else { return .never() }
        return errorTracker.trackError(from: single)
    }

    public func asSharedSequence() -> SharedSequence<SharingStrategy, Element> {
        _errors
    }
}

extension ObservableConvertibleType {
    public func trackError<T>(
        _ errorTracker: HashableErrorTracker<T>,
        type: T
    ) -> Observable<Element> {
        errorTracker.trackError(observable: self, type: type)
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func trackError<T>(
        _ errorTracker: HashableErrorTracker<T>,
        type: T
    ) -> Single<Element> {
        errorTracker.trackError(single: self, type: type)
    }
}
