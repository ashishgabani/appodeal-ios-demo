//
//  AODUBanner.m
//  Appodeal_iOS_SDK
//
//  Created by Dmitry B on 18.05.15.
//  Copyright (c) 2015 if3. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <AppodealAds/Appodeal.h>

#import "AODUBanner.h"

#if defined(__has_include) && __has_include("UnityAppController.h")
    #import "UnityAppController.h"
#else
    #import "EmptyUnityAppController.h"
#endif

@interface AODUBanner () <AODAdBannerDelegate>

/// Defines where the ad should be positioned on the screen.
@property(nonatomic, assign) int adPosition;

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
                         adPosition:(int)adPosition {
    return [self initWithBannerClientReference:bannerClient
                                      appKey:appKey
                                    adPosition:adPosition];
}

- (id)initWithSmartBannerSizeAndBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                                             appKey:(NSString *)appKey
                                           adPosition:(int)adPosition {
    // Choose the correct Smart Banner constant according to orientation.
    UIDeviceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    int adType;
    if (UIInterfaceOrientationIsPortrait(currentOrientation)) {
        adType = BANNER_BOTTOM;
    } else {
        adType = BANNER_BOTTOM;
    }
    return [self initWithBannerClientReference:bannerClient
                                      appKey:appKey
                                    adPosition:BANNER_BOTTOM];
}

- (id)initWithBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                           appKey:(NSString *)appKey
                         adPosition:(int)adPosition {
    self = [super init];
    if (self) {
        _bannerClient = bannerClient;
        _adPosition = adPosition;
    }
    return self;
}

- (void)dealloc {
}

- (void)loadRequest:(AODAdRequestConfig *)request {
        NSLog(@"AppodealAdsPlugin: BannerView is nil. Ignoring ad request.");
        return;
}

- (void)hideBannerView {
        NSLog(@"AppodealAdsPlugin: BannerView is nil. Ignoring call to hideBannerView");
        return;
}

- (void)showBannerView:(int)adTypes {
    NSLog(@"AppodealAdsPlugin: showBannerView");
    UIViewController *unityController = [AODUBanner unityGLViewController];
    [Appodeal show:unityController adType:adTypes];
    return;
}

- (BOOL)isReady {
    return [Appodeal isLoaded:BANNER];
}

- (void)removeBannerView {
        NSLog(@"AppodealAdsPlugin: BannerView is nil. Ignoring call to removeBannerView");
        return;
}

- (void)cache {
    [Appodeal cache:BANNER];
}

- (void)setAutoCache:(BOOL)autoCache {
    [Appodeal setAutoCache:BANNER autoCache:autoCache];
}

- (void)disableNetwork:(NSString*)adName {
    [Appodeal disableAdNetwork:BANNER adName:adName];
}

- (void)showWithAdName:(NSString*)adName {
    NSLog(@"AppodealAdsPlugin: show Banner from %@", adName);
    UIViewController *unityController = [AODUBanner unityGLViewController];
    [Appodeal showWithAdNetworkName:adName adType:BANNER rootController:unityController];
}

- (void)show:(int)adType {
    if ([Appodeal isLoaded:BANNER]) {
        NSLog(@"AppodealAdsPlugin: Banner show.");
        UIViewController *unityController = [AODUBanner unityGLViewController];
        [Appodeal show:unityController adType:adType];
    } else {
        NSLog(@"AppodealAdsPlugin: Banner is not ready to be shown.");
    }
}

#pragma mark AODAdViewDelegate implementation

- (UIViewController *)viewControllerForPresentingModalView {
    return [AODUBanner unityGLViewController];
}

- (void)onAdBannerLoaded:(UIView*)bannerView {
    UIView *unityView = [[AODUBanner unityGLViewController] view];
    CGPoint center = CGPointMake(CGRectGetMidX(unityView.bounds), CGRectGetMidY(bannerView.bounds));
    // Position the AODBannerView.
    switch (self.adPosition) {
        case BANNER_TOP:
            center = CGPointMake(CGRectGetMidX(unityView.bounds), CGRectGetMidY(bannerView.bounds));
            break;
        case BANNER_BOTTOM:
            center = CGPointMake(CGRectGetMidX(unityView.bounds),
                                 CGRectGetMaxY(unityView.bounds) - CGRectGetMidY(bannerView.bounds));
            break;
        default:
            center = CGPointMake(CGRectGetMidX(unityView.bounds),
                                 CGRectGetMaxY(unityView.bounds) - CGRectGetMidY(bannerView.bounds));
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
    [bannerView removeFromSuperview];
    
    // Add the new banner view.
    bannerView.center = center;
    [unityView addSubview:bannerView];
    
    if (self.adReceivedCallback) {
        self.adReceivedCallback(self.bannerClient);
    }
}

- (void)onAdBannerFailedToLoad {
    if (self.adFailedCallback) {
        NSString *errorMsg = [NSString
                              stringWithFormat:@"Failed to receive ad error"];
        self.adFailedCallback(self.bannerClient, [errorMsg cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

- (void)onAdBannerShown {
    if (self.willPresentCallback) {
        self.willPresentCallback(self.bannerClient);
    }
}

- (void)onAdBannerClicked {
    if (self.willLeaveCallback) {
        self.willLeaveCallback(self.bannerClient);
    }
}

@end
