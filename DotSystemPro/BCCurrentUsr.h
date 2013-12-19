//
//  BCCurrentUsr.h
//  DotSystemPro
//
//  Created by Bruce Chen on 13-12-20.
//  Copyright (c) 2013年 Bruce Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCCurrentUsr : NSObject

@property (nonatomic,strong) NSString *uin;

+ (id)GetInstance;

@end
