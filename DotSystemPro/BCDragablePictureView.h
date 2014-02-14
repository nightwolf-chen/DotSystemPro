//
//  BCDragablePictureView.h
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCDragablePictureViewDelegate.h"

@interface BCDragablePictureView : UIView

@property (nonatomic,strong) UIColor *backgroundColor;
@property (nonatomic,strong) id<BCDragablePictureViewDelegate> delegate;

- (id)initPlanePicture;
- (BOOL)isConflictWithPicture:(BCDragablePictureView *)aPicture;

+ (NSInteger)pictureHeight;
+ (NSInteger)pictureWidth;

@end

