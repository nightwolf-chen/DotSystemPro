//
//  BCDragSegmentView.m
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import "BCDragSegmentView.h"
#import "BCDragablePictureView.h"

static const int picturesPerLine = 5;
static const int gapHeight = 10;
static const int gapWidth = 10;

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
    self = [super initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width, 200)];
    
//    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    
    if (self) {
        
    }
    return self;
}

- (id)initWithPictures:(NSArray *)pictures
{
    self = [super init];
    
    if (self) {
        _pictures = [[NSMutableArray alloc] initWithArray:pictures];
        
        for (int i = 0; i < [_pictures count]; i++) {
            
            int y = (i / picturesPerLine);
            int x = (i % picturesPerLine);
            
            y = (gapHeight + [BCDragablePictureView pictureHeight])*y + gapHeight*2;
            x = (gapWidth + [BCDragablePictureView pictureWidth])*x + gapWidth*2;
            
            BCDragablePictureView *pictureView = [_pictures objectAtIndex:i];
            CGRect frame = pictureView.frame;
            frame.origin = CGPointMake(x, y);
            pictureView.frame = frame;
            
            [self addSubview:pictureView];
            
        }
        
        [self updateFrame];
    }
    
    return self;
    
}

- (void)updateFrame
{
    if (_pictures) {
        
        int numOfRows = _pictures.count/picturesPerLine + (_pictures.count%picturesPerLine?1:0);
        int height = gapHeight*3 + numOfRows * ([BCDragablePictureView pictureHeight] + gapHeight);
        int width = [[UIScreen mainScreen] applicationFrame].size.width;
        CGRect frame = CGRectMake(0, 0, width, height);
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.frame = frame;
            
        } completion:^(BOOL finished){
            
            
            
        }];
        
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    double bWidth = 10 ;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextFillRect(context, rect);
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGRect contentRect = CGRectMake(bWidth,bWidth, rect.size.width-2*bWidth, rect.size.height-2*bWidth);
    
    CGContextFillRect(context, contentRect);
    
}

@end
