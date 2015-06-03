//
//  ViewController.swift
//  appodeal-ios-swift-demo
//
//  Created by Andrey Tyshlaev on 03/06/15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AODInterstitialDelegate, AODAdViewDelegate, AODVideoAdDelegate {
    var bannerView: AODAdView  =   AODAdView()
    
    @IBAction func showInterstitialBanner(sender: UIButton) {
        Appodeal.showInterstitial(self);
    }
    
    @IBAction func showVideoAd(sender: UIButton) {
        Appodeal.showVideoAd(self);
    }
    
    @IBAction func showSmallBanner(sender: UIButton) {
        self.bannerView.delegate = self;
        self.bannerView.rootController = self;
        self.bannerView.disableAutoRefresh();
        self.bannerView.loadAd();
        self.view.addSubview(self.bannerView);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Appodeal.setInterstitialDelegate(self);
        Appodeal.setVideoAdDelegate(self);
    }
    
    //MARK: - AODInterstitialDelegate
    
    func onInterstitialAdLoaded(adName: String!, isPrecache: Bool) {
        NSLog("interstitial from %@ did load", adName);
    }
    
    func onInterstitialAdFailedToLoad(adName: String!) {
        NSLog("interstitial from %@ failed to load", adName);
    }
    
    func onInterstitialAdShown(adName: String!) {
        NSLog("interstitial from %@ failed to load", adName);
    }
    
    func onInterstitialAdClicked(adName: String!) {
        NSLog("interstitial from %@ has been clicked", adName);
    }
    
    func onInterstitialAdClosed(adName: String!) {
        NSLog("interstitial from %@ has been closed or dismissed", adName);
    }
    
    //MARK: - AODAdViewDelegate
    
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self;
    }
    
    func adViewDidLoadAd(view: AODAdView!) {
        NSLog("AdBanner did load");
    }
    
    func adViewDidFailToLoadAd(view: AODAdView!) {
        NSLog("AdBanner did failed to load");
    }
    
    func willPresentModalViewForAd(view: AODAdView!) {
        NSLog("AdBanner has been shown");
    }
    
    func didDismissModalViewForAd(view: AODAdView!) {
        NSLog("Did Dismiss Modal View For Ad");
    }
    
    func willLeaveApplicationFromAd(view: AODAdView!) {
        NSLog("Will Leave Application From Ad");
    }
    
    //MARK: - AODVideoAdDelegate
    
    func onVideoAdDidLoad(adName: String!) {
        NSLog("video ad from %@ did load", adName);
    }
    
    func onVideoAdDidFailToLoad(adName: String!) {
        NSLog("video ad from %@ failed to load", adName);
    }
    
    func onVideoAdDidAppear(adName: String!) {
        NSLog("video ad from %@ failed to load", adName);
    }
    
    func onVideoAdDidReceiveTapEvent(adName: String!) {
        NSLog("video ad from %@ has been clicked", adName);
    }
    
    func onVideoAdDidDisappear(adName: String!) {
        NSLog("video ad from %@ has been closed or dismissed", adName);
    }
    
    func onVideoAdShouldRewardUser(adName: String!, reward amount: Int32) {
        NSLog("video ad from %@ has been completed and user rewarded %d virtual currency", adName, amount);
        
    }
}

