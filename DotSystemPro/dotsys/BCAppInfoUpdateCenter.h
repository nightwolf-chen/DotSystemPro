//
//  BCAppInfoUpdateCenter.h
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-20.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BCAppInfoManager;

@interface BCAppInfoUpdateCenter : NSObject
{
    NSMutableDictionary *_appInfoDic;
}

@property (nonatomic,retain) BCAppInfoManager *appInfoManger;

+ (id)sharedInstance;

@end
