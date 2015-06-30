Pod::Spec.new do |s|
  s.name = 'AmazonAds'
  s.version = '2.2.8'
  s.license = 'Commercial'
  s.summary = 'AmazonAds'
  s.homepage = "https://developer.amazon.com/public/resources/development-tools/sdk"
  s.author = { "spdd" => "defaultqp@gmail.com" }
  s.source = { :http => "http://s3-us-west-1.amazonaws.com/appodeal-ios/AmazonAd/2.2.8/AmazonAd.framework.zip" }  
  s.description = 'AmazonAds'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.frameworks = "AdSupport", "CoreLocation", "SystemConfiguration", "CoreTelephony", "CoreGraphics", "MediaPlayer", "EventKit", "EventKitUI"
  s.vendored_frameworks = "AmazonAd.framework"

end