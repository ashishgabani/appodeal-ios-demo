//
//  AODUBanner.m
//  Appodeal_iOS_SDK
//
//  Created by Dmitry B on 18.05.15.
//  Copyright (c) 2015 if3. All rights reserved.
//

@import CoreGraphics;
@import Foundation;
@import UIKit;

#import <AppodealAds/Appodeal.h>
#import "AODUBanner.h"

#if defined(__has_include) && __has_include("UnityAppController.h")
    #import "UnityAppController.h"
#else
    #import "EmptyUnityAppController.h"

@interface AODUBanner () <AODAdBannerDelegate>

/// Defines where the ad should be positioned on the screen.
@property(nonatomic, assign) AODAdPosition adPosition;

@end

@implementation AODUBanner

/// Returns the Unity view controller.
+ (UIViewController *)unityGLViewController {
    return ((UnityAppController *)[UIApplication sharedApplication].delegate).rootViewController;
}

- (id)initWithBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                           appKey:(NSString *)appKey
                              width:(CGFloat)width
                             height:(CGFloat)height
                         adPosition:(AODAdPosition)adPosition {
    return [self initWithBannerClientReference:bannerClient
                                      appKey:appKey
                                    adPosition:adPosition];
}

- (id)initWithSmartBannerSizeAndBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                                             adUnitID:(NSString *)adUnitID
                                           adPosition:(AODAdPosition)adPosition {
    // Choose the correct Smart Banner constant according to orientation.
    UIDeviceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    AODBannerType adType;
    if (UIInterfaceOrientationIsPortrait(currentOrientation)) {
        //adType = kAODBannerPortraitBottom;
    } else {
        //adType = kAODAdSizeSmartBannerLandscape;
    }
    return [self initWithBannerClientReference:bannerClient
                                      appKey:appKey
                                        adSize:adSize
                                    adPosition:adPosition];
}

- (id)initWithBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                           appKey:(NSString *)appKey
                         adPosition:(AODAdPosition)adPosition {
    self = [super init];
    if (self) {
        _bannerClient = bannerClient;
        _adPosition = adPosition;
        _bannerView = [[AODAdView alloc] init];
        _bannerView.adUnitID = adUnitID;
        _bannerView.delegate = self;
        _bannerView.rootViewController = [AODUBanner unityGLViewController];
    }
    return self;
}

- (void)dealloc {
    _bannerView.delegate = nil;
}

- (void)loadRequest:(AODAdRequestConfig *)request {
    if (!self.bannerView) {
        NSLog(@"AppodealAdsPlugin: BannerView is nil. Ignoring ad request.");
        return;
    }
    [self.bannerView loadRequest:request];
}

- (void)hideBannerView {
    if (!self.bannerView) {
        NSLog(@"AppodealAdsPlugin: BannerView is nil. Ignoring call to hideBannerView");
        return;
    }
    self.bannerView.hidden = YES;
}

- (void)showBannerView {
    if (!self.bannerView) {
        NSLog(@"AppodealAdsPlugin: BannerView is nil. Ignoring call to showBannerView");
        return;
    }
    self.bannerView.hidden = NO;
}

- (void)removeBannerView {
    if (!self.bannerView) {
        NSLog(@"AppodealAdsPlugin: BannerView is nil. Ignoring call to removeBannerView");
        return;
    }
    [self.bannerView removeFromSuperview];
}

#pragma mark AODBannerViewDelegate implementation

- (void)adViewDidReceiveAd:(AODAdView *)adView {
    UIView *unityView = [[AODUBanner unityGLViewController] view];
    CGPoint center = CGPointMake(CGRectGetMidX(unityView.bounds), CGRectGetMidY(_bannerView.bounds));
    // Position the AODBannerView.
    switch (self.adPosition) {
        case kAODAdPositionTopOfScreen:
            center = CGPointMake(CGRectGetMidX(unityView.bounds), CGRectGetMidY(_bannerView.bounds));
            break;
        case kAODAdPositionBottomOfScreen:
            center = CGPointMake(CGRectGetMidX(unityView.bounds),
                                 CGRectGetMaxY(unityView.bounds) - CGRectGetMidY(_bannerView.bounds));
            break;
        case kAODAdPositionTopLeftOfScreen:
            center = CGPointMake(CGRectGetMidX(_bannerView.bounds), CGRectGetMidY(_bannerView.bounds));
            break;
        case kAODAdPositionTopRightOfScreen:
            center = CGPointMake(CGRectGetMaxX(unityView.bounds) - CGRectGetMidX(_bannerView.bounds),
                                 CGRectGetMidY(_bannerView.bounds));
            break;
        case kAODAdPositionBottomLeftOfScreen:
            center = CGPointMake(CGRectGetMidX(_bannerView.bounds),
                                 CGRectGetMaxY(unityView.bounds) - CGRectGetMidY(_bannerView.bounds));
            break;
        case kAODAdPositionBottomRightOfScreen:
            center = CGPointMake(CGRectGetMaxX(unityView.bounds) - CGRectGetMidX(_bannerView.bounds),
                                 CGRectGetMaxY(unityView.bounds) - CGRectGetMidY(_bannerView.bounds));
            break;
    }
    
    // Remove existing banner view from superview.
    [self.bannerView removeFromSuperview];
    
    // Add the new banner view.
    self.bannerView = adView;
    self.bannerView.center = center;
    [unityView addSubview:self.bannerView];
    
    if (self.adReceivedCallback) {
        self.adReceivedCallback(self.bannerClient);
    }
}

- (void)adView:(AODAdView *)view didFailToReceiveAdWithError:(NSError *)error {
    if (self.adFailedCallback) {
        NSString *errorMsg = [NSString
                              stringWithFormat:@"Failed to receive ad with error: %@", [error localizedFailureReason]];
        self.adFailedCallback(self.bannerClient, [errorMsg cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

- (void)adViewWillPresentScreen:(AODAdView *)adView {
    if (self.willPresentCallback) {
        self.willPresentCallback(self.bannerClient);
    }
}

- (void)adViewWillDismissScreen:(AODAdView *)adView {
    if (self.willDismissCallback) {
        self.willDismissCallback(self.bannerClient);
    }
}

- (void)adViewDidDismissScreen:(AODAdView *)adView {
    if (self.didDismissCallback) {
        self.didDismissCallback(self.bannerClient);
    }
}

- (void)adViewWillLeaveApplication:(AODAdView *)adView {
    if (self.willLeaveCallback) {
        self.willLeaveCallback(self.bannerClient);
    }
}

@end
