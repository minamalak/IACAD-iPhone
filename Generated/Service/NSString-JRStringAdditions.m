//
//  NSString-JRStringAdditions.m
//  QatarRedCrescent
//
//  Created by John Emil on 3/3/13.
//  Copyright (c) 2013 Linkdev. All rights reserved.
//

#import "NSString-JRStringAdditions.h"

@implementation NSString (JRStringAdditions)

- (BOOL)containsString333:(NSString *)string
               options:(NSStringCompareOptions)options {
    NSRange rng = [self rangeOfString:string options:options];
    return rng.location != NSNotFound;
}

- (BOOL)containsString333:(NSString *)string {
    return [self containsString333:string options:0];
}

@end

