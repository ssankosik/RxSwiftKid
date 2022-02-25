import RxSwift
import RxSwiftExt

extension PrimitiveSequence where Trait == SingleTrait {
    public func catchErrorJustComplete() -> Single<Element> {
        primitiveSequence.catch({ _ in .never() })
    }
}
