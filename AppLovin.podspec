Pod::Spec.new do |s|
  s.name             = "AppLovin"
  s.version          = "2.5.4"
  s.summary          = "The AppLovin SDK"
  s.source           = { :http => "http://sdk.applovin.com/applovin-ios-sdk-2.5.4.zip" }
  s.homepage         = "http://applovin.com"
  s.license          = { :type => 'Commercial', :text => <<-LICENSE
                   No license given.
                 LICENSE
               }
  s.author           = { "spdd" => "defaultqp@gmail.com" }

  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.frameworks = "AdSupport", "AVFoundation", "CoreTelephony", "CoreGraphics", "CoreMedia", "MediaPlayer", "SystemConfiguration", "UIKit"
  s.public_header_files = "headers/*.h"
  s.vendored_libraries = 'libAppLovinSdk.a'

end