Pod::Spec.new do |s|
  s.name = 'mopub-ios-sdk'
  s.version = '3.8.0.2'
  s.license = 'New BSD'
  s.summary = 'The Official MoPub Client SDK allows developers to easily monetize their apps by showing banner, interstitial, and native ads.'
  s.homepage = "https://github.com/mopub/mopub-ios-sdk"
  s.author = { "spdd" => "defaultqp@gmail.com" }
  s.source = { :git => "https://github.com/appodeal/mopub-ios-sdk.git" }  
  s.description = 'MoPub iOS Sdk'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.frameworks = "AdSupport", "CoreLocation", "SystemConfiguration", "CoreTelephony", "CoreGraphics", "MediaPlayer", "EventKit", "EventKitUI", "Foundation", "MediaPlayer", "QuartzCore", "UIKit", "StoreKit"
  s.default_subspecs = 'MoPubSDK'
  s.subspec "MoPubSDK" do |sp|
    sp.source_files = 'MoPubSDK/**/*.{h,m}'
    sp.resources = 'MoPubSDK/**/*.{png,bundle,xib,nib}'
  end
end