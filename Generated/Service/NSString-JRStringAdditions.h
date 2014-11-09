//
//  NSString-JRStringAdditions.h
//  QatarRedCrescent
//
//  Created by John Emil on 3/3/13.
//  Copyright (c) 2013 Linkdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JRStringAdditions)

- (BOOL)containsString333:(NSString *)string;
- (BOOL)containsString333:(NSString *)string
               options:(NSStringCompareOptions)options;

@end
