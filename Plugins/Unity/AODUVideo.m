//
//  AODUVideo.m
//  Unity-iPhone
//
//  Created by Dmitry B on 19.05.15.
//
//

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <AppodealAds/Appodeal.h>

#import "AODUVideo.h"

#if defined(__has_include) && __has_include("UnityAppController.h")
    #import "UnityAppController.h"
#else
    #import "EmptyUnityAppController.h"
#endif

@interface AODUVideo () <AODVideoAdDelegate>
@end

@implementation AODUVideo

+ (UIViewController *)unityGLViewController {
    return ((UnityAppController *)[UIApplication sharedApplication].delegate).rootViewController;
}

- (id)initWithVideoClientReference:(AODUTypeVideoClientRef *)videoClient
                                   appKey:(NSString *)appKey {
    self = [super init];
    if (self) {
        _videoClient = videoClient;
    }
    return self;
}

- (void)dealloc {
    //_video.delegate = nil;
}

- (void)loadRequest:(AODAdRequestConfig *)request {
}

- (void)cache {
    [Appodeal cache:VIDEO];
}

- (void)setAutoCache:(BOOL)autoCache {
    [Appodeal setAutoCache:VIDEO autoCache:autoCache];
}

- (void)disableNetwork:(NSString*)adName {
    [Appodeal disableAdNetwork:VIDEO adName:adName];
}

- (BOOL)isReady {
    return [Appodeal isLoaded:VIDEO];
}

- (void)showWithAdName:(NSString*)adName {
    NSLog(@"AppodealAdsPlugin: show video from %@", adName);
    UIViewController *unityController = [AODUVideo unityGLViewController];
    [Appodeal showWithAdNetworkName:adName adType:VIDEO rootController:unityController];
}

- (void)show {
    if ([Appodeal isLoaded:VIDEO]) {
        UIViewController *unityController = [AODUVideo unityGLViewController];
        [Appodeal show:unityController adType:VIDEO];
    } else {
        NSLog(@"AppodealAdsPlugin: Video is not ready to be shown.");
    }
}

#pragma mark AODInterstitialDelegate implementation

- (void)onVideoAdDidLoad:(NSString*)adName {
    NSLog(@"video ad from %@ did load", adName);
    if (self.adReceivedCallback) {
        self.adReceivedCallback(self.videoClient);
    }
}

- (void)onVideoAdDidFailToLoad:(NSString*)adName {
    NSLog(@"video ad from %@ failed to load", adName);
    if(self.adFailedCallback) {
        self.adFailedCallback(self.videoClient, [@"error video" cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

- (void)onVideoAdDidAppear:(NSString*)adName {
    NSLog(@"video ad from %@ shown", adName);
    if (self.willPresentCallback) {
        self.willPresentCallback(self.videoClient);
    }
}

- (void)onVideoAdDidReceiveTapEvent:(NSString*)adName {
    NSLog(@"video ad from %@ has been clicked", adName);
    if (self.willLeaveCallback) {
        self.willLeaveCallback(self.videoClient);
    }
}

- (void)onVideoAdDidDisappear:(NSString*)adName {
    NSLog(@"video ad from %@ has been closed or dismissed", adName);
    if (self.didDismissCallback) {
        self.didDismissCallback(self.videoClient);
    }
}

- (void)onVideoAdShouldRewardUser:(NSString*)adName reward:(int)amount {
    NSLog(@"video ad from %@ has been completed and user rewarded %d virtual currency", adName, amount);
    if (self.rewardUserCallback) {
        self.rewardUserCallback(self.videoClient, amount);
    }
}

@end

