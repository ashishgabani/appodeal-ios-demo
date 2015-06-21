//
//  AODUInterstitial.h
//  Unity-iPhone
//
//  Created by Dmitry B on 19.05.15.
//
//

#import <Foundation/Foundation.h>

#import "AODUTypes.h"

@class AODInterstitial;
@class AODAdRequestConfig;

/// A wrapper around AODInterstitial. Includes the ability to create AODInterstitial objects, load
/// them with ads, show them, and listen for ad events.
@interface AODUInterstitial : NSObject

/// Initializes a AODUInterstitial.
- (id)initWithInterstitialClientReference:(AODUTypeInterstitialClientRef *)interstitialClient
                                 appKey:(NSString *)appKey;

/// The interstitial ad.
@property(nonatomic, strong) AODInterstitial *interstitial;

/// A reference to the Unity interstitial client.
@property(nonatomic, assign) AODUTypeInterstitialClientRef *interstitialClient;

/// The ad received callback into Unity.
@property(nonatomic, assign) AODUInterstitialDidReceiveAdCallback adReceivedCallback;

/// The ad failed callback into Unity.
@property(nonatomic, assign) AODUInterstitialDidFailToReceiveAdWithErrorCallback adFailedCallback;

/// The will present screen callback into Unity.
@property(nonatomic, assign) AODUInterstitialWillPresentScreenCallback willPresentCallback;

/// The will dismiss screen callback into Unity.
@property(nonatomic, assign) AODUInterstitialWillDismissScreenCallback willDismissCallback;

/// The did dismiss screen callback into Unity.
@property(nonatomic, assign) AODUInterstitialDidDismissScreenCallback didDismissCallback;

/// The will leave application callback into Unity.
@property(nonatomic, assign) AODUInterstitialWillLeaveApplicationCallback willLeaveCallback;

/// Makes an ad request. Additional targeting options can be supplied with a request object.
- (void)loadRequest:(AODAdRequestConfig *)request;

/// Returns YES if the interstitial is ready to be displayed.
- (BOOL)isReady;

/// Shows the interstitial ad.
- (void)show;

/// cache
- (void)cache;

/// set auto cache
- (void)setAutoCache:(BOOL)autoCache;

/// disable ad network
- (void)disableNetwork:(NSString*)adName;

- (void)showWithAdName:(NSString*)adName;

@end
