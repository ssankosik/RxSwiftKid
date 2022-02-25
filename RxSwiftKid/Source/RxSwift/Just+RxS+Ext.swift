import RxSwift
import RxSwiftExt

extension ObservableType where Element == Void {
    public static func just() -> Observable<Element> {
        just(())
    }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Void {
    public static func just() -> Single<Element> {
        just(())
    }
}
