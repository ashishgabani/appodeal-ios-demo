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

- (void)showBanner
{
    AppController* appController = (AppController*) [UIApplication sharedApplication].delegate;
    
    bannerView = [[AODAdView alloc] init];
    bannerView.delegate = self;
    bannerView.rootController = [appController viewController];
    [bannerView loadAd];
    [bannerView.rootViewController.view addSubview:bannerView];
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

#pragma mark - <AODAdViewDelegate>

- (UIViewController *)viewControllerForPresentingModalView {
    AppController* appController = (AppController*) [UIApplication sharedApplication].delegate;
    return [appController viewController];
}

- (void)adViewDidLoadAd:(AODAdView *)bannerView {
    NSLog(@"AdBanner did load");
}

- (void)adViewDidFailToLoadAd:(AODAdView *)view {
    NSLog(@"AdBanner did failed to load");
}

- (void)willPresentModalViewForAd:(AODAdView *)view {
    NSLog(@"AdBanner has been shown");
}

- (void)didDismissModalViewForAd:(AODAdView *)view {
    
}

- (void)willLeaveApplicationFromAd:(AODAdView *)view {
    NSLog(@"onAdBanner has been clicked");
}

///////////////////////////////////////////////////////////////////

#pragma mark - <AODVideoAdDelegate>

- (void)onVideoAdDidLoad:(NSString*)adName {
    NSLog(@"video ad from %@ did load", adName);
}

- (void)onVideoAdDidFailToLoad:(NSString*)adName {
    NSLog(@"video ad from %@ failed to load", adName);
}

- (void)onVideoAdDidAppear:(NSString*)adName {
    NSLog(@"video ad from %@ failed to load", adName);
}

- (void)onVideoAdDidReceiveTapEvent:(NSString*)adName {
    NSLog(@"video ad from %@ has been clicked", adName);
}

- (void)onVideoAdDidDisappear:(NSString*)adName {
    NSLog(@"video ad from %@ has been closed or dismissed", adName);
}

- (void)onVideoAdShouldRewardUser:(NSString*)adName reward:(int)amount {
    NSLog(@"video ad from %@ has been completed and user rewarded %d virtual currency", adName, amount);
}

@end

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

void CCAppodeal::showBanner()
{
    [appodeal showBanner];
}

void CCAppodeal::showInterstitial()
{
    [appodeal showInterstitial];
}

void CCAppodeal::showVideo()
{
    [appodeal showVideo];
}
