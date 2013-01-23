//
//  FHCWebsiteDelegate.h
//  Websites
//
//  Created by FH Campus on 23.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//


@class FHCWebsitesTableViewController;

@protocol FHCWebsitesDelegate <NSObject>

- (void)websitesViewController:(FHCWebsitesTableViewController *)websiteViewController didSelectWebsiteWithAddress:(NSString *)address;

@end
