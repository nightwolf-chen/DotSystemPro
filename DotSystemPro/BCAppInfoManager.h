//
//  BCAppInfoManager.h
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-20.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BCAppInfo;

@interface BCAppInfoManager : NSObject<NSCoding,NSCopying>

@property (nonatomic,strong) NSString *filePath;
@property (nonatomic,assign) NSTimeInterval iInterval;
@property (nonatomic,strong) NSMutableArray *appInfos;

- (BCAppInfo *)getAppInfoByPath:(NSString *)path;
- (void)cancelNewFlagForPath:(NSString *)path;
- (void)saveToFile;

+ (id)instance;

@end
