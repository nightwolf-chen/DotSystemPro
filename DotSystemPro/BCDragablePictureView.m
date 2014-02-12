//
//  BCDragablePictureView.m
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import "BCDragablePictureView.h"

const int defaultWidth = 45;
const int defaultHeight = 45;

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
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paned:)];
        [self addGestureRecognizer:panRecognizer];
        
        double randomR = (double)(arc4random() % 255 ) / 255.0 ;
        double randomG = (double)(arc4random() % 255 ) / 255.0 ;
        double randomB = (double)(arc4random() % 255 ) / 255.0 ;
        
        _backgroundColor = [[UIColor colorWithRed:randomR green:randomG blue:randomB alpha:1] retain];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, _backgroundColor.CGColor);
    CGContextFillRect(context, rect);
    
}

#pragma mark - draged

- (void)paned:(UIPanGestureRecognizer *)recognizer
{
    static CGPoint oriLoc;
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            oriLoc = self.center;
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGPoint curPoint = [recognizer locationInView:self.superview];
            [UIView animateWithDuration:0.1 animations:^{
                
                self.center = curPoint;
                
            }];
            
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        {
            [UIView animateWithDuration:0.1 animations:^{
                
                self.center = oriLoc;
                
            }];

            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            [UIView animateWithDuration:0.1 animations:^{
                
                self.center = oriLoc;
                
            }];
            
            break;
        }
        case UIGestureRecognizerStatePossible:
        {
            break;
        }
            
    }
    
    
}

+ (NSInteger)pictureHeight
{
    return defaultHeight;
}

+ (NSInteger)pictureWidth
{
    return defaultWidth;
}

@end
