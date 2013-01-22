//
//  FHCWebViewController.m
//  Websites
//
//  Created by FH Campus on 22.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import "FHCWebViewController.h"

@interface FHCWebViewController ()

@end

@implementation FHCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"WebVC didLoad");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"WebVC willAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"WebVC didAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"WebVC willDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"WebVC didDisappear");
}

- (void)setWebAddress:(NSString *)webAddress {
    _webAddress = webAddress;
    
    self.title = webAddress;
}

@end
