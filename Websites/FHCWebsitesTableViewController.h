//
//  FHCWebsitesTableViewController.h
//  Websites
//
//  Created by FH Campus on 22.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FHCWebsitesDelegate;

@interface FHCWebsitesTableViewController : UITableViewController

@property (nonatomic, weak) id<FHCWebsitesDelegate> delegate;

@end


@protocol FHCWebsitesDelegate <NSObject>

- (void)websitesViewController:(FHCWebsitesTableViewController *)websiteViewController didSelectWebsiteWithAddress:(NSString *)address;

@end