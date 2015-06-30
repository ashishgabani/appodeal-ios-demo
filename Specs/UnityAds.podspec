Pod::Spec.new do |s|
  s.name = 'UnityAds'
  s.version = '1.4.5'
  s.license = 'Commercial'
  s.summary = 'UnityAds rewarded ads'
  s.homepage = "https://github.com/Applifier/unity-ads-sdk"
  s.author = { "spdd" => "defaultqp@gmail.com" }
  s.source = { :git => 'https://github.com/Applifier/unity-ads-sdk.git' }
  s.description = 'UnityAds rewarded ads'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.resource = "UnityAds.bundle"
  s.frameworks = "AdSupport", "StoreKit"
  s.vendored_frameworks = "UnityAds.framework"
end