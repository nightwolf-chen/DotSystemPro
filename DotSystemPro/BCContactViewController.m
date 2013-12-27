//
//  BCContactViewController.m
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-27.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import "BCContactViewController.h"

@interface BCContactViewController ()

@end

@implementation BCContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:UITabBarSystemItemContacts];
        self.tabBarItem = item;
        [item release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
