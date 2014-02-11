//
//  BCDragGroupViewController.h
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCDragGroupViewController : UITableViewController<UITableViewDataSource>
{
    NSArray *_segments;
}

- (id)initWithStyle:(UITableViewStyle)style numberOfGroup:(int)num;
@end
