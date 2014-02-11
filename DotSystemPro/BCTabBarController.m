//
//  BCTabBarController.m
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-27.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import "BCTabBarController.h"
#import "BCMessageViewController.h"
#import "BCContactViewController.h"
#import "BCRecommendViewController.h"
#import "BCSettingViewController.h"
#import "BCDragGroupViewController.h"

@interface BCTabBarController ()

@end

@implementation BCTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        BCMessageViewController *msgController = [[BCMessageViewController alloc] initWithNibName:nil
                                                                                           bundle:nil];
        
        BCContactViewController *contactController = [[BCContactViewController alloc] initWithNibName:nil
                                                                                               bundle:nil];
        
        BCRecommendViewController *recomendController = [[BCRecommendViewController alloc] initWithNibName:nil
                                                                                                    bundle:nil];
        BCSettingViewController *settingController = [[BCSettingViewController alloc] initWithNibName:nil
                                                                                               bundle:nil];
        
        BCDragGroupViewController *dragViewController = [[BCDragGroupViewController alloc] initWithStyle:UITableViewStylePlain];
        
        NSArray *controllers = [NSArray arrayWithObjects:msgController,contactController,recomendController,settingController,dragViewController, nil];
        
        self.viewControllers = controllers;
        
        [msgController release];
        [contactController release];
        [recomendController release];
        [settingController release];
        
        self.delegate = self;
        
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

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    [UIView transitionFromView:fromVC.view toView:toVC.view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
    return nil;
}

@end
