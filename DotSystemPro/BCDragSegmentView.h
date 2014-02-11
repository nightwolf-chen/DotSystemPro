//
//  BCDragSegmentView.h
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCDragSegmentView : UIView
{
    NSMutableArray *_pictures;
}

@property (nonatomic,assign,readonly) int segmentIndex;

- (id)initWithPictures:(NSArray *)pictures;

@end
