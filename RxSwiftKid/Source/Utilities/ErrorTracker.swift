import RxCocoa
import RxSwift
import RxSwiftExt

public final class ErrorTracker: SharedSequenceConvertibleType {
    public typealias SharingStrategy = DriverSharingStrategy
    private let _subject = PublishSubject<Error>()
    
    public init() {}

    public func trackError<O: ObservableConvertibleType>(from source: O) -> Observable<O.Element> {
        source.asObservable().do(onError: onError)
    }
    
    public func trackError<O: PrimitiveSequenceType>(from source: O) -> Single<O.Element> where O.Trait == SingleTrait {
        source.do(onError: onError)
    }

    public func asSharedSequence() -> SharedSequence<SharingStrategy, Error> {
        _subject.asObservable().asDriverOnErrorJustComplete()
    }

    public func asObservable() -> Observable<Error> {
        _subject.asObservable()
    }

    private func onError(_ error: Error) {
        _subject.onNext(error)
    }
    
    deinit {
        _subject.onCompleted()
    }
}

extension ObservableConvertibleType {
    public func trackError(_ errorTracker: ErrorTracker) -> Observable<Element> {
        errorTracker.trackError(from: self)
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func trackError(_ errorTracker: ErrorTracker) -> Single<Element> {
        errorTracker.trackError(from: self)
    }
}
