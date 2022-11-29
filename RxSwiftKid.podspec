Pod::Spec.new do |s|
  s.name             = 'RxSwiftKid'
  s.version          = '1.1.0'
  s.summary          = 'RxSwift operators not found in the core distribtion'
  s.description      = <<-DESC
  A collection of operators for RxSwift adding commonly requested operations not found in the core distribution
    of RxSwift.
                       DESC
  s.homepage         = 'https://github.com/ssankosik/RxSwiftKid'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ssankosik' => 'https://github.com/ssankosik/RxSwiftKid' }

  s.ios.deployment_target = '10.0'
  s.swift_versions = '5.0'

  s.source           = { :git => 'https://github.com/ssankosik/RxSwiftKid.git', :tag => s.version }

  s.source_files = 'RxSwiftKid/Source/**/*.{swift}'
  s.frameworks   = 'Foundation'
  s.dependency 'RxSwiftExt', '~> 6.0.1'
end
