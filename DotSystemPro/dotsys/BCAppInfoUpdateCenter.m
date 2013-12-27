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
#import "BCCurrentUsr.h"

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
        _appInfoDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)init
{
    NSAssert(NO, @"Use the sharedInstance instead!");
    return nil;
}

- (BCAppInfoManager *)appInfoManger
{
    NSString *uin = [[BCCurrentUsr GetInstance] uin];
    if (![_appInfoDic objectForKey:uin]) {
        BCAppInfoManager *appInfoManager = [BCAppInfoManager instance];
        [_appInfoDic setObject:appInfoManager forKey:uin];
    }
    
    return [_appInfoDic objectForKey:uin];
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
