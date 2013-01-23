//
//  FHCWebViewController.h
//  Websites
//
//  Created by FH Campus on 22.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FHCWebViewController : UIViewController

@property (nonatomic, strong) NSString *webAddress;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
