#
# Be sure to run `pod lib lint CXNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'CXNetwork'
    s.version          = '1.1.0'
    s.summary          = 'Encapsulates a network request library with Moya and ObjectMapper.'
    s.module_name      = 'CXNetwork_Moya'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Encapsulates a network request library with Moya and ObjectMapper.
    DESC
    
    s.homepage         = 'https://github.com/itenfay/CXNetwork-Moya'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Tenfay' => 'itenfay@163.com' }
    s.source           = { :git => 'https://github.com/itenfay/CXNetwork-Moya.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '10.0'
    #s.osx.deployment_target = '10.12'
    s.tvos.deployment_target = '10.0'
    s.watchos.deployment_target = '3.0'
    
    #s.swift_versions = ['4.2', '5.0']
    s.swift_version = '5.0'
    s.requires_arc = true
    s.source_files = 'CXNetwork/Classes/*.{swift}'
    
    # s.resource_bundles = {
    #   'CXNetwork' => ['CXNetwork/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'Moya'
    s.dependency 'ObjectMapper', '~> 4.2.0'
end
