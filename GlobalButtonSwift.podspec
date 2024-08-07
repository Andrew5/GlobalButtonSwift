#
# Be sure to run `pod lib lint GlobalButtonSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GlobalButtonSwift'
  s.version          = '0.1.4'
  s.summary          = 'A short description of GlobalButtonSwift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                全局悬浮按钮
                       DESC

  s.homepage         = 'https://github.com/localhost3585@gmail.com/GlobalButtonSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mr. Zhao' => 'localhost3585@gmail.com' }
  s.source           = { :git => 'git@github.com:Andrew5/GlobalButtonSwift.git', :tag => '0.1.1' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.ios.source_files = 'GlobalButtonSwift/Classes/**/*.{swift}'
  s.requires_arc = true

  # s.resource_bundles = {
  #   'GlobalButtonSwift' => ['GlobalButtonSwift/Assets/*.png']
  # }

#   s.public_header_files = 'GlobalButtonSwift/Classes/DHGlobeManager.swift'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
