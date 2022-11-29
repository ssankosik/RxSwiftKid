import RxCocoa
import RxSwift
import RxSwiftExt

extension PublishRelay where Element == Void {
    public func accept() {
        accept(())
    }
}

extension BehaviorRelay where Element == Void {
    public func accept() {
        accept(())
    }
}

extension ReplayRelay where Element == Void {
    public func accept() {
        accept(())
    }
}
