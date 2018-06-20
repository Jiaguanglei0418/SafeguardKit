#
# Be sure to run `pod lib lint SafeguardKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SafeguardKit'
  s.version          = '0.1.0'
  s.summary          = 'SafeguardKit make your app stronger'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = 'SafeguardKit 提供了库函数, 能够防动态注入(DYLD_INSERT_LIBRARIES); 能够防动态调试(debugserver, LLDB, breakpoint); 能够防重签名(MonkeyDev), 能够防静态分析常量, 能够防 Class_dump, 能够防 dumpdecrypted 砸壳'

  s.homepage         = 'https://github.com/Jiaguanglei0418/SafeguardKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jiaguanglei0418' => 'jiaguanglei1@163.com' }
  s.source           = { :git => 'https://github.com/Jiaguanglei0418/SafeguardKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SafeguardKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SafeguardKit' => ['SafeguardKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
