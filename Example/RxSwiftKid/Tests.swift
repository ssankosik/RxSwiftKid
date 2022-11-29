import RxCocoa
import RxSwift
import RxSwiftExt
import RxSwiftKid

// MARK: - Event
class TestVoidEvent {
    private typealias `Self` = TestVoidEvent
    typealias Element = Void

    private var bag: DisposeBag = .init()
    let didLoad: PublishRelay<Element> = .init()
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    let displayed: Signal<Element>

    init() {
        displayed = didLoad.asSignal()
    }

    func viewController() {
        // Input
        didLoad
            .do(onNext: { [weak self] in
                guard let self = self else { return }
                self.track()
            })
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.fetch()
            })
            .disposed(by: bag)

        didLoad
            .do(with: self, onNext: { object, _ in
                object.track()
            })
            .subscribe(with: self, onNext: { object, _ in
                object.fetch()
            })
            .disposed(by: bag)

        didLoad
            .do(weak: self, onNext: Self.track)
            .subscribe(weak: self, onNext: Self.fetch)
            .disposed(by: bag)

        // Output
        displayed
            .do(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.track()
            })
            .emit(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.display()
            })
            .disposed(by: bag)

        displayed
            .do(with: self, onNext: { object, _ in
                object.track()
            })
            .emit(with: self, onNext: { object, _ in
                object.display()
            })
            .disposed(by: bag)

        displayed
            .do(weak: self, onNext: Self.track)
            .emit(weak: self, onNext: Self.display)
            .disposed(by: bag)
    }

    func viewModel() {
        let didLoad: Single<Element> = self.didLoad.asSingle()

        didLoad
            .do(onSuccess: { [weak self] in
                guard let self = self else { return }
                self.track()
            })
            .subscribe(onSuccess: { [weak self] in
                guard let self = self else { return }
                self.present()
            })
            .disposed(by: bag)

        didLoad
            .do(with: self, onSuccess: { object, _ in
                object.track()
            })
            .subscribe(with: self, onSuccess: { object, _ in
                object.present()
            })
            .disposed(by: bag)

        didLoad
            .do(weak: self, onSuccess: Self.track)
            .subscribe(weak: self, onSuccess: Self.present)
            .disposed(by: bag)
    }

    func fetch() {}

    func present() {}

    func track() {}

    func display() {}
}

class TestIntEvent {
    private typealias `Self` = TestIntEvent
    typealias Element = Int

    private var bag: DisposeBag = .init()
    let didLoad: PublishRelay<Element> = .init()
    let displayed: Signal<Element>

    init() {
        displayed = didLoad.asSignal()
    }

    func viewController() {
        // Input
        didLoad
            .do(onNext: { [weak self] value in
                guard let self = self else { return }
                self.track(value)
            })
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                self.fetch(value)
            })
            .disposed(by: bag)

        didLoad
            .do(with: self, onNext: { object, value in
                object.track(value)
            })
            .subscribe(with: self, onNext: { object, value in
                object.fetch(value)
            })
            .disposed(by: bag)

        didLoad
            .do(weak: self, onNext: Self.track)
            .subscribe(weak: self, onNext: Self.fetch)
            .disposed(by: bag)

        // Output
        displayed
            .do(onNext: { [weak self] value in
                guard let self = self else { return }
                self.track(value)
            })
            .emit(onNext: { [weak self] value in
                guard let self = self else { return }
                self.display(value)
            })
            .disposed(by: bag)

        displayed
            .do(with: self, onNext: { object, value in
                object.track(value)
            })
            .emit(with: self, onNext: { object, value in
                object.display(value)
            })
            .disposed(by: bag)

        displayed
            .do(weak: self, onNext: Self.track)
            .emit(weak: self, onNext: Self.display)
            .disposed(by: bag)
    }

    func viewModel() {
        let didLoad: Single<Element> = self.didLoad.asSingle()

        didLoad
            .do(onSuccess: { [weak self] value in
                guard let self = self else { return }
                self.track(value)
            })
            .subscribe(onSuccess: { [weak self] value in
                guard let self = self else { return }
                self.present(value)
            })
            .disposed(by: bag)

        didLoad
            .do(with: self, onSuccess: { object, value in
                object.track(value)
            })
            .subscribe(with: self, onSuccess: { object, value in
                object.present(value)
            })
            .disposed(by: bag)

        didLoad
            .do(weak: self, onSuccess: Self.track)
            .subscribe(weak: self, onSuccess: Self.present)
            .disposed(by: bag)
    }

    func fetch(_ value: Element) {}

    func present(_ value: Element) {}

    func track(_ value: Element) {}

    func display(_ value: Element) {}
}

// MARK: - State
class TestBoolState {
    private typealias `Self` = TestBoolState
    typealias Element = Bool

    private var bag: DisposeBag = .init()
    let didLoad: BehaviorRelay<Element> = .init(value: true)
    let displayed: Driver<Element>

    init() {
        displayed = didLoad.asDriver()
    }

    func viewController() {
        // Input
        didLoad
            .do(onNext: { [weak self] value in
                guard let self = self else { return }
                self.track(value)
            })
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                self.fetch(value)
            })
            .disposed(by: bag)

        didLoad
            .do(with: self, onNext: { object, value in
                object.track(value)
            })
            .subscribe(with: self, onNext: { object, value in
                object.fetch(value)
            })
            .disposed(by: bag)

        didLoad
            .do(weak: self, onNext: Self.track)
            .subscribe(weak: self, onNext: Self.fetch)
            .disposed(by: bag)

        // Output
        displayed
            .do(onNext: { [weak self] value in
                guard let self = self else { return }
                self.track(value)
            })
            .drive(onNext: { [weak self] value in
                guard let self = self else { return }
                self.display(value)
            })
            .disposed(by: bag)

        displayed
            .do(with: self, onNext: { object, value in
                object.track(value)
            })
            .drive(with: self, onNext: { object, value in
                object.display(value)
            })
            .disposed(by: bag)

        displayed
            .do(weak: self, onNext: Self.track)
            .drive(weak: self, onNext: Self.display)
            .disposed(by: bag)
    }

    func viewModel() {
        let didLoad: Single<Element> = self.didLoad.asSingle()

        didLoad
            .do(onSuccess: { [weak self] value in
                guard let self = self else { return }
                self.track(value)
            })
            .subscribe(onSuccess: { [weak self] value in
                guard let self = self else { return }
                self.present(value)
            })
            .disposed(by: bag)

        didLoad
            .do(with: self, onSuccess: { object, value in
                object.track(value)
            })
            .subscribe(with: self, onSuccess: { object, value in
                object.present(value)
            })
            .disposed(by: bag)

        didLoad
            .do(weak: self, onSuccess: Self.track)
            .subscribe(weak: self, onSuccess: Self.present)
            .disposed(by: bag)
    }

    func fetch(_ value: Element) {}

    func present(_ value: Element) {}

    func track(_ value: Element) {}

    func display(_ value: Element) {}
}

// MARK: - HashableActivityIndicator
class TestHashableActivityIndicator {
    private typealias `Self` = TestBoolState
    typealias Element = Bool

    private var bag: DisposeBag = .init()
    
    enum Activities: Int, CaseIterable {
        case skeleton
        case fullScreen
        case pullToRefresh
    }
    
    let activityIndicator: HashableActivityIndicator<Activities> = .init()

    init() {
        Observable
            .just()
            .trackActivity(activityIndicator, type: .skeleton)
            .subscribe()
            .disposed(by: bag)
    }
}
