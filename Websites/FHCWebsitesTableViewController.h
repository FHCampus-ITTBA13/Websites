//
//  FHCWebsitesTableViewController.h
//  Websites
//
//  Created by FH Campus on 22.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHCWebsiteDelegate.h"


@interface FHCWebsitesTableViewController : UITableViewController

@property (nonatomic, weak) id<FHCWebsitesDelegate> delegate;

@end
