//
//  ViewController.m
//  iosdemo
//
//  Created by supergoodd on 4/23/15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#import "ViewController.h"
#import <AppodealAds/Appodeal.h>

@interface ViewController () <AODInterstitialDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set delegate
    [Appodeal setInterstitialDelegate:self];
}

- (IBAction)showInterstitialBanner:(id)sender {
    // show full screen banner
    [Appodeal showInterstitial:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
