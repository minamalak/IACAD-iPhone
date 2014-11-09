//
//  COKeyValuePair.m
//  IACAD
//
//  Created by John Emil on 4/4/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import "COKeyValuePair.h"

@implementation COKeyValuePair

@synthesize key;
@synthesize value;

- (id)initWithKey:(NSObject *)nkey value:(NSObject *)nvalue {
    
    self = [super init];
    if (self) {
        self.key = nkey;
        self.value = nvalue;
    }
    return self;
}

@end
