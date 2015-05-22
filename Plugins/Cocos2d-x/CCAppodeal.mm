//
//  CCAppodeal.m
//  iosdemo
//
//  Created by Dmitry B on 21.05.15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#include "CCAppodeal.h"
#include "AppController.h"
#import <AppodealAds/Appodeal.h>

/// Returns an NSString copying the characters from |bytes|, a C array of UTF8-encoded bytes.
/// Returns nil if |bytes| is NULL.
static NSString *AODUStringFromUTF8String(const char *bytes) {
    if (bytes) {
        return @(bytes);
    } else {
        return nil;
    }
}

#pragma mark Obj-C  code for delegates
@interface CCAppodeal2 : NSObject <AODAdViewDelegate, AODInterstitialDelegate, AODVideoAdDelegate>
{
    AODAdView *bannerView;
}

@end

@implementation CCAppodeal2


- (void)initWithAppId:(NSString*)appKey
{
    [Appodeal initWithAppId:appKey];
}

- (void)showBanner:(AODCCBannerType)type
{
    AppController* appController = (AppController*) [UIApplication sharedApplication].delegate;
    
    bannerView = [[AODAdView alloc] initWithBannerType:(AODBannerType)type];
    bannerView.delegate = self;
    bannerView.rootController = [appController viewController];
    [bannerView loadAd];
    [bannerView.rootController.view addSubview:bannerView];
}

- (void)showInterstitial
{
    [Appodeal setInterstitialDelegate:self];
    NSLog(@"showInterstitial");
    if ([Appodeal isInterstitialLoaded]) {
        NSLog(@"mInterstitial.isReady");
        AppController* appController = (AppController*) [UIApplication sharedApplication].delegate;
        UIViewController *vc = [appController viewController];
        [Appodeal showInterstitial:vc];
    }
}

- (void)showVideo
{
    [Appodeal setVideoAdDelegate:self];
    NSLog(@"showVideo");
    if ([Appodeal isVideoAdReady]) {
        NSLog(@"Video isReady");
        AppController* appController = (AppController*) [UIApplication sharedApplication].delegate;
        UIViewController *vc = [appController viewController];
        [Appodeal showVideoAd:vc];
    }
}

///////////////////////////////////////////////////////////////////

#pragma mark - <AODAdViewDelegate>

- (UIViewController *)viewControllerForPresentingModalView {
    AppController* appController = (AppController*) [UIApplication sharedApplication].delegate;
    return [appController viewController];
}

- (void)adViewDidLoadAd:(AODAdView *)bannerView {
    NSLog(@"AdBanner did load");
    CCAppodeal::getInstance()->getBannerDelegate()->adBannerReceived();
}

- (void)adViewDidFailToLoadAd:(AODAdView *)view {
    NSLog(@"AdBanner did failed to load");
    CCAppodeal::getInstance()->getBannerDelegate()->adBannerFailed();
}

- (void)willPresentModalViewForAd:(AODAdView *)view {
    NSLog(@"AdBanner has been shown");
    CCAppodeal::getInstance()->getBannerDelegate()->adBannerShown();
}

- (void)didDismissModalViewForAd:(AODAdView *)view {
    CCAppodeal::getInstance()->getBannerDelegate()->adBannerClosed();
}

- (void)willLeaveApplicationFromAd:(AODAdView *)view {
    NSLog(@"onAdBanner has been clicked");
    CCAppodeal::getInstance()->getBannerDelegate()->adBannerClicked();
}

///////////////////////////////////////////////////////////////////

#pragma mark - <AODInterstitialDelegate>

- (void)onInterstitialAdLoaded:(NSString*)adName isPrecache:(BOOL)isPrecache {
    NSLog(@"interstitial from %@ did load", adName);
    CCAppodeal::getInstance()->getInterstitialDelegate()->interstitialAdReceived();
}

- (void)onInterstitialAdFailedToLoad:(NSString*)adName {
    NSLog(@"interstitial from %@ failed to load", adName);
    CCAppodeal::getInstance()->getInterstitialDelegate()->interstitialAdFailed();
}

