import RxCocoa
import RxSwift
import RxSwiftExt

extension SharedSequenceConvertibleType {
    public func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        map({ _ in })
    }
}
