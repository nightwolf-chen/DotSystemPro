//
//  BCDragGroupCell.h
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCDragSegmentView;

@interface BCDragGroupCell : UITableViewCell

@property (nonatomic,strong) BCDragSegmentView *dragSegment;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier segmentView:(BCDragSegmentView *)segmentView;
@end
