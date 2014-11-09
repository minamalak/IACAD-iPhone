//
//  WebService.m
//  PremiumCard
//
//  Created by John Emil on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebService.h"
#import "WebServiceResponse.h"
#import "WebServiceRequest.h"
//#import "NSString-JRStringAdditions.h"

@implementation WebService

static int requestCount = 0;

- (id)initWithRequest:(WebServiceRequest *)Request {
	if (self = [super init])
    {
        _request = Request;
    }
    return self;
}

- (id)initWithRequest:(WebServiceRequest *)Request caller:(id<WebServiceCaller>)caller {
	if (self = [super init])
    {
        _caller = caller;
        _request = Request;
    }
    return self;
}

+ (void)ShowNetworkActivityIndicator {
    if(requestCount++ < 1) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    }
    NSLog(@"requestCount now : %d", requestCount);
}

+ (void)HideNetworkActivityIndicator {
    if(--requestCount < 1) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    NSLog(@"requestCount now : %d", requestCount);
}

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
    _data = [[NSMutableData alloc] init]; // _data being an ivar
}
-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    [_data appendData:data];
}

-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    //NSLog(@"%@", _controller.url);
    
    NSLog(@"%@ - %ld - %@ - %@", [error localizedDescription], (long)[error code], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);

    [WebService HideNetworkActivityIndicator];
    //handler errors;
    WebServiceResponse *response = [[WebServiceResponse alloc] init];
    response.call = _request.call;
    response.caller = _request.caller;
    response.error = error;
    
    // send our results back to the main thread
    if (_caller) {
        [_caller webServiceCallback:response];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    WebServiceResponse *response = [[WebServiceResponse alloc] init];
    response.content = _data;
    response.call = _request.call;
    response.caller = _request.caller;
    
    // send our results back to the main thread
    if (_caller) {
        [_caller webServiceCallback:response];
    }
    [WebService HideNetworkActivityIndicator];
}

- (NSData *)dataContentIsPost:(BOOL)isPost response:(NSURLResponse **)response error:(NSError **)error {
    //[WebService ShowNetworkActivityIndicator];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_request.url]];
    [req setTimeoutInterval:240];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (isPost) {
        req.HTTPMethod = @"POST";
        req.HTTPBody = _request.body;
    }
    else {
        req.HTTPMethod = @"GET";
    }
    
    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse: response error: error];
    return data;
}

- (void)dataWithContentAsyncIsPost:(BOOL)isPost {
    [WebService ShowNetworkActivityIndicator];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:_request.url]];
    [req setTimeoutInterval:240];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (isPost) {
        req.HTTPMethod = @"POST";
        req.HTTPBody = _request.body;
    }
    else {
        req.HTTPMethod = @"GET";
    }
    
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:req delegate:self]; // release later
    [connection start];
}

@end
