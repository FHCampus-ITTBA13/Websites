//
//  FHCAppDelegate.m
//  Websites
//
//  Created by FH Campus on 22.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import "FHCAppDelegate.h"
#import "FHCWebsitesTableViewController.h"
#import "FHCWebViewController.h"


@implementation FHCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    FHCWebsitesTableViewController *websitesViewController = [[FHCWebsitesTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    websitesViewController.delegate = self;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // iPad
        UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
        self.webViewController = [[FHCWebViewController alloc] initWithNibName:nil bundle:nil];
        
        splitViewController.viewControllers = @[websitesViewController, self.webViewController];
        splitViewController.delegate = self;
        
        self.window.rootViewController = splitViewController;
    } else {
        // iPhone or iPod Touch
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:websitesViewController];
        
        self.window.rootViewController = navigationController;
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - UISplitViewControllerDelegate

- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation {
    return NO;
}

#pragma mark - FHCWebsiteDelegate

- (void)websitesViewController:(FHCWebsitesTableViewController *)websiteViewController didSelectWebsiteWithAddress:(NSString *)address {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.webViewController.webAddress = address;
    } else {
        FHCWebViewController *viewController = [[FHCWebViewController alloc] initWithNibName:nil bundle:nil];
        
        viewController.webAddress = address;
        
        [websiteViewController.navigationController pushViewController:viewController animated:YES];
    }
}

@end
