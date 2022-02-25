import RxSwift
import RxSwiftExt

// MARK: - Weak
extension ObservableType where Element == Void {
    public func subscribe<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> () -> Void)? = nil,
        onError: ((Object) -> (Error) -> Void)? = nil,
        onCompleted: ((Object) -> () -> Void)? = nil,
        onDisposed: ((Object) -> () -> Void)? = nil
    ) -> Disposable {
        subscribe(
            onNext: weakify(weak: obj, method: onNext),
            onError: weakify(weak: obj, method: onError),
            onCompleted: weakify(weak: obj, method: onCompleted),
            onDisposed: weakify(weak: obj, method: onDisposed))
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func subscribe<Object: AnyObject>(
        weak obj: Object,
        onSuccess: ((Object) -> (Element) -> Void)? = nil,
        onFailure: ((Object) -> (Swift.Error) -> Void)? = nil,
        onDisposed: ((Object) -> () -> Void)? = nil
    ) -> Disposable {
        subscribe(
            onSuccess: weakify(weak: obj, method: onSuccess),
            onFailure: weakify(weak: obj, method: onFailure),
            onDisposed: weakify(weak: obj, method: onDisposed))
    }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Void {
    public func subscribe<Object: AnyObject>(
        weak obj: Object,
        onSuccess: ((Object) -> () -> Void)? = nil,
        onFailure: ((Object) -> (Swift.Error) -> Void)? = nil,
        onDisposed: ((Object) -> () -> Void)? = nil
    ) -> Disposable {
        subscribe(
            onSuccess: weakify(weak: obj, method: onSuccess),
            onFailure: weakify(weak: obj, method: onFailure),
            onDisposed: weakify(weak: obj, method: onDisposed))
    }
}
