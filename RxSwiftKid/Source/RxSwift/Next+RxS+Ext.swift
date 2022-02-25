import RxSwift
import RxSwiftExt

extension ObserverType where Element == Void {
    public func onNext() {
        onNext(())
    }
}

extension Result where Success == Void {
    public static var success: Result {
        .success(())
    }
}
