//
//  AODUInterstitial.m
//  Unity-iPhone
//
//  Created by Dmitry B on 19.05.15.
//
//

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <AppodealAds/Appodeal.h>

#import "AODUInterstitial.h"

#if defined(__has_include) && __has_include("UnityAppController.h")
    #import "UnityAppController.h"
#else
    #import "EmptyUnityAppController.h"
#endif

@interface AODUInterstitial () <AODInterstitialDelegate>
@end

@implementation AODUInterstitial

+ (UIViewController *)unityGLViewController {
    return ((UnityAppController *)[UIApplication sharedApplication].delegate).rootViewController;
}

- (id)initWithInterstitialClientReference:(AODUTypeInterstitialClientRef *)interstitialClient
                                 appKey:(NSString *)appKey {
    self = [super init];
    if (self) {
        _interstitialClient = interstitialClient;
    }
    return self;
}

- (void)dealloc {
    //_interstitial.delegate = nil;
}

- (void)loadRequest:(AODAdRequestConfig *)request {
    //[self.interstitial loadRequest:request];
}

- (void)cache {
    [Appodeal cache:INTERSTITIAL];
}

- (void)setAutoCache:(BOOL)autoCache {
    [Appodeal setAutoCache:INTERSTITIAL autoCache:autoCache];
}

- (void)disableNetwork:(NSString*)adName {
    [Appodeal disableAdNetwork:INTERSTITIAL adName:adName];
}

- (BOOL)isReady {
    return [Appodeal isLoaded:INTERSTITIAL];
}

- (void)showWithAdName:(NSString*)adName {
    NSLog(@"AppodealAdsPlugin: show Interstitial from %@", adName);
    UIViewController *unityController = [AODUInterstitial unityGLViewController];
    [Appodeal showWithAdNetworkName:adName adType:INTERSTITIAL rootController:unityController];
}

- (void)show {
    if ([Appodeal isLoaded:INTERSTITIAL]) {
        NSLog(@"AppodealAdsPlugin: Interstitial show.");
        UIViewController *unityController = [AODUInterstitial unityGLViewController];
        [Appodeal show:unityController adType:INTERSTITIAL];
    } else {
        NSLog(@"AppodealAdsPlugin: Interstitial is not ready to be shown.");
    }
}

#pragma mark AODInterstitialDelegate implementation

- (void)onInterstitialAdLoaded:(NSString*)adName isPrecache:(BOOL)isPrecache {
    NSLog(@"interstitial from %@ did load", adName);
    if (self.adReceivedCallback) {
        self.adReceivedCallback(self.interstitialClient);
    }
}

- (void)onInterstitialAdFailedToLoad:(NSString*)adName {
    NSLog(@"interstitial from %@ failed to load", adName);
    self.adFailedCallback(self.interstitialClient, [@"error interstitial" cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void)onInterstitialAdShown:(NSString*)adName {
    NSLog(@"interstitial from %@ shown", adName);
    if (self.willPresentCallback) {
        self.willPresentCallback(self.interstitialClient);
    }
}

- (void)onInterstitialAdClicked:(NSString*)adName {
    NSLog(@"interstitial from %@ has been clicked", adName);
    if (self.willLeaveCallback) {
        self.willLeaveCallback(self.interstitialClient);
    }
}

- (void)onInterstitialAdClosed:(NSString*)adName {
    NSLog(@"interstitial from %@ has been closed or dismissed", adName);
    if (self.didDismissCallback) {
        self.didDismissCallback(self.interstitialClient);
    }
}

@end
