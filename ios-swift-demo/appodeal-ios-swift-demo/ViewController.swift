//
//  ViewController.swift
//  appodeal-ios-swift-demo
//
//  Created by Andrey Tyshlaev on 03/06/15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

import UIKit
import AppodealAds

class ViewController: UIViewController, AODInterstitialDelegate, AODAdBannerDelegate, AODVideoAdDelegate {
   
    @IBAction func showInterstitialBanner(sender: UIButton) {
        Appodeal.show(self, adType: AODAppodealAdType.INTERSTITIAL)
    }
    
    @IBAction func showVideoAd(sender: UIButton) {
        Appodeal.show(self, adType: AODAppodealAdType.VIDEO)
    }
    
    @IBAction func showSmallBanner(sender: UIButton) {
        Appodeal.show(self, adType: AODAppodealAdType.BANNER_BOTTOM)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Appodeal.setInterstitialDelegate(self)
        Appodeal.setVideoAdDelegate(self)
        Appodeal.setBannerDelegate(self)
    }
    
    //MARK: - AODInterstitialDelegate
    
    func onInterstitialAdLoaded(adName: String!, isPrecache: Bool) {
        NSLog("interstitial from %@ did load", adName)
    }
    
    func onInterstitialAdFailedToLoad(adName: String!) {
        NSLog("interstitial from %@ failed to load", adName)
    }
    
    func onInterstitialAdShown(adName: String!) {
        NSLog("interstitial from %@ failed to load", adName)
    }
    
    func onInterstitialAdClicked(adName: String!) {
        NSLog("interstitial from %@ has been clicked", adName)
    }
    
    func onInterstitialAdClosed(adName: String!) {
        NSLog("interstitial from %@ has been closed or dismissed", adName)
    }
    
    //MARK: - AODAdViewDelegate
    
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self;
    }
    
    func onAdBannerLoaded(bannerView: UIView!) {
         NSLog("AdBanner did load")
    }
    
    func onAdBannerFailedToLoad() {
        NSLog("AdBanner did failed to load")
    }
    
    func onAdBannerClicked() {
        NSLog("AdBanner has been clicked")
    }
    
    func onAdBannerShown() {
        NSLog("AdBanner has been shown")
    }
       
    //MARK: - AODVideoAdDelegate
    
    func onVideoLoaded(adName: String!) {
        NSLog("video ad from %@ did load", adName);
    }
    
    func onVideoFailedToLoad(adName: String!) {
        NSLog("video ad from %@ failed to load", adName);
    }
    
    func onVideoShown(adName: String!) {
        NSLog("video ad from %@ shown", adName);
    }
    
    func onVideoClicked(adName: String!) {
        NSLog("video ad from %@ has been clicked", adName);
    }
    
    func onVideoClosed(adName: String!) {
        NSLog("video ad from %@ has been closed or dismissed", adName);
    }
    
    func onVideoFinished(adName: String!) {
        NSLog("video ad from %@ has been completed and user should rewarded virtual currency", adName);
        
    }
}

