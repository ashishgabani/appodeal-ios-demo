//
//  Appodeal.h
//  Appodeal_iOS_SDK
//
//  Created by supergoodd on 3/5/15.
//  Copyright (c) 2015 if3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

enum {
    INTERSTITIAL    = 1,
    VIDEO           = 2,
    BANNER          = 4,
    BANNER_BOTTOM   = 8,
    BANNER_TOP      = 16,
    BANNER_CENTER   = 32,
    BANNER_VIEW     = 64,
    ALL             = 255,
    ANY             = 255
};
typedef int AODAppodeal;

@protocol AODInterstitialDelegate <NSObject>

@optional
/*!
 @abstract
 Called before an interstitial will be displayed on the screen.
 */
- (void)onInterstitialAdLoaded:(NSString*)adName isPrecache:(BOOL)isPrecache;
/*!
 @abstract
 Called after an interstitial has attempted to load from the Appodeal API
 servers but failed.
 */
- (void)onInterstitialAdFailedToLoad:(NSString*)adName;
/*!
 @abstract
 Called after an interstitial has been displayed on the screen.
 */
- (void)onInterstitialAdShown:(NSString*)adName;
/*!
 @abstract
 Called after an interstitial has been clicked.
 */
- (void)onInterstitialAdClicked:(NSString*)adName;
/*!
 @abstract
 Called after an interstitial has been closed or dismissed.
 */
- (void)onInterstitialAdClosed:(NSString*)adName;

@end

@protocol AODAdBannerDelegate <NSObject>

@optional
/*!
 @abstract
 Called before an ad banner view will be displayed on the screen.
 */
- (void)onAdBannerLoaded:(UIView*)bannerView;
/*!
 @abstract
 Called after an ad banner view has attempted to load from the Appodeal API
 servers but failed.
 */
- (void)onAdBannerFailedToLoad;
/*!
 @abstract
 Called after an ad banner view has been displayed on the screen.
 */
- (void)onAdBannerShown;
/*!
 @abstract
 Called after an ad banner view has been clicked.
 */
- (void)onAdBannerClicked;
/*!
 @abstract
 Called after an ad banner view has been closed or dismissed.
 */
- (void)onAdBannerClosed;

@end

@protocol AODVideoAdDelegate <NSObject>

@optional
- (void)onVideoAdDidLoad:(NSString*)adName;
- (void)onVideoAdDidFailToLoad:(NSString*)adName;
- (void)onVideoAdDidExpire:(NSString*)adName;
- (void)onVideoAdDidFailToPlay:(NSString*)adName;
- (void)onVideoAdDidAppear:(NSString*)adName;
- (void)onVideoAdDidDisappear:(NSString*)adName;
- (void)onVideoAdDidReceiveTapEvent:(NSString*)adName;
- (void)onVideoAdShouldRewardUser:(NSString*)adName reward:(int)amount;

@end

/*!
 @class Appodeal
 
 @abstract
 Provide methods to display and control Appodeal many advertising types.
 
 @discussion For more information on integrating and using the Appodeal SDK
 please visit our help site documentation at http://appodeal.com
 */
@interface Appodeal : NSObject

+ (instancetype) alloc __attribute__((unavailable("alloc not available, call initWithAppId instead")));
- (instancetype) init __attribute__((unavailable("init not available, call initWithAppId instead")));
+ (instancetype) new __attribute__((unavailable("new not available, call initWithAppId instead")));

/*!
 @abstract
 Start Appodeal with required appId.
 Note by default initialize all ad types interstitial, video and banners and autocache is enable
 
 @param appId appId The Appodeal application ID for this application.
 @param autoCache set autoCache.
 @discussion This method must be executed before any other Appodeal SDK methods can be used.
 */
+ (instancetype)initWithAppId:(NSString*)appId;

/*!
 @abstract
 Start Appodeal with required appId.
 Note by default initialize all ad types interstitial, video and banners
 
 @param appId appId The Appodeal application ID for this application.
 @param autoCache set autoCache.
 @discussion This method must be executed before any other Appodeal SDK methods can be used.
 */
+ (instancetype)initWithAppId:(NSString*)appId autoCache:(BOOL)autoCache;

