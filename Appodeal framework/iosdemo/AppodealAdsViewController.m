//
//  HubViewController.m
//  AppodealSandbox
//
//  Created by Ivan Doroshenko on 06/07/15.
//  Copyright (c) 2015 Appodeal, Inc. All rights reserved.
//

#import <Appodeal/Appodeal.h>
#import "AppodealAdsViewController.h"



@interface HubViewController () <AppodealInterstitialDelegate, AppodealVideoDelegate>

@property (strong, nonatomic) IBOutlet UITableView *hubTableView;
@property (weak, nonatomic) IBOutlet UITableViewCell *showInterstitialCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *showVideoCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *showBannerCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *showInterstitialOrVideoCell;

@property (nonatomic) BOOL interstitialNotReady;
@property (nonatomic) BOOL videoNotReady;

@end

@implementation HubViewController

- (void)configureCellForReady:(UITableViewCell *)cell {
    cell.detailTextLabel.text = @"Ready";
}

- (void)configureCellForFail:(UITableViewCell *)cell {
    cell.detailTextLabel.text = @"Failed";
}

- (void)configureCellForDisabled:(UITableViewCell *)cell {
    cell.detailTextLabel.text = @"Disabled";
}

- (void)updateCells {
    if (self.adType & AppodealAdTypeInterstitial) {
            [self configureCellForReady:self.showInterstitialCell];
    } else
        [self configureCellForDisabled:self.showInterstitialCell];
    
    if (self.adType & AppodealAdTypeVideo) {
        [self configureCellForReady:self.showVideoCell];
    } else {
        [self configureCellForDisabled:self.showVideoCell];
    }
    
    if ((self.adType & AppodealAdTypeInterstitial) || (self.adType & AppodealAdTypeVideo)) {
            [self configureCellForReady:self.showInterstitialOrVideoCell];
    } else {
        [self configureCellForDisabled:self.showInterstitialOrVideoCell];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [Appodeal setInterstitialDelegate:self];
    [Appodeal setVideoDelegate:self];
  //  [self updateCells];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
 //   [self updateCells];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 0 || indexPath.section == 1) {
        AppodealShowStyle style = (AppodealShowStyle)cell.tag;
        [Appodeal showAd:style rootViewController:self];
       // [self updateCells];
    }
    if (cell.tag == 99) {
        [Appodeal showAd:AppodealShowStyleVideoOrInterstitial rootViewController:self];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - AppodealInterstitialDelegate

- (void)interstitialDidLoadAd {
   // [self updateCells];
    
}

- (void)interstitialDidFailToLoadAd {
    //[self configureCellForFail:self.showInterstitialCell];
}

#pragma mark - AppodealVideoDelegate

- (void)videoDidLoadAd {
   // [self updateCells];
}

- (void)videoDidFailToLoadAd {
   // [self configureCellForFail:self.showVideoCell];
}

@end

