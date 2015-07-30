//
//  AppodealBannersViewController.m
//  iosdemo
//
//  Created by Alexander on 30.07.15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#import "AppodealBannersViewController.h"

//#import <Appodeal/Appodeal.h>

@interface AppodealBannersViewController () //<AppodealBannerDelegate>

@end

@implementation AppodealBannersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set banner delegate
    //[Appodeal setBannerDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showBannerTop:(id)sender {
    //show banner in top
    //[Appodeal showAd:AppodealShowStyleBannerTop rootViewController:self];
}

- (IBAction)showBannerCenter:(id)sender {
    //show banner in center
    //[Appodeal showAd:AppodealShowStyleBannerCenter rootViewController:self];
}

- (IBAction)showBannerBottom:(id)sender {
    //show banner in bottom
    //[Appodeal showAd:AppodealShowStyleBannerBottom rootViewController:self];
}

- (IBAction)hideBanner:(id)sender {
    //hide banner
    //[Appodeal hideBanner];
}


- (IBAction)showCustomSize:(id)sender {
    //[[Appodeal banner] removeFromSuperview];
    
    //[[Appodeal banner] setFrame:CGRectMake(0.0f, 200.0f, 320.0f, 100.0f)];
    
    //[self.view addSubview:[Appodeal banner]];
}


#pragma mark - AppodealBannerDelegate

- (void)bannerDidLoadAd {
    NSLog(@"banner did load");
}

- (void)bannerDidFailToLoadAd {
    NSLog(@"banner did fail to load");
}

- (void)bannerDidClick {
    NSLog(@"banner did click");
}

@end
