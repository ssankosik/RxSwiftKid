import RxCocoa
import RxSwift
import RxSwiftExt

// MARK: - With
extension SharedSequenceConvertibleType {
    public func `do`<Object: AnyObject>(
        with obj: Object,
        onNext: ((Object, Element) -> Void)? = nil,
        afterNext: ((Object, Element) -> Void)? = nil,
        onCompleted: ((Object) -> Void)? = nil,
        afterCompleted: ((Object) -> Void)? = nil,
        onSubscribe: ((Object) -> Void)? = nil,
        onSubscribed: ((Object) -> Void)? = nil,
        onDispose: ((Object) -> Void)? = nil
    ) -> SharedSequence<SharingStrategy, Element> {
        `do`(
            onNext: weakify(with: obj, method: onNext),
            afterNext: weakify(with: obj, method: afterNext),
            onCompleted: weakify(with: obj, method: onCompleted),
            afterCompleted: weakify(with: obj, method: afterCompleted),
            onSubscribe: weakify(with: obj, method: onSubscribe),
            onSubscribed: weakify(with: obj, method: onSubscribed),
            onDispose: weakify(with: obj, method: onDispose))
    }
}

// MARK: - Weak
extension SharedSequenceConvertibleType {
    public func `do`<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> (Element) -> Void)? = nil,
        afterNext: ((Object) -> (Element) -> Void)? = nil,
        onCompleted: ((Object) -> () -> Void)? = nil,
        afterCompleted: ((Object) -> () -> Void)? = nil,
        onSubscribe: ((Object) -> () -> Void)? = nil,
        onSubscribed: ((Object) -> () -> Void)? = nil,
        onDispose: ((Object) -> () -> Void)? = nil
    ) -> SharedSequence<SharingStrategy, Element> {
        `do`(
            onNext: weakify(weak: obj, method: onNext),
            afterNext: weakify(weak: obj, method: afterNext),
            onCompleted: weakify(weak: obj, method: onCompleted),
            afterCompleted: weakify(weak: obj, method: afterCompleted),
            onSubscribe: weakify(weak: obj, method: onSubscribe),
            onSubscribed: weakify(weak: obj, method: onSubscribed),
            onDispose: weakify(weak: obj, method: onDispose))
    }
}

extension SharedSequenceConvertibleType where Element == Void {
    public func `do`<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> () -> Void)? = nil,
        afterNext: ((Object) -> () -> Void)? = nil,
        onCompleted: ((Object) -> () -> Void)? = nil,
        afterCompleted: ((Object) -> () -> Void)? = nil,
        onSubscribe: ((Object) -> () -> Void)? = nil,
        onSubscribed: ((Object) -> () -> Void)? = nil,
        onDispose: ((Object) -> () -> Void)? = nil
    ) -> SharedSequence<SharingStrategy, Element> {
        `do`(
            onNext: weakify(weak: obj, method: onNext),
            afterNext: weakify(weak: obj, method: afterNext),
            onCompleted: weakify(weak: obj, method: onCompleted),
            afterCompleted: weakify(weak: obj, method: afterCompleted),
            onSubscribe: weakify(weak: obj, method: onSubscribe),
            onSubscribed: weakify(weak: obj, method: onSubscribed),
            onDispose: weakify(weak: obj, method: onDispose))
    }
}
