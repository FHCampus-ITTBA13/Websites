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

@property (nonatomic, strong) NSMutableArray *websites;

@end


@implementation FHCWebsitesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"TableVC didLoad");
    self.title = @"Websites";
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    
    self.refreshControl = refreshControl;
    [self.refreshControl addTarget:self
                            action:@selector(handleRefresh)
                  forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleAddPress)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"TableVC willAppear");
    
    [self loadWebsites];
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
    
    [self.delegate websitesViewController:self didSelectWebsiteWithAddress:website];
}

#pragma mark - Private

- (void)handleRefresh {
    [self loadWebsites];
}

- (void)handleAddPress {
    int random = arc4random() % 100;
    NSString *address = [NSString stringWithFormat:@"http://website%d.com", random];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.websites.count inSection:0];
    
    [self.websites addObject:address];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationFade];
}

- (void)loadWebsites {
    NSString *address = @"https://dl.dropbox.com/u/30880/websites.txt";
    NSURL *URL = [NSURL URLWithString:address];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *r, NSData *data, NSError *error) {
                                           
                                           NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                           
                                           NSArray *websites = [s componentsSeparatedByString:@","];
                                           
                                           self.websites = [websites mutableCopy];
                                           [self.tableView reloadData];
                                           [self.refreshControl endRefreshing];
                                       }];
}

@end
