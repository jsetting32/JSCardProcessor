#
# Be sure to run `pod lib lint JSCardProcessor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'JSCardProcessor'
    s.version          = '0.1.0'
    s.summary          = 'A lightweight framework filled with UIKIt categories and Card Verification logic used to validate card numbers and information'
    s.homepage         = 'https://github.com/jsetting32/JSCardProcessor'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'John Setting' => 'jsetting32@gmail.com' }
    s.source           = { :git => 'https://github.com/jsetting32/JSCardProcessor.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

    s.ios.deployment_target = '8.0'

    s.public_header_files = 'JSCardProcessor/JSCardProcessor.h'
    s.source_files = 'JSCardProcessor/JSCardProcessor.h'

    s.subspec 'Categories' do |ss|
        ss.public_header_files = 'JSCardProcessor/Categories/*.h'
        ss.source_files = 'JSCardProcessor/Categories/*.{h,m}'
        ss.dependency 'JSCardProcessor/UIKit'
    end

    s.subspec 'UIKit' do |ss|
        ss.public_header_files = 'JSCardProcessor/UIKit/*.h'
        ss.source_files = 'JSCardProcessor/UIKit/*.{h,m}'
        ss.dependency 'JSCardProcessor/Categories'
    end


    s.resource_bundles = {
        'JSCardProcessor' => ['JSCardProcessor/Assets/*.png']
    }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'

    s.requires_arc = true
end
