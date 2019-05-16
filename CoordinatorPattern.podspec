Pod::Spec.new do |s|
  s.name             = 'CoordinatorPattern'
  s.version          = '0.1.0'
  s.summary          = 'Simple implementation of coordinators'
  s.homepage         = 'https://github.com/cocuroci/CoordinatorPattern'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'André Cocuroci' => 'cocuroci@gmail.com' }
  s.source           = { :git => 'https://github.com/cocuroci/CoordinatorPattern.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'
  s.source_files = 'CoordinatorPattern/Classes/**/*'
end
