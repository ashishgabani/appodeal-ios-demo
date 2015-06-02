Pod::Spec.new do |s|
  s.name = 'AerServ'
  s.version = '2.23'
  s.license = 'Commercial'
  s.summary = 'AerServ'
  s.homepage = "https://support.aerserv.com/hc/en-us/articles/204160170"
  s.author = { "spdd" => "defaultqp@gmail.com" }
  s.source = { :http => "https://s3.amazonaws.com/aerserv-sdk/aerserv-ios-sdk-latest.zip" }  
  s.description = 'AerServ'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.vendored_frameworks = "AerServSDK.framework"

end