//
//  BCAppInitializer.m
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-22.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import "BCAppInitializer.h"
#import "BCAppInfoUpdateCenter.h"

@implementation BCAppInitializer

+ (void)singletonInit
{
    [BCAppInfoUpdateCenter sharedInstance];
}
@end
