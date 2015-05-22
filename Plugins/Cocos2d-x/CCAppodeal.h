//
//  CCAppodeal.h
//  iosdemo
//
//  Created by Dmitry B on 21.05.15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#ifndef CCAPPODEAL_H_
#define CCAPPODEAL_H_

class CCAppodeal {
    
public:
    static CCAppodeal * getInstance();
    
    void init(const char *appkey);
    // show banner ad
    void showBanner();
    // show interstitial
    void showInterstitial();
    // show video
    void showVideo();
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
    
    virtual void adInterstitialReceived() {}
    virtual void adInterstitialFailed() {}
    virtual void adInterstitialShown() {}
    virtual void adInterstitialClosed() {}
    virtual void adInterstitialClicked() {}
    
};

class CCAppodealVideoDelegate
{
public:
    
    virtual void adVideoRewardedUser(int amount) {}
    virtual void adVideoReceived() {}
    virtual void adVideoFailed() {}
    virtual void adVideoShown() {}
    virtual void adVideoClosed() {}
    virtual void adVideoClicked() {}
    
};

#endif
