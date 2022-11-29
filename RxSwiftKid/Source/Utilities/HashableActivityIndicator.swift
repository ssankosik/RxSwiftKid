import RxCocoa
import RxSwift
import RxSwiftExt

public class HashableActivityIndicator<T: Hashable & RawRepresentable & CaseIterable>:
    SharedSequenceConvertibleType
{
    public typealias Element = (T, Bool)
    public typealias SharingStrategy = SignalSharingStrategy
    
    private let _activityIndicators: [T: ActivityIndicator]
    private let _loadings: SharedSequence<SharingStrategy, Element>

    public init() {
        _activityIndicators = .init(uniqueKeysWithValues: T.allCases.map({ ($0, .init()) }))
        _loadings = Observable
            .from(
                _activityIndicators
                    .map({ key, value in
                        value.asDriver()
                            .map({ (key, $0) })
                    })
            )
            .merge()
            .asSignalOnErrorJustComplete()
    }

    fileprivate func track<Source: ObservableConvertibleType>(
        observable: Source,
        type: T
    ) -> Observable<Source.Element> {
        guard let activityIndicator = _activityIndicators[type] else { return .empty() }
        return observable.trackActivity(activityIndicator)
    }

    fileprivate func track<Source: PrimitiveSequenceType>(
        single: Source,
        type: T
    ) -> Single<Source.Element> where Source.Trait == SingleTrait {
        guard let activityIndicator = _activityIndicators[type] else { return .never() }
        return single.primitiveSequence.trackActivity(activityIndicator)
    }
    
    public func asSharedSequence() -> SharedSequence<SharingStrategy, Element> {
        _loadings
    }
}

extension ObservableConvertibleType {
    public func trackActivity<T>(
        _ activityIndicator: HashableActivityIndicator<T>,
        type: T
    ) -> Observable<Element> {
        activityIndicator.track(observable: self, type: type)
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func trackActivity<T>(
        _ activityIndicator: HashableActivityIndicator<T>,
        type: T
    ) -> Single<Element> {
        activityIndicator.track(single: self, type: type)
    }
}
