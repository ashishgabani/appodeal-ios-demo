//
//  AODUTypes.h
//  Appodeal_iOS_SDK
//
//  Created by Dmitry B on 18.05.15.
//  Copyright (c) 2015 if3. All rights reserved.
//

/// Base type representing a AODU* pointer.
typedef const void *AODUTypeRef;

/// Type representing a Unity banner client.
typedef const void *AODUTypeBannerClientRef;

/// Type representing a Unity interstitial client.
typedef const void *AODUTypeInterstitialClientRef;

/// Type representing a Unity Video client.
typedef const void *AODUTypeVideoClientRef;

/// Type representing a AODUBanner.
typedef const void *AODUTypeBannerRef;

/// Type representing a AODUInterstitial.
typedef const void *AODUTypeInterstitialRef;

/// Type representing a AODUInterstitial.
typedef const void *AODUTypeVideoRef;

/// Type representing a AODURequest.
typedef const void *AODUTypeRequestRef;

/// Callback for when a banner ad request was successfully loaded.
typedef void (*AODUAdViewDidReceiveAdCallback)(AODUTypeBannerClientRef *bannerClient);

/// Callback for when a banner ad request failed.
typedef void (*AODUAdViewDidFailToReceiveAdWithErrorCallback)(AODUTypeBannerClientRef *bannerClient,
const char *error);

/// Callback for when a full screen view is about to be presented as a result of a banner click.
typedef void (*AODUAdViewWillPresentScreenCallback)(AODUTypeBannerClientRef *bannerClient);

/// Callback for when a full screen view is about to be dismissed.
typedef void (*AODUAdViewWillDismissScreenCallback)(AODUTypeBannerClientRef *bannerClient);

/// Callback for when a full screen view has just been dismissed.
typedef void (*AODUAdViewDidDismissScreenCallback)(AODUTypeBannerClientRef *bannerClient);

/// Callback for when an application will background or terminate as a result of a banner click.
typedef void (*AODUAdViewWillLeaveApplicationCallback)(AODUTypeBannerClientRef *bannerClient);


// Interstitial

/// Callback for when a interstitial ad request was successfully loaded.
typedef void (*AODUInterstitialDidReceiveAdCallback)(
AODUTypeInterstitialClientRef *interstitialClient);

/// Callback for when an interstitial ad request failed.
typedef void (*AODUInterstitialDidFailToReceiveAdWithErrorCallback)(
AODUTypeInterstitialClientRef *interstitialClient, const char *error);

/// Callback for when an interstitial is about to be presented.
typedef void (*AODUInterstitialWillPresentScreenCallback)(
AODUTypeInterstitialClientRef *interstitialClient);

/// Callback for when an interstitial is about to be dismissed.
typedef void (*AODUInterstitialWillDismissScreenCallback)(
AODUTypeInterstitialClientRef *interstitialClient);

/// Callback for when an interstitial has just been dismissed.
typedef void (*AODUInterstitialDidDismissScreenCallback)(
AODUTypeInterstitialClientRef *interstitialClient);

/// Callback for when an application will background or terminate because of an interstitial click.
typedef void (*AODUInterstitialWillLeaveApplicationCallback)(
AODUTypeInterstitialClientRef *interstitialClient);

// Video

/// Callback for when video ad reward user
typedef void (*AODUVideoAdShouldRewardUserCallback)(
AODUTypeVideoClientRef *videoClient, const int amount);

/// Callback for when a video ad request was successfully loaded.
typedef void (*AODUVideoDidReceiveAdCallback)(
AODUTypeVideoClientRef *videoClient);

/// Callback for when an video ad request failed.
typedef void (*AODUVideoDidFailToReceiveAdWithErrorCallback)(
AODUTypeInterstitialClientRef *videoClient, const char *error);

/// Callback for when an video is about to be presented.
typedef void (*AODUVideoWillPresentScreenCallback)(
AODUTypeVideoClientRef *videoClient);

/// Callback for when an video has just been dismissed.
typedef void (*AODUVideoDidDismissScreenCallback)(
AODUTypeVideoClientRef *videoClient);

/// Callback for when an application will background or terminate because of an video click.
typedef void (*AODUVideoWillLeaveApplicationCallback)(
AODUTypeVideoClientRef *videoClient);
