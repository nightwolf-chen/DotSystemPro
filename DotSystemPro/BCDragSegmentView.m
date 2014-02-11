//
//  BCDragSegmentView.m
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import "BCDragSegmentView.h"

@implementation BCDragSegmentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width, 50)];
    if (self) {
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    
    CGContextFillRect(context, rect);
    
}

- (NSInteger)heightForSegment
{
    return 100;
}
@end
