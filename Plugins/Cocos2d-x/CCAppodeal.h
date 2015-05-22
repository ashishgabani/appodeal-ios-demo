//
//  CCAppodeal.h
//  iosdemo
//
//  Created by Dmitry B on 21.05.15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#ifndef CCAPPODEAL_H_
#define CCAPPODEAL_H_

typedef enum _aodccBannerType
{
    kBannerPortraitTop,
    kBannerPortraitBottom,
    kBannerLandscapeTop,
    kBannerLandscapeBottom,
}
AODCCBannerType;

class CCAppodealBannerDelegate;
class CCAppodealInterstitialDelegate;
class CCAppodealVideoDelegate;

class CCAppodeal {
    
public:
    static CCAppodeal * getInstance();
    
    void init(const char *appkey);
    // show banner ad
    void showBanner(AODCCBannerType type);
    // show interstitial
    void showInterstitial();
    // show video
    void showVideo();
    
    CCAppodealBannerDelegate* getBannerDelegate();
    CCAppodealInterstitialDelegate* getInterstitialDelegate();
    CCAppodealVideoDelegate* getVideoDelegate();
    
    void setBannerDelegate(CCAppodealBannerDelegate* delegate);
    void setInterstitialDelegate(CCAppodealInterstitialDelegate* delegate);
    void setVideoDelegate(CCAppodealVideoDelegate* delegate);
    
private:
    CCAppodealBannerDelegate* bannerDelegate;
    CCAppodealInterstitialDelegate* interstitialDelegate;
    CCAppodealVideoDelegate* videoDelegate;
};

class CCAppodealBannerDelegate
{
public:
    
    virtual void adBannerReceived() {}
    virtual void adBannerFailed() {}
    virtual void adBannerShown() {}
    virtual void adBannerClosed() {}
    virtual void adBannerClicked() {}
};

class CCAppodealInterstitialDelegate
{
public:
    
    virtual void interstitialAdReceived() {}
    virtual void interstitialAdFailed() {}
    virtual void interstitialAdShown() {}
    virtual void interstitialAdClosed() {}
    virtual void interstitialAdClicked() {}
    
};

class CCAppodealVideoDelegate
{
public:
    
    virtual void videoAdRewardedUser(int amount) {}
    virtual void videoAdReceived() {}
    virtual void videoAdFailed() {}
    virtual void videoAdShown() {}
    virtual void videoAdClosed() {}
    virtual void videoAdClicked() {}
    
};

#endif
