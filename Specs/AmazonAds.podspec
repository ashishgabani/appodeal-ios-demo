Pod::Spec.new do |s|
  s.name = 'UnityAds'
  s.version = '1.4.2'
  s.license = 'Commercial'
  s.summary = 'UnityAds rewarded ads'
  s.homepage = "https://github.com/Applifier/unity-ads-sdk"
  s.author = { "Unity" }
  s.source = { :http => "http://sdk.applovin.com/applovin-ios-sdk-2.5.4.zip" }
  s.description = 'UnityAds rewarded ads'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.resource = "UnityAds.bundle"
  s.vendored_frameworks = "UnityAds.framework"
end