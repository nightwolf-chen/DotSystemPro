//
//  BCDragablePictureView.h
//  DotSystemPro
//
//  Created by Bruce Chen on 2/11/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCDragablePictureView : UIView

@property (nonatomic,strong) UIColor *backgroundColor;

- (id)initPlanePicture;

+ (NSInteger)pictureHeight;
+ (NSInteger)pictureWidth;

@end
