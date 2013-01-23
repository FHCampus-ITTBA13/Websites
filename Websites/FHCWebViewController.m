//
//  FHCWebViewController.m
//  Websites
//
//  Created by FH Campus on 22.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import "FHCWebViewController.h"

@interface FHCWebViewController () <UIWebViewDelegate>

@end

@implementation FHCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    
    NSLog(@"WebVC didLoad");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"WebVC willAppear");
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self loadWebsite];
    }
    
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
    
    [self.webView stopLoading];
    
    NSLog(@"WebVC didDisappear");
}

- (void)setWebAddress:(NSString *)webAddress {
    _webAddress = webAddress;
    
    self.title = webAddress;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self loadWebsite];
    }
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - Private

- (void)loadWebsite {
    NSURL *URL = [NSURL URLWithString:self.webAddress];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [self.webView loadRequest:request];
}

@end
