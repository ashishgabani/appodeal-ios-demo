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
#endif

@interface AODUBanner () <AODAdViewDelegate>

/// Defines where the ad should be positioned on the screen.
@property(nonatomic, assign) AODBannerType adPosition;

@end

@implementation AODUBanner

/// Returns the Unity view controller.
+ (UIViewController *)unityGLViewController {
#if defined(__has_include) && __has_include("UnityAppController.h")
    return ((UnityAppController *)[UIApplication sharedApplication].delegate).rootViewController;
#else
    return nil;
#endif
}

- (id)initWithBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                           appKey:(NSString *)appKey
                              width:(CGFloat)width
                             height:(CGFloat)height
                         adPosition:(AODBannerType)adPosition {
    return [self initWithBannerClientReference:bannerClient
                                      appKey:appKey
                                    adPosition:adPosition];
}

- (id)initWithSmartBannerSizeAndBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                                             appKey:(NSString *)appKey
                                           adPosition:(AODBannerType)adPosition {
    // Choose the correct Smart Banner constant according to orientation.
    UIDeviceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    AODBannerType adType;
    if (UIInterfaceOrientationIsPortrait(currentOrientation)) {
        adType = kAODBannerPortraitBottom;
    } else {
        adType = kAODBannerLandscapeBottom;
    }
    return [self initWithBannerClientReference:bannerClient
                                      appKey:appKey
                                    adPosition:adPosition];
}

- (id)initWithBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                           appKey:(NSString *)appKey
                         adPosition:(AODBannerType)adPosition {
    self = [super init];
    if (self) {
        _bannerClient = bannerClient;
        _adPosition = adPosition;
        _bannerView = [[AODAdView alloc] initWithBannerType:adPosition];
        _bannerView.delegate = self;
        _bannerView.rootController = [AODUBanner unityGLViewController];
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
    [self.bannerView loadAd];
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

#pragma mark AODAdViewDelegate implementation

- (UIViewController *)viewControllerForPresentingModalView {
    return [AODUBanner unityGLViewController];
}

- (void)adViewDidLoadAd:(AODAdView *)adView {
    UIView *unityView = [[AODUBanner unityGLViewController] view];
    CGPoint center = CGPointMake(CGRectGetMidX(unityView.bounds), CGRectGetMidY(_bannerView.bounds));
    // Position the AODBannerView.
    switch (self.adPosition) {
        case kAODBannerPortraitTop:
            center = CGPointMake(CGRectGetMidX(unityView.bounds), CGRectGetMidY(_bannerView.bounds));
            break;
        case kAODBannerPortraitBottom:
            center = CGPointMake(CGRectGetMidX(unityView.bounds),
                                 CGRectGetMaxY(unityView.bounds) - CGRectGetMidY(_bannerView.bounds));
            break;
        case kAODBannerLandscapeBottom:
            NSLog(@"AppodealAdsPlugin: LandscapeBottom position");
            break;
        case kAODBannerLandscapeTop:
            NSLog(@"AppodealAdsPlugin: LandscapeTop position");
            break;
            /*
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
             */
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

- (void)adViewDidFailToLoadAd:(AODAdView *)adView {
    if (self.adFailedCallback) {
        NSString *errorMsg = [NSString
                              stringWithFormat:@"Failed to receive ad error"];
        self.adFailedCallback(self.bannerClient, [errorMsg cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

- (void)willPresentModalViewForAd:(AODAdView *)adView {
    if (self.willPresentCallback) {
        self.willPresentCallback(self.bannerClient);
    }
}

- (void)didDismissModalViewForAd:(AODAdView *)adView {
    if (self.didDismissCallback) {
        self.didDismissCallback(self.bannerClient);
    }
}

- (void)willLeaveApplicationFromAd:(AODAdView *)adView {
    if (self.willLeaveCallback) {
        self.willLeaveCallback(self.bannerClient);
    }
}

@end
