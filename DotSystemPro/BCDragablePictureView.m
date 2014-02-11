//
//  BCDragablePictureView.m
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import "BCDragablePictureView.h"

const int defaultWidth = 40;
const int defaultHeight = 40;

@implementation BCDragablePictureView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (id)initPlanePicture
{
    self = [super initWithFrame:CGRectMake(0, 0, defaultWidth,defaultHeight)];
    if (self) {
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paned)];
        [self addGestureRecognizer:panRecognizer];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    double randomR = (double)(random() % 255) / 255.0;
    double randomG = (double)(random() % 255) / 255.0;
    double randomB = (double)(random() % 255) / 255.0;
    
    UIColor *randomColor = [UIColor colorWithRed:randomR green:randomG blue:randomB alpha:1];
    
    CGContextSetFillColorWithColor(context, randomColor.CGColor);
    
    CGContextFillRect(context, rect);
    
}

#pragma mark - draged

- (void)paned
{
    [self convertPoint:self.center fromView:nil];
}


@end
