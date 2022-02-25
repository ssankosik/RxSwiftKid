import RxSwift
import RxSwiftExt

extension ObservableType {
    public func mapToVoid() -> Observable<Void> {
        map({ _ in })
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func mapToVoid() -> Single<Void> {
        map({ _ in })
    }
}
