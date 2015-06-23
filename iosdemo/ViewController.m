//
//  ViewController.m
//  iosdemo
//
//  Created by supergoodd on 4/23/15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#import "ViewController.h"
#import <AppodealAds/Appodeal.h>

@interface ViewController () <AODInterstitialDelegate, AODVideoAdDelegate, AODAdBannerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set interstitial delegate
    [Appodeal setInterstitialDelegate:self];
    
   
    // set video ad delegate
    [Appodeal setVideoAdDelegate:self];
}

///////////////////////////////////////////////////////////////////

#pragma - mark Actions

- (IBAction)showInterstitialBanner:(id)sender {
    // show full screen banner
    [Appodeal show:self adType:INTERSTITIAL];
}

- (IBAction)showVideoAd:(id)sender {
    // show video ads
    [Appodeal show:self adType:VIDEO];
}

- (IBAction)showSmallBanner:(id)sender {
    // show small banner and set small banner delegate
    [Appodeal setBannerDelegate:self];
    [Appodeal show:self adType:BANNER_CENTER];
    // view banner from 1 adnetwork
    [Appodeal showWithAdNetworkName:@"applovin" adType:BANNER_BOTTOM rootController:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////

#pragma mark - <AODAdBannerDelegate>

- (void)onAdBannerLoaded:(UIView*)bannerView {
    NSLog(@"AdBanner loaded");
}

- (void)onAdBannerFailedToLoad {
    NSLog(@"AdBanner did failed to load");
}

- (void)onAdBannerShown {
    NSLog(@"AdBanner has been shown");
}

- (void)onAdBannerClicked {
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
