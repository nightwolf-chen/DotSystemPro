//
//  BCAppInfoManager.m
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-20.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import "BCAppInfoManager.h"
#import "BCAppInfo.h"
#import "BCCurrentUsr.h"

//Task queue to save instane to file.
dispatch_queue_t taskQue;
int taskID = 0;

//NSCoding keys
static NSString *KAppInfoManagerAppInfos  = @"__KAppInfoManagerAppInfos__";
static NSString *KAppInfoManagerFilePath  = @"__KAppInfoManagerFilePath__";
static NSString *KAppInfoManagerIInterval = @"__KAppInfoManagerIInterval__";

@implementation BCAppInfoManager

+ (id)instance
{
    
    if (!taskQue) {
        taskQue = dispatch_queue_create("com.dotsystem.saveque", NULL);
    }
    
    NSString *filePath = [BCAppInfoManager currentUsrFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        
        id tmp = [BCAppInfoManager instanceFromFile:filePath];
        if (tmp) {
            return [BCAppInfoManager instanceDefault];
        }else{
            return tmp;
        }
        
    }else{
        return [BCAppInfoManager instanceDefault];
    }
}

+ (NSString *)currentUsrFilePath
{
    NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [dirArray objectAtIndex:0];
    NSString *filePath = [documentDir stringByAppendingPathComponent:[[BCCurrentUsr GetInstance] uin]];
    return filePath;
}

+ (id)instanceFromFile:(NSString *)filePath
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

+ (id)instanceDefault
{
    BCAppInfoManager *aManager = [[BCAppInfoManager alloc] _init];
    return [aManager autorelease];
}

- (id)init
{
    NSAssert(NO, @"This class use +instance method to get instance.");
    return self;
}

- (id)_init
{
    self = [super init];
    if (self) {
        _appInfos = [[NSMutableArray alloc] init];
        _filePath = [[BCAppInfoManager currentUsrFilePath] retain];
        _iInterval = 0;
    }
    return self;
}

- (void)refreshAppInfos
{
    //constuct and check for plugin list here
}

- (BCAppInfo *)getAppInfoByPath:(NSString *)path
{
    BCAppInfo *appInfo = [self appInfoAtPath:path];
    if (appInfo) {
        return [[appInfo copy] autorelease];
    }
    return nil;
}

- (void)cancelNewFlagForPath:(NSString *)path
{
    BCAppInfo *appInfo = [self appInfoAtPath:path];
    if (appInfo) {
        appInfo.flag = 0;
    }
}

- (BCAppInfo *)appInfoAtPath:(NSString *)path
{
    for(BCAppInfo *appInfo in self.appInfos){
        if ([appInfo.path isEqualToString:path]) {
            return appInfo;
        }
    }
    return nil;
}

- (void)saveToFile
{
    dispatch_async(taskQue, ^{
        NSLog(@"saving %d task start",taskID);
        [NSKeyedArchiver archiveRootObject:[[self copy] autorelease] toFile:_filePath];
        NSLog(@"saving %d task end",taskID++);
    });
}

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        @try {
            _iInterval = [aDecoder decodeDoubleForKey:KAppInfoManagerIInterval];
            _filePath  = [[aDecoder decodeObjectForKey:KAppInfoManagerFilePath] retain];
            _appInfos  = [[aDecoder decodeObjectForKey:KAppInfoManagerAppInfos] retain];
        }
        @catch (NSException *exception) {
            _appInfos = [[NSMutableArray alloc] init];
            _filePath = [[BCAppInfoManager currentUsrFilePath] retain];
            _iInterval = 0;
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeDouble:_iInterval forKey:KAppInfoManagerIInterval];
    [aCoder encodeObject:_filePath  forKey:KAppInfoManagerFilePath];
    [aCoder encodeObject:_appInfos  forKey:KAppInfoManagerAppInfos];
}

#pragma mark - NSCoping 
- (id)copyWithZone:(NSZone *)zone
{
    BCAppInfoManager *aManager = [BCAppInfoManager allocWithZone:zone];
    if (aManager) {
        aManager.iInterval = self.iInterval;
        aManager.filePath  = [[self.filePath copy] autorelease];
        aManager.appInfos  = [[self.appInfos copy] autorelease];
    }
    return aManager;
}

#pragma mark - cleanup
- (void)dealloc
{
    if (_filePath) {[_filePath release];}
    if (_appInfos) {[_appInfos release];}
    [super dealloc];
}
@end
