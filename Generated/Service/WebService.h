//
//  WebService.h
//  PremiumCard
//
//  Created by John Emil on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WebServiceRequest;
@class WebServiceResponse;

@protocol WebServiceCaller <NSObject>

@optional
- (void)webServiceCallback:(WebServiceResponse *)response;

@end

@interface WebService : NSObject {
    id<WebServiceCaller> _caller;
    WebServiceRequest *_request;
    NSMutableData *_data;
}

+ (void)ShowNetworkActivityIndicator;
+ (void)HideNetworkActivityIndicator;

- (id)initWithRequest:(WebServiceRequest *)Request;
- (id)initWithRequest:(WebServiceRequest *)Request caller:(id<WebServiceCaller>) caller;
- (NSData *)dataContentIsPost:(BOOL)isPost response:(NSURLResponse **)response error:(NSError **)error;
- (void)dataWithContentAsyncIsPost:(BOOL)isPost;

@end     
