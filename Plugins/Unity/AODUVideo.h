//
//  AODUVideo.h
//  Unity-iPhone
//
//  Created by Dmitry B on 19.05.15.
//
//

#import <Foundation/Foundation.h>

#import "AODUTypes.h"

@class AODvideo;
@class AODAdRequestConfig;

/// A wrapper around AODvideo. Includes the ability to create AODvideo objects, load
/// them with ads, show them, and listen for ad events.
@interface AODUVideo : NSObject

/// Initializes a AODUvideo.
- (id)initWithVideoClientReference:(AODUTypeVideoClientRef *)videoClient
                                   appKey:(NSString *)appKey;

/// The video ad.
@property(nonatomic, strong) AODUVideo *video;

/// A reference to the Unity video client.
@property(nonatomic, assign) AODUTypeVideoClientRef *videoClient;

/// The ad received callback into Unity.
@property(nonatomic, assign) AODUVideoDidReceiveAdCallback adReceivedCallback;

/// The ad failed callback into Unity.
@property(nonatomic, assign) AODUVideoDidFailToReceiveAdWithErrorCallback adFailedCallback;

/// The will present screen callback into Unity.
@property(nonatomic, assign) AODUVideoWillPresentScreenCallback willPresentCallback;

/// The did dismiss screen callback into Unity.
@property(nonatomic, assign) AODUVideoDidDismissScreenCallback didDismissCallback;

/// The will leave application callback into Unity.
@property(nonatomic, assign) AODUVideoWillLeaveApplicationCallback willLeaveCallback;

/// when video ad reward user callback into Unity.
@property(nonatomic, assign) AODUVideoAdShouldRewardUserCallback rewardUserCallback;

/// Makes an ad request. Additional targeting options can be supplied with a request object.
- (void)loadRequest:(AODAdRequestConfig *)request;

/// Returns YES if the video is ready to be displayed.
- (BOOL)isReady;

/// Shows the video ad.
- (void)show;

/// cache
- (void)cache;

/// set auto cache
- (void)setAutoCache:(BOOL)autoCache;

/// disable ad network
- (void)disableNetwork:(NSString*)adName;

- (void)showWithAdName:(NSString*)adName;

@end
