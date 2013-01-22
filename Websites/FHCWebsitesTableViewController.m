//
//  FHCWebsitesTableViewController.m
//  Websites
//
//  Created by FH Campus on 22.01.13.
//  Copyright (c) 2013 FH Campus. All rights reserved.
//

#import "FHCWebsitesTableViewController.h"
#import "FHCWebViewController.h"


#define kFHCTableViewId     @"My Table View Cell"



@interface FHCWebsitesTableViewController ()

@property (nonatomic, strong) NSArray *websites;

@end


@implementation FHCWebsitesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"TableVC didLoad");
    self.title = @"Websites";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"TableVC willAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"TableVC didAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"TableVC willDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"TableVC didDisappear");
}

- (NSArray *)websites {
    if (_websites == nil) {
        _websites = @[@"http://google.at", @"http://amazon.de", @"http://apple.com", @"http://mtdirectionsk.it", @"http://ebay.at"];
    }
    
    return _websites;
}

#pragma mark - UITableViewDataSource

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.websites.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:kFHCTableViewId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kFHCTableViewId];
    }
    
    NSString *website = self.websites[indexPath.row];
    
    cell.textLabel.text = website;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *website = self.websites[indexPath.row];
    
    FHCWebViewController *viewController = [[FHCWebViewController alloc] initWithNibName:nil bundle:nil];
    
    viewController.webAddress = website;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
