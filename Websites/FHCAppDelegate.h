//
//  FHCAppDelegate.h
//  Websites
//
//  Created by FH Campus on 22.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHCWebsitesTableViewController.h"
#import "FHCWebViewController.h"

@interface FHCAppDelegate : UIResponder <UIApplicationDelegate, UISplitViewControllerDelegate, FHCWebsitesDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) FHCWebViewController *webViewController;
@end
