#
# Be sure to run `pod lib lint feathers-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "feathers-ios"
  s.version          = "0.1.0"
  s.summary          = "FeathersJS iOS Client"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
    Feathers-iOS is an iOS feathersJS client, writen in Swift 2.2. Connect, authenticate,
    and interact with any feathersjs api with ease.
                       DESC

  s.homepage         = "https://github.com/feathersjs/feathers-ios"
  s.license          = 'MIT'
  s.author           = { "Brendan Conron" => "conronb@gmail.com" }
  s.source           = { :git => "https://github.com/feathers/feathers-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/feathersjs'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.default_subspecs = 'Core'

  promise_dependencies = lambda do |spec|
      spec.dependency = 'PromiseKit'
  end

  all_platforms = lambda do |spec|
    spec.ios.deployment_target = "8.0"
    spec.osx.deployment_target = "10.10"
    spec.watchos.deployment_target = "2.0"
    spec.tvos.deployment_target = '9.0'
  end

  # Subspecs

  s.subspec 'Core' do |spec|
    spec.source_files = ['Pod/Classes/Core/**/*.{swift}']
    all_platforms.call(spec)
  end



end
