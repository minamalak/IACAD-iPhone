//
//  COKeyValuePair.h
//  IACAD
//
//  Created by John Emil on 4/4/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COKeyValuePair : NSObject {
    
}

@property (strong, nonatomic)NSObject *key;
@property (strong, nonatomic)NSObject *value;

- (id)initWithKey:(NSObject *)key value:(NSObject *)value;

@end
