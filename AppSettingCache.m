//
//  AppSettingCache.m
//  IACAD
//
//  Created by John Emil on 11/6/14.
//  Copyright (c) 2014 com.linkdev. All rights reserved.
//

#import "AppSettingCache.h"
#import "IACADServiceClient.h"
#import "IACADGetRegex.h"
#import "IACADGetRegexResponse.h"

@interface AppSettingCache() <IACADServiceClientCaller>

@end

@implementation AppSettingCache

static AppSettingCache *_defaultAppSettingCache;

+ (void)load {
    if (_defaultAppSettingCache == nil) {
        _defaultAppSettingCache = [[AppSettingCache alloc] init];
        [_defaultAppSettingCache loadSettings];
    }
}

- (void)loadSettings {
    IACADGetRegex *input = [[IACADGetRegex alloc] init];
    IACADServiceClient *serviceClient = [[IACADServiceClient alloc] init];
    [serviceClient GetRegexAsyncIsPost:YES input:input caller:self];
}

- (void)GetRegexCallback:(IACADGetRegexResponse *)response error:(NSError *)error {
    if (response != nil && response.GetRegexResult != nil) {
        self.passwordRegex = response.GetRegexResult;
    }
}


+ (AppSettingCache *)defaultAppSettingCache {
    return _defaultAppSettingCache;
}

@end
