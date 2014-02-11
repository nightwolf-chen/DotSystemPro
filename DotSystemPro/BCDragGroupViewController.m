//
//  BCDragGroupViewController.m
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import "BCDragGroupViewController.h"
#import "BCDragGroupCell.h"
#import "BCDragSegmentView.h"

@interface BCDragGroupViewController ()

@end

@implementation BCDragGroupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:UITabBarSystemItemBookmarks];
        self.tabBarItem = tabBarItem;
        [tabBarItem release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"segmentCell";
    BCDragGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        BCDragSegmentView *segmentView = [[BCDragSegmentView alloc] init];
        cell = [[BCDragGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier segmentView:segmentView];
    }
    
    return [cell autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BCDragGroupCell *cell = (BCDragGroupCell *)[tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

@end
