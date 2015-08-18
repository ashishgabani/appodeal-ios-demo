# Appodeal iOS SDK

Thanks for taking a look at Appodeal! We take pride in having an easy-to-use, flexible monetization solution that works across multiple platforms.

Sign up for an account at [http://appodeal.com/](http://appodeal.com/).

## Integrate

Integration instructions are available on the [wiki](https://github.com/appodeal/appodeal-ios-demo/wiki).

If you encounter any issues, do not hesitate to contact our happy support team
at [ios@appodeal.com](mailto:ios@appodeal.com).

# Appodeal iOS SDK Demo project

## Run with Cocoapods

1.Clone project   
2.Go to **Appodeal cocoapods** folder   
3.[Install CocoaPods](http://guides.cocoapods.org/using/getting-started.html) to simplify dependency management
```
sudo gem install cocoapods
```
*Use [github help] (https://help.github.com/articles/generating-ssh-keys/) to add ssh key*   
4.Open **iosdemo.xcworkspace**       
5.Change AppKey and Bundle ID (if you want to  test your app)   
![](https://s3.amazonaws.com/appodeal-images/Screen+Shot+2015-08-18+at+13.56.01.png)
![](https://s3.amazonaws.com/appodeal-images/Screen+Shot+2015-08-18+at+13.56.10.png)

6.Run  

[Back to top](https://github.com/appodeal/appodeal-ios-demo#top)

## Run with Appodeal framework

1.Clone project  
2.Go to **Appodeal framework** folder   
3.Download SDK   
3.1Download the [latest iOS SDK version](https://s3-us-west-1.amazonaws.com/appodeal-ios/0.4.3/Appodeal.zip) and extract Appodeal iOS SDK.   
4.Open your project in Xcode, then drag and drop **Appodeal.framework** and **Resources** folder onto your project or workspace (use the "Product Navigator view") and choose *"Copy items into destination group's folder and click Finish"*.     

![](http://dl.dropbox.com/s/8z80aridd4gqxub/Screen%20Shot%202015-04-23%20at%204.30.58%20PM.png)

5.Change AppKey and Bundle ID (if you want to  test your app)    
![](https://s3.amazonaws.com/appodeal-images/Screen+Shot+2015-08-18+at+13.56.01.png)
![](https://s3.amazonaws.com/appodeal-images/Screen+Shot+2015-08-18+at+13.56.10.png)

6.Run  

[Back to top](https://github.com/appodeal/appodeal-ios-demo#top)

# Appodeal iOS SDK

## Download

The Appodeal SDK is distributed as static library.

- **[Appodeal SDK.zip](https://s3-us-west-1.amazonaws.com/appodeal-ios/0.4.3/Appodeal.zip)**

The current version of the SDK is 0.4.3

## Integrate

Integration instructions are available on the [wiki](https://github.com/appodeal/appodeal-ios-demo/wiki).

## Requirements

iOS 7.0 and up

0.4.3 Change Log:
----------------------------------

* Facebook Audience Network added (Interstitials)   
* Smaato added (Banner and Interstitials)   
* Fix Amazon banner view   
* Public methods added   
* Fixes MRAID clicks handling   

0.4.2 Change Log:
----------------------------------
* banner for iPad (horizontal orientation)   
* stability improovment

0.4.1 Change Log:
----------------------------------
* new adnetwork implementation - Target Mail.ru (Banners, Interstitials), Adcolony & Vungle (Video), Inmobi (Banner & Interstitials)
* improvement Banner integration
* support iPAD (vertical orientation)
* skipppable/nonskippable video
* apps for kids support

0.3.6 Change Log:
----------------------------------
* fixed video/sound playback
* fixed 'applicationWillEnterForeground' for banners
* fixed hide banner
* fixed bugs

0.3.5 Change Log:
----------------------------------
* added AppLovin videos
* added Swift module map (obsoletes bridge header)
* fixes ads logic
* fixes bugs

0.3.4 Change Log:
----------------------------------
* fixed smaato banners  
* fixed banenrs logic  
* fixed bugs  

0.3.3 Change Log:
----------------------------------
* updated admob
* fixed mraid  banners/interstitials  
* fixed bugs

0.3.2 Change Log:
----------------------------------
* added new api 
* fixed mraid  banners/interstitials
* fixed fixed banners  
* fixed bugs

0.3.1 Change Log:
----------------------------------
* added new api 
* fixed fixed banners 
* fixed bugs

0.3.0 Change Log:
----------------------------------
* added new api
* added method showWithAdNetworkName  
* fixed fixed video ads
* fixed optional callbacks

0.2.9 Change Log:
----------------------------------
* fixed cacheBanner timeout
* fixed disable admob precache
* fixed Interstitial networks

0.2.8 Change Log:
----------------------------------
* Fixed banners loading

0.2.7 Change Log:
----------------------------------
* Fixed mopub video

0.2.6 Change Log:
----------------------------------
* Fixed video ads
* Fixes bugs

0.2.5 Change Log:
----------------------------------
* fixed banners fillrate

0.2.4 Change Log:
----------------------------------
* Added Chartboost video
* Added Mopub video
* Fixes bugs

0.2.3 Change Log:
----------------------------------
* Fixed banner sizes for large screens
* Fixes bugs

0.2.2 Change Log:
----------------------------------
* Added new sdk api
* Fixes bugs

0.2.1 Change Log:
----------------------------------
* Added AerServ 
* Added CocoaPods support
* Added new sdk api
* Fixes bugs

0.2.0 Change Log:
----------------------------------
* Added AdColony 
* Added Vungle
* Added new sdk api
* Fixes bugs

0.1.9 Change Log:
----------------------------------
* Fixes mraid banner sizes.
* Fixes device rotation craches.

0.1.8 Change Log:
----------------------------------
* Fixes banner position when device orientation changed
* Fixes craches.

0.1.7 Change Log:
----------------------------------
* Fixes reward user callback

0.1.6 Change Log:
----------------------------------
* Added AODAdView

[Back to top](https://github.com/appodeal/appodeal-ios-demo#top)
