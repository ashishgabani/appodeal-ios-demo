# Appodeal iOS SDK
The Appodeal iOS SDK is a mediation network. It
provides the functionality for showing interstitials, banner(soon), video(soon).

## Requirements
Appodeal iOS SDK works on >= iOS 6.0 version and is compatible with both ARC and non-ARC projects. It depends (Project Settings -> Build Phases -> Link Binary With Libraries) on the following Apple frameworks:

* AdSupport
* AVFoundation
* AudioToolbox
* CoreTelefony
* CoreGraphics
* EventKit
* EventKitUI
* MessageUI
* StoreKit
* SystemConfiguration
* CoreLocation
* UIKit
* CoreMedia
* MediaPlayer
* QuartzCore
* CoreImage
* CoreFoundation
* libz.dylib

You will need the latest developer tools in order to build Appodeal iOS SDK. Old Xcode versions might work, but compatibility will not be explicitly maintained.

## Adding Appodeal iOS SDK to your project

### Static library

You can also add Appodeal iOS SDK as a static library to your project or workspace. 

1. Download the [latest ios sdk version](http://dl.dropbox.com/s/didmniwmtgudlbu/Appodeal-iOS-SDK_0.1.1.zip) and extract Appodeal iOS SDK.
2. Open your project in Xcode, then drag and drop `AppodealAds` folder onto your project or workspace (use the "Product Navigator view") and choose "Copy items into destination group's folder and click Finish".  

![](http://dl.dropbox.com/s/8z80aridd4gqxub/Screen%20Shot%202015-04-23%20at%204.30.58%20PM.png)

3. Linker Flags: Click Project -> Build Settings -> Search for other linker flags -> Add "-ObjC"

![](http://dl.dropbox.com/s/bqlv32995a4t164/Screen%20Shot%202015-04-23%20at%204.38.45%20PM.png)

## AppLovin Integration
Add Your AppLovin SDK Key.

Project Settings -> Info, click on one of the rows of Custom iOS Properties and click the + to add a new row. The key of the new row key should be AppLovinSdkKey and the value: "YOUR KEY"

![](http://dl.dropbox.com/s/rib8pdximcag6r0/Screen%20Shot%202015-04-23%20at%204.40.23%20PM.png)

## SDK Initialization

Import `<AppodealAds/Appodeal.h>` in `AppDelegate.m` and start sdk initialization with `[Appodeal initWithAppId:@"APPODEAL_APP_KEY"];` in `didFinishLaunchingWithOptions` method

```objective-c
#import "AppDelegate.h"
#import <AppodealAds/Appodeal.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Appodeal SDK Initialization
    [Appodeal initWithAppId:@"APPODEAL_APP_KEY"];
    return YES;
}

@end
```

## Show Interstitial Ad

```objective-c
#import "YourViewController.h"
#import <AppodealAds/Appodeal.h>

@implementation YourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

     // show full screen banner
    [Appodeal showInterstitial:self]; // Note: You need to pass active View Controller as parameter.
}
```

## Delegate callbacks (optional)

`AODInterstitialDelegate` includes a variety of optional callbacks that you can use to be notified of events, e.g. when an interstitial has successfully loaded, or when an interstitial is about to appear.
To handle callbacks you need implement `AODInterstitialDelegate` protocol.

```objective-c
#import "YourViewController.h"
#import <AppodealAds/Appodeal.h>

@interface YourViewController () <AODInterstitialDelegate>

@end

@implementation YourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

     // set delegate
    [Appodeal setInterstitialDelegate:self];
}

#pragma mark - <AODInterstitialDelegate>

- (void)onInterstitialAdLoaded:(NSString*)adName isPrecache:(BOOL)isPrecache {
     NSLog(@"interstitial from %@ did load", adName);
}

- (void)onInterstitialAdFailedToLoad:(NSString*)adName {
     NSLog(@"interstitial from %@ failed to load", adName);
}

- (void)onInterstitialAdShown:(NSString*)adName {
     NSLog(@"interstitial from %@ failed to load", adName);
}

- (void)onInterstitialAdClicked:(NSString*)adName {
     NSLog(@"interstitial from %@ has been clicked", adName);
}

- (void)onInterstitialAdClosed:(NSString*)adName {
     NSLog(@"interstitial from %@ has been closed or dismissed", adName);
}
```
 
## Testing mode (optional)

```objective-c
#import "YourViewController.h"
#import <AppodealAds/Appodeal.h>

@implementation YourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set testing mode
    [Appodeal setTesting:YES]; // Note: Disable before publish on App Store.

    // show full screen banner
    [Appodeal showInterstitial:self];
}
```
If you encounter any issues, do not hesitate to contact our happy support team
at [p@appodeal.com](mailto:p@appodeal.com).