- (void)onInterstitialAdShown:(NSString*)adName {
    NSLog(@"interstitial from %@ failed to load", adName);
    CCAppodeal::getInstance()->getInterstitialDelegate()->interstitialAdShown();
}

- (void)onInterstitialAdClicked:(NSString*)adName {
    NSLog(@"interstitial from %@ has been clicked", adName);
    CCAppodeal::getInstance()->getInterstitialDelegate()->interstitialAdClicked();
}

- (void)onInterstitialAdClosed:(NSString*)adName {
    NSLog(@"interstitial from %@ has been closed or dismissed", adName);
    CCAppodeal::getInstance()->getInterstitialDelegate()->interstitialAdClosed();
}

///////////////////////////////////////////////////////////////////

#pragma mark - <AODVideoAdDelegate>

- (void)onVideoAdDidLoad:(NSString*)adName {
    NSLog(@"video ad from %@ did load", adName);
    CCAppodeal::getInstance()->getVideoDelegate()->videoAdReceived();
}

- (void)onVideoAdDidFailToLoad:(NSString*)adName {
    NSLog(@"video ad from %@ failed to load", adName);
    CCAppodeal::getInstance()->getVideoDelegate()->videoAdFailed();
}

- (void)onVideoAdDidAppear:(NSString*)adName {
    NSLog(@"video ad from %@ failed to load", adName);
    CCAppodeal::getInstance()->getVideoDelegate()->videoAdShown();
}

- (void)onVideoAdDidReceiveTapEvent:(NSString*)adName {
    NSLog(@"video ad from %@ has been clicked", adName);
    CCAppodeal::getInstance()->getVideoDelegate()->videoAdClicked();
}

- (void)onVideoAdDidDisappear:(NSString*)adName {
    NSLog(@"video ad from %@ has been closed or dismissed", adName);
    CCAppodeal::getInstance()->getVideoDelegate()->videoAdClosed();
    CCAppodeal::getInstance()->showBanner(kBannerPortraitBottom);
}

- (void)onVideoAdShouldRewardUser:(NSString*)adName reward:(int)amount {
    NSLog(@"video ad from %@ has been completed and user rewarded %d virtual currency", adName, amount);
    CCAppodeal::getInstance()->getVideoDelegate()->videoAdRewardedUser(amount);
}

@end

#pragma mark - C++ code

static CCAppodeal * s_pWrapper = NULL;

static CCAppodeal2 * appodeal=0;

CCAppodeal * CCAppodeal::getInstance(){
    if (s_pWrapper == NULL) {
        s_pWrapper = new CCAppodeal();
        
        
        if(appodeal==0){
            appodeal= [[CCAppodeal2 alloc] init];
        }
        
    }
    return s_pWrapper;
}
void CCAppodeal::init(const char *appkey)
{
    [appodeal initWithAppId:AODUStringFromUTF8String(appkey)];
}

void CCAppodeal::showBanner(AODCCBannerType type)
{
    [appodeal showBanner:type];
}

void CCAppodeal::showInterstitial()
{
    [appodeal showInterstitial];
}

void CCAppodeal::showVideo()
{
    [appodeal showVideo];
}

CCAppodealBannerDelegate* CCAppodeal::getBannerDelegate()
{
    return bannerDelegate;
}

CCAppodealInterstitialDelegate* CCAppodeal::getInterstitialDelegate()
{
    return interstitialDelegate;
}

CCAppodealVideoDelegate* CCAppodeal::getVideoDelegate()
{
    return videoDelegate;
}

void CCAppodeal::setBannerDelegate(CCAppodealBannerDelegate *delegate)
{
    bannerDelegate = delegate;
}

void CCAppodeal::setInterstitialDelegate(CCAppodealInterstitialDelegate *delegate)
{
    interstitialDelegate = delegate;
}

void CCAppodeal::setVideoDelegate(CCAppodealVideoDelegate *delegate)
{
    videoDelegate = delegate;
}

