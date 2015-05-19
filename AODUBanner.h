//
//  AODUBanner.h
//  Appodeal_iOS_SDK
//
//  Created by Dmitry B on 18.05.15.
//  Copyright (c) 2015 if3. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

#import "AODUTypes.h"

@class AODAdView;
@class AODAdRequestConfig;

/// Positions to place a banner.
typedef NS_ENUM(NSUInteger, AODAdPosition) {
    kAODAdPositionTopOfScreen = 0,         ///< Ad positioned at top of screen.
    kAODAdPositionBottomOfScreen = 1,      ///< Ad positioned at bottom of screen.
    kAODAdPositionTopLeftOfScreen = 2,     ///< Ad positioned at top left of screen.
    kAODAdPositionTopRightOfScreen = 3,    ///< Ad positioned at top right of screen.
    kAODAdPositionBottomLeftOfScreen = 4,  ///< Ad positioned at bottom left of screen.
    kAODAdPositionBottomRightOfScreen = 5  ///< Ad positioned at bottom right of screen.
};

/// A wrapper around AODBannerView. Includes the ability to create AODBannerView objects, load them
/// with ads, and listen for ad events.
@interface AODUBanner : NSObject

/// Initializes a AODUBanner with specified width and height, positioned at either the top or
/// bottom of the screen.
- (id)initWithBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                           appKey:(NSString *)appKey
                         adPosition:(AODAdPosition)adPosition;

/// Initializes a full-width AODUBanner, positioned at either the top or bottom of the screen.
- (id)initWithSmartBannerSizeAndBannerClientReference:(AODUTypeBannerClientRef *)bannerClient
                                             appKey:(NSString *)appKey
                                           adPosition:(AODAdPosition)adPosition;

/// A reference to the Unity banner client.
@property(nonatomic, assign) AODUTypeBannerClientRef *bannerClient;

/// A AODBannerView which contains the ad.
@property(nonatomic, strong) AODAdView *bannerView;

/// The ad received callback into Unity.
@property(nonatomic, assign) AODUAdViewDidReceiveAdCallback adReceivedCallback;

/// The ad failed callback into Unity.
@property(nonatomic, assign) AODUAdViewDidFailToReceiveAdWithErrorCallback adFailedCallback;

/// The will present screen callback into Unity.
@property(nonatomic, assign) AODUAdViewWillPresentScreenCallback willPresentCallback;

/// The will dismiss screen callback into Unity.
@property(nonatomic, assign) AODUAdViewWillDismissScreenCallback willDismissCallback;

/// The did dismiss screen callback into Unity.
@property(nonatomic, assign) AODUAdViewDidDismissScreenCallback didDismissCallback;

/// The will leave application callback into Unity.
@property(nonatomic, assign) AODUAdViewWillLeaveApplicationCallback willLeaveCallback;

/// Makes an ad request. Additional targeting options can be supplied with a request object.
- (void)loadRequest:(AODAdRequestConfig *)request;

/// Makes the AODBannerView hidden on the screen.
- (void)hideBannerView;

/// Makes the AODBannerView visible on the screen.
- (void)showBannerView;

/// Removes the AODBannerView from the view hierarchy.
- (void)removeBannerView;

@end