/*!
 @abstract
 Start Appodeal with required appId and adTypes.
 Note by default autocache is enable
 
 @param appId appId The Appodeal application ID for this application.
 @param adTypes set Ad types (ex. INTERSTITIAL, VIDEO, BANNER)
 ALL and ANY - combination of all currently supported and future ad types
 Ad types can be combined using "|" operator. For example INTERSTITIAL | VIDEO
 @discussion This method must be executed before any other Appodeal SDK methods can be used.
 */
+ (instancetype)initWithAppId:(NSString*)appId adTypes:(int)adTypes;

/*!
 @abstract
 Start Appodeal with required appId, adTypes and auto cache.
 
 @param appId appId The Appodeal application ID for this application.
 @param adTypes set Ad types (ex. INTERSTITIAL, VIDEO, BANNER)
    ALL and ANY - combination of all currently supported and future ad types
    Ad types can be combined using "|" operator. For example INTERSTITIAL | VIDEO
 @discussion This method must be executed before any other Appodeal SDK methods can be used.
 */
+ (instancetype)initWithAppId:(NSString*)appId adTypes:(int)adTypes autoCache:(BOOL)autoCache;

/*!
 @abstract
 Show banner with type.
 
 @param rootController Required reference to the current root view controller.
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
@discussion This method must be executed after Appodeal intialization.
 */
+ (void)show:(UIViewController*)rootController adType:(int)adType;

/*!
 @abstract
 Show banner with PriceFloor.
 Currently supported only for interstitials
 
 [Appodeal showWithPriceFloor:self INTERSTITIAL] displays interstitial only if it's ecpm is bigger or equal to price floor set in our dashboard. It returns a boolean value indicating whether show call was passed to appropriate SDK. If eCPM of is less than price floor set in our dashboard false will be returned and no interstitial will be displayed
 
 @param rootController Required reference to the current root view controller.
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
 @discussion This method must be executed after Appodeal intialization.
 */
+ (void)showWithPriceFloor:(UIViewController*)rootController adType:(int)adType;

/*!
 @abstract
 Enabling or disabling automatic caching
 Currently supported only for interstitials and video
 
 [Appodeal setAutoCache:INTERSTITIAL autoCache:YES] set autocache for interstitial only
 
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
 @param autoCache Enable or disable automatic caching.
 @discussion This method must be executed after Appodeal intialization.
 */
+ (void)setAutoCache:(int)adType autoCache:(BOOL)autoCache;

/*!
 @abstract
 Triggering onLoaded callback twice
 Currently supported only for interstitials
 
 [Appodeal setOnLoadedTriggerBoth:INTERSTITIAL onLoadedTriggerBoth: NO] - onInterstitialAdLoaded will trigger only when normal ad was loaded (default).
 [Appodeal setOnLoadedTriggerBoth:INTERSTITIAL onLoadedTriggerBoth: YES] - onInterstitialAdLoaded will trigger twice, both when precache and normal ad were loaded.
 
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
 @param onLoadedTriggerBoth Enable or disable twice on<ADTYPE>AdLoaded callback.
 @discussion This method must be executed after Appodeal intialization.
 */
+ (void)setOnLoadedTriggerBoth:(int)adType onLoadedTriggerBoth:(BOOL)onLoadedTriggerBoth;

/*!
 @abstract
 Checking if ad is loaded
 Currently supported only for interstitials and videos
 
 To check if interstitial is loaded use [Appodeal isLoaded:INTERSTITIAL]
 To check if video is loaded use [Appodeal isLoaded:VIDEO]
 To check if banner is loaded use [Appodeal isLoaded:BANNER]
 To check if any ad is loaded use [Appodeal isLoaded:ANY]
 
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
 @discussion This method must be executed after Appodeal intialization.
 */
+ (BOOL)isLoaded:(int)adType;

/*!
 @abstract
 Checking if ad loading is Precache
 Currently supported only for interstitials
 
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
 @discussion This method must be executed after Appodeal intialization.
 */
+ (BOOL)isPrecache:(int)adType;

