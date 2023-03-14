#
# Be sure to run `pod lib lint DropdownSelection.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DropdownSelection'
  s.version          = '0.1.4'
  s.summary          = 'A Simple Dropdown Menu Selection.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/stevenpho/DropdownSelection'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Steven' => 'a1231233434@gmail.com' }
  s.source           = { :git => 'https://github.com/stevenpho/DropdownSelection.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'DropdownSelection/Classes/**/*'
  #s.resources = "Assets/*.svg" #//for svg file
  #s.resources = 'DropdownSelection/Pod/Assets/**/*.{png,storyboard,xcassets}'
#   s.resource_bundles = {
#     'DropdownSelection' => ['DropdownSelection/Assets/*.png']
#     #'DropdownSelection' => ['DropdownSelection/Assets/*.svg']
#   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Then', '~> 3.0.0'
  s.dependency 'SnapKit', '~> 5.6.0'
  s.dependency 'SVGKit', '~> 3.0.0'
end
