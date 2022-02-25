import RxCocoa
import RxSwift
import RxSwiftExt

extension ObservableType {
    public func asSignalOnErrorJustComplete() -> Signal<Element> {
        asSignal(onErrorRecover: { _ in .empty() })
    }
    
    public func asDriverOnErrorJustComplete() -> Driver<Element> {
        asDriver(onErrorRecover: { _ in .empty() })
    }
}

extension ObservableType {
    public func asBindable() -> Observable<Element> {
        catchErrorJustComplete()
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func asBindable() -> Observable<Element> {
        catchErrorJustComplete().asObservable()
    }
}
