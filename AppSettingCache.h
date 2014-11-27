//
//  AppSettingCache.h
//  IACAD
//
//  Created by John Emil on 11/6/14.
//  Copyright (c) 2014 com.linkdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSettingCache : NSObject {
    
}

@property (nonatomic, strong) NSString *passwordRegex;

- (void)loadSettings;

+ (AppSettingCache *)defaultAppSettingCache;

@end
