//
//  BCDragablePictureViewDelegate.h
//  DotSystemPro
//
//  Created by Bruce Chen on 2/14/14.
//  Copyright (c) 2014 Bruce Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BCDragablePictureView;

@protocol BCDragablePictureViewDelegate <NSObject>

@required -(void)pictureViewPaned:(BCDragablePictureView *)picture
                       recognizer:(UIPanGestureRecognizer *)recognizer;
@end