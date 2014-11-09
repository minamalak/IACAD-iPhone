//
//  WebServiceResponse.h
//  PremiumCard
//
//  Created by John Emil on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceResponse : NSObject {
    
}

@property (strong, nonatomic) id caller;
@property (nonatomic) int call;
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) NSData *content;

@end      
