//
//  BCAppInfo.m
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-20.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import "BCAppInfo.h"

static NSString *KBCAppInfoAppID;
static NSString *KBCAppInfoFLag;
static NSString *KBCAppInfoPath;

@implementation BCAppInfo

- (id)initWithAppID:(uint32_t)appID
{
    self = [super init];
    if (self) {
        _appID = appID;
        _flag  = 0;
        _path  = [[NSString alloc] init];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    BCAppInfo *appInfo = [BCAppInfo allocWithZone:zone];
    appInfo.appID = self.appID;
    appInfo.flag  = self.flag;
    appInfo.path  = [[self.path copy] autorelease];
    return appInfo;
}

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        @try {
            _appID = [aDecoder  decodeInt32ForKey:KBCAppInfoAppID];
            _flag  = [aDecoder  decodeInt32ForKey:KBCAppInfoFLag];
            _path  = [[aDecoder decodeObjectForKey:KBCAppInfoPath] retain];
        }
        @catch (NSException *exception) {
            _appID = 0;
            _flag  = 0;
            _path  = [[NSString alloc] init];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt32:self.appID forKey:KBCAppInfoAppID];
    [aCoder encodeInt32:self.flag  forKey:KBCAppInfoFLag];
    [aCoder encodeObject:self.path forKey:KBCAppInfoPath];
}
@end