/*!
 @abstract
 Manual ad caching
 Currently supported only for interstitials and videos
 
 You should disable automatic caching before SDK initialization using setAutoCache:adType autoCache:NO.
 To cache interstitial use [Appodeal cache:INTERSTITIAL]
 To cache video use [Appodeal cache:VIDEO]
 To cache interstitial and video use [Appodeal cache:INTERSTITIAL | VIDEO]
 To cache banner use [Appodeal cache:BANNER]
 
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
 @discussion This method must be executed after Appodeal intialization.
 */
+ (void)cache:(int)adType;

/*!
 @abstract
 Hide banner
 Currently supported only for banners
 
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
 @discussion This method must be executed after Appodeal intialization.
 */
+ (void)hide:(int)adType;

/*!
 @abstract
 Show ads only on this network name
 Currently supported only for interstitials and videos

 Show admob interstitial use [Appodeal showWithAdNetworkName:@"admob" adType:INTERSTITIAL rootController:self]
 Show adcolony video use [Appodeal showWithAdNetworkName:@"adcolony" adType:VIDEO rootController:self]
 Show chartboost interstitial or video  use [Appodeal showWithAdNetworkName:@"chartboost" adType:INTERSTITIAL | VIDEO rootController:self]
 Show admob banner use [Appodeal showWithAdNetworkName:@"admob" adType:BANNER rootController:self]
 
 @param adName ad name ex:admob, chartboost, mopub, etc...
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
 @param rootController Required reference to the current root view controller.
 @discussion This method must be executed after Appodeal intialization.
 */
+ (void)showWithAdNetworkName:(NSString*)adName adType:(int)adType rootController:(UIViewController *)rootController;

/*!
 @abstract
 Send event to server
 
 NSString* eventName = @"Leve18";
 NSMutableDictionary* eventData = [NSMutableDictionary dictionary];
 eventData[@"guessed_letters"] = @"4";
 eventData[@"points"] = @"54";
 [Appodeal fireEvent:eventName evenData:eventData];
 
 @param eventName event name
 @param evenData dictionary of data.
 @discussion This method must be executed after Appodeal intialization.
 */
+ (void)fireEvent:(NSString*)eventName evenData:(NSDictionary*)eventData;

/*!
 @abstract
 Set AODAdBannerDelegate delegate
 
 @param delegate The delegate instance to receive AODAdBannerDelegate callbacks.
 @discussion This method must be executed before used AODAdBannerDelegate callbacks.
 */
+ (void)setBannerDelegate:(id<AODAdBannerDelegate>) bannerDelegate;

/*!
 @abstract
 Set AODInterstitialDelegate delegate
 
 @param delegate The delegate instance to receive AODInterstitialDelegate callbacks.
 @discussion This method must be executed before used AODInterstitialDelegate callbacks.
 */
+ (void)setInterstitialDelegate:(id<AODInterstitialDelegate>) interstitialDelegate;

/*!
 @abstract
 Set AODVideoAdDelegate delegate
 
 @param delegate The delegate instance to receive AODVideoAdDelegate callbacks.
 @discussion This method must be executed before used AODVideoAdDelegate callbacks.
 */
+ (void)setVideoAdDelegate:(id<AODVideoAdDelegate>) videoDelegate;

/*!
 @abstract
 Return YES if ad network available (not loaded)

  @param adName ad network name.
  @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW).
*/
+ (BOOL)adNetworkIsAvailable:(NSString*)adName adType:(int)adType;

/*!
 @abstract
 Get ads networks list
 
 @param adType (ex. INTERSTITIAL, VIDEO, BANNER, BANNER_BOTTOM, BANNER_CENTER, BANNER_VIEW or ALL).
 @discussion This method must be executed after Appodeal intialization.
 */
+ (NSArray*)getNetworks:(int)adType;

/*!
 @abstract
 Disable ad network for interstitial and video ads only
 
 @param adName You can disable following ad network: admob, chartboost, unity_ads, adcolony, smaato, amazon_ads, applovin, appnexus, mopub, mraid, nexage, openx, tapsense.
 @discussion This method must be executed after Appodeal intialization.
 */
+ (void)disableAdNetwork:(int)adType adName:(NSString*)adName;

/*!
 @abstract
 Set Testing mode
 */
+ (void)setTesting:(BOOL)testing;

// sdk developers debug
+ (NSArray*)getCachedAds;
+ (void)setAdsToLoad:(int)adIdx;
+ (void)setServer:(int)idx;

@end
