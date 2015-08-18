//
//  AppodealHubViewController.m
//  iosdemo
//
//  Created by Alexander on 30.07.15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#import "AppodealHubViewController.h"

#import <Appodeal/Appodeal.h>

@interface AppodealHubViewController () <AppodealInterstitialDelegate,AppodealVideoDelegate>

@end

@implementation AppodealHubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set Interstitial Delegate
    [Appodeal setInterstitialDelegate:self];
    
    //set Video Delegate
    [Appodeal setVideoDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0){
        if (indexPath.row == 0) {
            // show full screen banner
            [Appodeal showAd:AppodealShowStyleInterstitial rootViewController:self];
        }

        if (indexPath.row == 1) {
            // show video ads
            [Appodeal showAd:AppodealShowStyleVideo rootViewController:self];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - AppodealInterstitialDelegate

- (void)interstitialDidLoadAd {
    NSLog(@"interstitial did load");
}

- (void)interstitialDidFailToLoadAd {
    NSLog(@"interstitial did fail to load");
}

- (void)interstitialWillPresent {
    NSLog(@"interstitial will present");
}

- (void)interstitialDidDismiss {
    NSLog(@"interstitial did dismiss");
}

- (void)interstitialDidClick {
    NSLog(@"interstital did click");
}

#pragma mark - AppodealVideoDelegate

- (void)videoDidLoadAd {
    NSLog(@"video did load");
}

- (void)videoDidFailToLoadAd {
    NSLog(@"video did fail to load");
}

- (void)videoDidPresent {
    NSLog(@"video ad did present");
}

- (void)videoWillDismiss {
    NSLog(@"vide ad will dismiss");
}

- (void)videoDidFinish {
    NSLog(@"video ad did finish");
}

@end
