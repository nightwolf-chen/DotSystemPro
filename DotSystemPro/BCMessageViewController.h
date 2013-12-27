//
//  BCMessageViewController.h
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-27.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCMessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end
