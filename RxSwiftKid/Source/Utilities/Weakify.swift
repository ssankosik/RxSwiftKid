import RxSwift
import RxSwiftExt

// MARK: - With
func weakify<Object: AnyObject, Input>(
    with obj: Object,
    method: ((Object, Input) -> Void)?
) -> ((Input) -> Void) { { [weak obj] value in
        guard let obj = obj else { return }
        method?(obj, value)
    }
}

func weakify<Object: AnyObject>(
    with obj: Object,
    method: ((Object) -> Void)?
) -> (() -> Void) { { [weak obj] in
        guard let obj = obj else { return }
        method?(obj)
    }
}

func weakify<Object: AnyObject, Input>(
    with obj: Object,
    method: ((Object, Input) throws -> Void)?
) -> ((Input) throws -> Void) { { [weak obj] value in
        guard let obj = obj else { return }
        try method?(obj, value)
    }
}

func weakify<Object: AnyObject>(
    with obj: Object,
    method: ((Object) throws -> Void)?
) -> (() throws -> Void) { { [weak obj] in
        guard let obj = obj else { return }
        try method?(obj)
    }
}

func weakify<Object: AnyObject, Input>(
    with obj: Object,
    method: ((Object) -> Void)?
) -> ((Input) -> Void) { { [weak obj] value in
        guard let obj = obj else { return }
        method?(obj)
    }
}

// MARK: - Weak
func weakify<Object: AnyObject>(
    weak obj: Object,
    method: ((Object) -> () -> Void)?
) -> (() -> Void) { { [weak obj] in
        guard let obj = obj else { return }
        method?(obj)()
    }
}

func weakify<Object: AnyObject, Input>(
    weak obj: Object,
    method: ((Object) -> (Input) -> Void)?
) -> ((Input) -> Void) { { [weak obj] in
        guard let obj = obj else { return }
        method?(obj)($0)
    }
}

func weakify<Object: AnyObject, Input>(
    weak obj: Object,
    method: ((Object) -> (Input) throws -> Void)?
) -> ((Input) throws -> Void) { { [weak obj] in
        guard let obj = obj else { return }
        try method?(obj)($0)
    }
}

func weakify<Object: AnyObject>(
    weak obj: Object,
    method: ((Object) -> () throws -> Void)?
) -> (() throws -> Void) { { [weak obj] in
        guard let obj = obj else { return }
        try method?(obj)()
    }
}
