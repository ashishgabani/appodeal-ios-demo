Pod::Spec.new do |s|
  s.name = 'UnityAds'
  s.version = '1.4.2'
  s.license = 'Commercial'
  s.summary = 'UnityAds rewarded ads'
  s.homepage = 'https://unity.com/'
  s.author = { "Unity" }
  s.source = { :git => 'https://github.com/Applifier/unity-ads-sdk.git' }
  s.description = 'UnityAds rewarded ads'
  s.platform = :ios
  s.vendored_frameworks = "UnityAds.framework"
end