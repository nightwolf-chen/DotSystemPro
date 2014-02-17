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
        _pictureNum = [_pictures count];
        for(BCDragablePictureView *picture in _pictures){
            picture.delegate = self;
             [self addSubview:picture];
        }
        [self updatePicturesPosition];
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
            
        }];
        
    }
}

- (void)updatePicturesPosition
{
    for (int i = 0; i < [_pictures count]; i++) {
        
        BCDragablePictureView *pictureView = [_pictures objectAtIndex:i];
        CGRect frame = pictureView.frame;
        frame.origin = [self centerForPictureAtIndex:i];
        [UIView animateWithDuration:0.5 animations:^{
            pictureView.frame = frame;
        }];
        
    }
    
    [self updateFrame];
}

- (void)updatePicturesPositionWithExceptions:(NSIndexSet *)indexes
{
    for (int i = 0; i < [_pictures count]; i++) {
        
        if ([indexes containsIndex:i]) {
            continue;
        }
        
        BCDragablePictureView *pictureView = [_pictures objectAtIndex:i];
        CGRect frame = pictureView.frame;
        frame.origin = [self centerForPictureAtIndex:i];
        [UIView animateWithDuration:0.5 animations:^{
            pictureView.frame = frame;
        }];
        
    }
    [self updateFrame];
}

- (CGPoint)centerForPictureAtIndex:(int)index
{
    int y = (index / picturesPerLine);
    int x = (index % picturesPerLine);
    
    y = (gapHeight + [BCDragablePictureView pictureHeight])*y + gapHeight*2;
    x = (gapWidth + [BCDragablePictureView pictureWidth])*x + gapWidth*2;
    
    return CGPointMake(x, y);
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

#pragma mark - picture view delegate

- (void)pictureViewPaned:(BCDragablePictureView *)picture recognizer:(UIPanGestureRecognizer *)recognizer
{
    NSLog(@"delegate called!");
    
    static NSUInteger index;

    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            index = [_pictures indexOfObject:picture];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            if (![picture isConflictWithPicWithCenter:[self centerForPictureAtIndex:index]]) {
                if ([_pictures containsObject:picture]) {
                    [_pictures removeObject:picture];
                    [self updatePicturesPosition];
                }
            }
            
            for(int i = 0 ; i < [_pictures count] ; i++){
                BCDragablePictureView *anotherPic = [_pictures objectAtIndex:i];
                if ([picture isConflictWithPicture:anotherPic] && ![_pictures containsObject:picture]) {
                    [_pictures insertObject:picture atIndex:i];
                    index = i;
                    NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:i];
                    [self updatePicturesPositionWithExceptions:indexes];
                    break;
                }
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self updatePicturesPosition];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        {
            if ([_pictures count] < _pictureNum) {
                [_pictures insertObject:picture atIndex:index];
            }
        }
            break;
        case UIGestureRecognizerStatePossible:
        {
            //do nothing
        }
            break;
            
    }
}



@end
