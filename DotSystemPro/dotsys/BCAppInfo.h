//
//  BCAppInfo.h
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-20.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCAppInfo : NSObject<NSCoding,NSCopying>

@property (nonatomic,assign) uint32_t appID;
@property (nonatomic,assign) uint32_t flag;
@property (nonatomic,strong) NSString *path;

- (id)initWithAppID:(uint32_t)appID;

@end
