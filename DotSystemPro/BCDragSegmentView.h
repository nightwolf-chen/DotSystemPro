//
//  BCDragSegmentView.h
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCDragablePictureViewDelegate.h"

@interface BCDragSegmentView : UIView<BCDragablePictureViewDelegate>
{
    NSMutableArray *_pictures;
}

@property (nonatomic,assign,readonly) int segmentIndex;
@property (nonatomic,assign,readonly) int pictureNum;

- (id)initWithPictures:(NSArray *)pictures;

@end
