//
//  BCAppInfoUpdateCenter.m
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-20.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import  "BCAppInfoUpdateCenter.h"
#import  "BCAppInfoManager.h"
#include "Notifications.h"

@implementation BCAppInfoUpdateCenter

+ (id)sharedInstance
{
    static BCAppInfoUpdateCenter *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BCAppInfoUpdateCenter alloc] _init];
    });
    return _sharedInstance;
}

- (id)_init
{
    self = [super init];
    if (self) {
        _appInfoManger = [[BCAppInfoManager instance] retain];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onLoginSuccess)
                                                     name:LoginSuccessNotification object:nil];
    }
    return self;
}

- (id)init
{
    NSAssert(NO, @"Use the sharedInstance instead!");
    return nil;
}

- (void)onLoginSuccess
{
    if(_appInfoManger){
        [_appInfoManger release];
        _appInfoManger = nil;
    }
    _appInfoManger = [[BCAppInfoManager instance] retain];;
}

#pragma mark - Cleanup
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if(_appInfoManger){
        [_appInfoManger release];
        _appInfoManger = nil;
    }
    [super dealloc];
}
@end
