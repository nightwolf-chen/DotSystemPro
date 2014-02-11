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
#import "BCDragablePictureView.h"

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

- (id)initWithStyle:(UITableViewStyle)style numberOfGroup:(int)num
{
    self = [super initWithStyle:style];
    if (self) {
        
        NSMutableArray *tmpArray = [NSMutableArray array];
        
        while (num && num-- > 0) {
            
            int picturesNumber = 7 ;
            NSMutableArray *randomPictures = [NSMutableArray array];
            while (picturesNumber --) {
                BCDragablePictureView *picture = [[BCDragablePictureView alloc] initPlanePicture];
                [randomPictures addObject:picture];
                [picture release];
            }
            
            BCDragSegmentView *view = [[BCDragSegmentView alloc] initWithPictures:randomPictures];
            [tmpArray addObject:view];
            [view release];
            
        }
        
        _segments = [[NSArray arrayWithArray:tmpArray] retain];
        
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
       
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
        BCDragSegmentView *segmentView = [_segments objectAtIndex:[indexPath row]];
        cell = [[BCDragGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier segmentView:segmentView];
        [cell autorelease];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BCDragSegmentView *view = [_segments objectAtIndex:[indexPath row]];
    return view.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_segments count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
