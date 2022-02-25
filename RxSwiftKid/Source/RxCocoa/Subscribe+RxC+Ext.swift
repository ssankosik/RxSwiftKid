import RxCocoa
import RxSwift
import RxSwiftExt

// MARK: - Weak
extension SharedSequenceConvertibleType where SharingStrategy == SignalSharingStrategy {
    public func emit<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> (Element) -> Void)? = nil,
        onError: ((Object) -> (Error) -> Void)? = nil,
        onCompleted: ((Object) -> () -> Void)? = nil,
        onDisposed: ((Object) -> () -> Void)? = nil
    ) -> Disposable {
        emit(
            onNext: weakify(weak: obj, method: onNext),
            onCompleted: weakify(weak: obj, method: onCompleted),
            onDisposed: weakify(weak: obj, method: onDisposed))
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == SignalSharingStrategy, Element == Void {
    public func emit<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> () -> Void)? = nil,
        onError: ((Object) -> (Error) -> Void)? = nil,
        onCompleted: ((Object) -> () -> Void)? = nil,
        onDisposed: ((Object) -> () -> Void)? = nil
    ) -> Disposable {
        emit(
            onNext: weakify(weak: obj, method: onNext),
            onCompleted: weakify(weak: obj, method: onCompleted),
            onDisposed: weakify(weak: obj, method: onDisposed))
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    public func drive<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> (Element) -> Void)? = nil,
        onError: ((Object) -> (Error) -> Void)? = nil,
        onCompleted: ((Object) -> () -> Void)? = nil,
        onDisposed: ((Object) -> () -> Void)? = nil
    ) -> Disposable {
        drive(
            onNext: weakify(weak: obj, method: onNext),
            onCompleted: weakify(weak: obj, method: onCompleted),
            onDisposed: weakify(weak: obj, method: onDisposed))
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy, Element == Void {
    public func drive<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> () -> Void)? = nil,
        onError: ((Object) -> (Error) -> Void)? = nil,
        onCompleted: ((Object) -> () -> Void)? = nil,
        onDisposed: ((Object) -> () -> Void)? = nil
    ) -> Disposable {
        drive(
            onNext: weakify(weak: obj, method: onNext),
            onCompleted: weakify(weak: obj, method: onCompleted),
            onDisposed: weakify(weak: obj, method: onDisposed))
    }
}
