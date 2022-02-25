import RxSwift
import RxSwiftExt

// MARK: - With
extension ObservableType {
    public func `do`<Object: AnyObject>(
        with obj: Object,
        onNext: ((Object, Element) throws -> Void)? = nil,
        afterNext: ((Object, Element) throws -> Void)? = nil,
        onError: ((Object, Swift.Error) throws -> Void)? = nil,
        afterError: ((Object, Swift.Error) throws -> Void)? = nil,
        onCompleted: ((Object) throws -> Void)? = nil,
        afterCompleted: ((Object) throws -> Void)? = nil,
        onSubscribe: ((Object) -> Void)? = nil,
        onSubscribed: ((Object) -> Void)? = nil,
        onDispose: ((Object) -> Void)? = nil
    ) -> Observable<Element> {
        `do`(
            onNext: weakify(with: obj, method: onNext),
            afterNext: weakify(with: obj, method: afterNext),
            onError: weakify(with: obj, method: onError),
            afterError: weakify(with: obj, method: afterError),
            onCompleted: weakify(with: obj, method: onCompleted),
            afterCompleted: weakify(with: obj, method: afterCompleted),
            onSubscribe: weakify(with: obj, method: onSubscribe),
            onSubscribed: weakify(with: obj, method: onSubscribed),
            onDispose: weakify(with: obj, method: onDispose))
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func `do`<Object: AnyObject>(
        with obj: Object,
        onSuccess: ((Object, Element) throws -> Void)? = nil,
        afterSuccess: ((Object, Element) throws -> Void)? = nil,
        onError: ((Object, Swift.Error) throws -> Void)? = nil,
        afterError: ((Object, Swift.Error) throws -> Void)? = nil,
        onSubscribe: ((Object) -> Void)? = nil,
        onSubscribed: ((Object) -> Void)? = nil,
        onDispose: ((Object) -> Void)? = nil
    ) -> Single<Element> {
        `do`(
            onSuccess: weakify(with: obj, method: onSuccess),
            afterSuccess: weakify(with: obj, method: afterSuccess),
            onError: weakify(with: obj, method: onError),
            afterError: weakify(with: obj, method: afterError),
            onSubscribe: weakify(with: obj, method: onSubscribe),
            onSubscribed: weakify(with: obj, method: onSubscribed),
            onDispose: weakify(with: obj, method: onDispose))
    }
}

// MARK: - Weak
extension ObservableType {
    public func `do`<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> (Element) throws -> Void)? = nil,
        afterNext: ((Object) -> (Element) throws -> Void)? = nil,
        onError: ((Object) -> (Swift.Error) throws -> Void)? = nil,
        afterError: ((Object) -> (Swift.Error) throws -> Void)? = nil,
        onCompleted: ((Object) -> () throws -> Void)? = nil,
        afterCompleted: ((Object) -> () throws -> Void)? = nil,
        onSubscribe: ((Object) -> () -> Void)? = nil,
        onSubscribed: ((Object) -> () -> Void)? = nil,
        onDispose: ((Object) -> () -> Void)? = nil
    ) -> Observable<Element> {
        `do`(
            onNext: weakify(weak: obj, method: onNext),
            afterNext: weakify(weak: obj, method: afterNext),
            onError: weakify(weak: obj, method: onError),
            afterError: weakify(weak: obj, method: afterError),
            onCompleted: weakify(weak: obj, method: onCompleted),
            afterCompleted: weakify(weak: obj, method: afterCompleted),
            onSubscribe: weakify(weak: obj, method: onSubscribe),
            onSubscribed: weakify(weak: obj, method: onSubscribed),
            onDispose: weakify(weak: obj, method: onDispose))
    }
}

extension ObservableType where Element == Void {
    public func `do`<Object: AnyObject>(
        weak obj: Object,
        onNext: ((Object) -> () throws -> Void)? = nil,
        afterNext: ((Object) -> () throws -> Void)? = nil,
        onError: ((Object) -> (Swift.Error) throws -> Void)? = nil,
        afterError: ((Object) -> (Swift.Error) throws -> Void)? = nil,
        onCompleted: ((Object) -> () throws -> Void)? = nil,
        afterCompleted: ((Object) -> () throws -> Void)? = nil,
        onSubscribe: ((Object) -> () -> Void)? = nil,
        onSubscribed: ((Object) -> () -> Void)? = nil,
        onDispose: ((Object) -> () -> Void)? = nil
    ) -> Observable<Element> {
        `do`(
            onNext: weakify(weak: obj, method: onNext),
            afterNext: weakify(weak: obj, method: afterNext),
            onError: weakify(weak: obj, method: onError),
            afterError: weakify(weak: obj, method: afterError),
            onCompleted: weakify(weak: obj, method: onCompleted),
            afterCompleted: weakify(weak: obj, method: afterCompleted),
            onSubscribe: weakify(weak: obj, method: onSubscribe),
            onSubscribed: weakify(weak: obj, method: onSubscribed),
            onDispose: weakify(weak: obj, method: onDispose))
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    public func `do`<Object: AnyObject>(
        weak obj: Object,
        onSuccess: ((Object) -> (Element) throws -> Void)? = nil,
        afterSuccess: ((Object) -> (Element) throws -> Void)? = nil,
        onError: ((Object) -> (Swift.Error) throws -> Void)? = nil,
        afterError: ((Object) -> (Swift.Error) throws -> Void)? = nil,
        onSubscribe: ((Object) -> () -> Void)? = nil,
        onSubscribed: ((Object) -> () -> Void)? = nil,
        onDispose: ((Object) -> () -> Void)? = nil
    ) -> Single<Element> {
        `do`(
            onSuccess: weakify(weak: obj, method: onSuccess),
            afterSuccess: weakify(weak: obj, method: afterSuccess),
            onError: weakify(weak: obj, method: onError),
            afterError: weakify(weak: obj, method: afterError),
            onSubscribe: weakify(weak: obj, method: onSubscribe),
            onSubscribed: weakify(weak: obj, method: onSubscribed),
            onDispose: weakify(weak: obj, method: onDispose))
    }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Void {
    public func `do`<Object: AnyObject>(
        weak obj: Object,
        onSuccess: ((Object) -> () throws -> Void)? = nil,
        afterSuccess: ((Object) -> () throws -> Void)? = nil,
        onError: ((Object) -> (Swift.Error) throws -> Void)? = nil,
        afterError: ((Object) -> (Swift.Error) throws -> Void)? = nil,
        onSubscribe: ((Object) -> () -> Void)? = nil,
        onSubscribed: ((Object) -> () -> Void)? = nil,
        onDispose: ((Object) -> () -> Void)? = nil
    ) -> Single<Element> {
        `do`(
            onSuccess: weakify(weak: obj, method: onSuccess),
            afterSuccess: weakify(weak: obj, method: afterSuccess),
            onError: weakify(weak: obj, method: onError),
            afterError: weakify(weak: obj, method: afterError),
            onSubscribe: weakify(weak: obj, method: onSubscribe),
            onSubscribed: weakify(weak: obj, method: onSubscribed),
            onDispose: weakify(weak: obj, method: onDispose))
    }
}
