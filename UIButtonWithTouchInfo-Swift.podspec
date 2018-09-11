#
# Be sure to run `pod lib lint UIButtonWithTouchInfo-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIButtonWithTouchInfo-Swift'
  s.version          = '0.3.0'
  s.summary          = 'UIButtonWithTouchInfo-Swift this is UIButton with touch position information.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UIButtonWithTouchInfo-Swift this is UIButton with touch position information.
Use it for fun and projects.
                       DESC

  s.homepage         = 'https://github.com/sergemoskalenko/UIButtonWithTouchInfo-Swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Serge Moskalenko' => 'skype:camopu-ympo, http://camopu.rhorse.ru/ios' }
  s.source           = { :git => 'https://github.com/sergemoskalenko/UIButtonWithTouchInfo-Swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/sergemoskalenko'

  s.ios.deployment_target = '8.0'

  s.source_files = 'UIButtonWithTouchInfo-Swift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'UIButtonWithTouchInfo-Swift' => ['UIButtonWithTouchInfo-Swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

