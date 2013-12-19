//
//  BCCurrentUsr.m
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-20.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import "BCCurrentUsr.h"

@implementation BCCurrentUsr

+ (id)GetInstance
{
    return [[[BCCurrentUsr alloc] init] autorelease];
}

+ (NSString *)currentUin
{
    return @"466202783";
}

- (id)init
{
    self = [super init];
    if (self) {
        _uin = [[BCCurrentUsr currentUin] retain];
    }
    return self;
}

@end
