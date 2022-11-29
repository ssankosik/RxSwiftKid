# RxSwiftKid

[![CI Status](https://img.shields.io/travis/sasawat.sankosik@gmail.com/RxSwiftKid.svg?style=flat)](https://travis-ci.org/sasawat.sankosik@gmail.com/RxSwiftKid)
[![Version](https://img.shields.io/cocoapods/v/RxSwiftKid.svg?style=flat)](https://cocoapods.org/pods/RxSwiftKid)
[![License](https://img.shields.io/cocoapods/l/RxSwiftKid.svg?style=flat)](https://cocoapods.org/pods/RxSwiftKid)
[![Platform](https://img.shields.io/cocoapods/p/RxSwiftKid.svg?style=flat)](https://cocoapods.org/pods/RxSwiftKid)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RxSwiftKid is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxSwiftKid'
```

## Author

sasawat.sankosik@gmail.com

## License

RxSwiftKid is available under the MIT license. See the LICENSE file for more info.

## Operator details
**Do**     
Invokes an action for each event in the observable sequence, and propagates all observer messages through the result sequence.
```
displayed
  .do(onNext: { [weak self] value in
      guard let self = self else { return }
      self.track(value)
  })
  .do(with: self, onNext: { object, value in
      object.track(value)
  })
  .subscribe()
  .disposed(by: bag)
```
```swift
displayed
  .do(weak: self, onNext: Self.track)
  .subscribe()
  .disposed(by: bag)
```

**Subscribe**     
Subscribes an element handler, an error handler, a completion handler and disposed handler to an observable sequence.
```
displayed
  .subscribe(onNext: { [weak self] value in
      guard let self = self else { return }
      self.display(value)
  })
  .disposed(by: bag)

displayed
  .subscribe(with: self, onNext: { object, value in
      object.display(value)
  })
  .disposed(by: bag)
```
```swift
displayed
  .subscribe(weak: self, onNext: Self.display)
  .disposed(by: bag)
```

**HashableActivityIndicator**     
Sequence computation monitoring.
```swift
enum Activities: Int, CaseIterable {
  case skeleton
  case fullScreen
}

let activityIndicator = HashableActivityIndicator<Activities>()

observable.trackActivity(activityIndicator, type: .skeleton)

activityIndicator
  .emit(onNext: { id, isShown in 
    // Handle
  })
  .disposed(by: bag)
```

**HashableErrorTracker**   
Sequence computation error tracking.
```swift
enum Errors: Int, CaseIterable {
  case unexceptionalError
  case exceptionalError
}

let errorTracker = HashableErrorTracker<Errors>()

observable.trackError(errorTracker, type: .unexceptionalError)

errorTracker
  .emit(onNext: { id, error in 
    // Handle
  })
  .disposed(by: bag)
```
