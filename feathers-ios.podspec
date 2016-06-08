#
# Be sure to run `pod lib lint feathers-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'feathers-ios'
  s.version          = '0.1.0'
  s.summary          = 'A short description of feathers-ios.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/feathers-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brendan Conron' => 'conronb@gmail.com' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/feathers-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.default_subspec = 'Core'

  core_dependencies = lambda do |spec|
      spec.dependency 'Result'
  end

  rest_dependencies = lambda do |spec|
    spec.dependency 'Just'
  end

  reactive_cocoa_dependencies = lambda do |spec|
    spec.dependency 'ReactiveCocoa'
  end

  socket_dependencies = lambda do |spec|
    spec.dependency 'Socket.IO-Client-Swift'
  end

  object_mapper_dependencies = lambda do |spec|
    spec.dependency 'ObjectMapper'
  end

  s.subspec 'Core' do |spec|
    spec.source_files = ['feathers-ios/Classes/Core/*.{swift}']
    core_dependencies.call(spec)
  end

  s.subspec 'Rest' do |spec|
    spec.source_files = ['feathers-ios/Classes/Core/*.{swift}', 'feathers-ios/Classes/Rest/*.{swift}']
    core_dependencies.call(spec)
    rest_dependencies.call(spec)
  end

  s.subspec 'Socket' do |spec|
    spec.source_files = ['feathers-ios/Classes/Core/*.{swift}', 'feathers-ios/Classes/Socket/*.{swift}']
    core_dependencies.call(spec)
    socket_dependencies.call(spec)
  end

  s.subspec 'ObjectMapper' do |spec|
    spec.source_files = ['feathers-ios/Classes/Core/*.{swift}', 'feathers-ios/Classes/ObjectMapper/*.{swift}']
    core_dependencies.call(spec)
    object_mapper_dependencies.call(spec)
  end

  s.subspec 'ReactiveCocoa' do |spec|
    spec.source_files = ['feathers-ios/Classes/Core/*.{swift}', 'feathers-ios/Classes/Reactive/ReactiveCocoa/*.{swift}']
    core_dependencies.call(spec)
    reactive_cocoa_dependencies.call(spec)
  end

  # s.resource_bundles = {
  #   'feathers-ios' => ['feathers-ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
