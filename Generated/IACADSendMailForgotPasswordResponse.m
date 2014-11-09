


#import <Foundation/Foundation.h>
#import "IACADForgotPassword.h"
#import "IACADSendMailForgotPasswordResponse.h"


@implementation IACADSendMailForgotPasswordResponse

@synthesize SendMailForgotPasswordResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *SendMailForgotPasswordResultRef = [dictionary objectForKey:@"SendMailForgotPasswordResult"];
		if([SendMailForgotPasswordResultRef isKindOfClass:[NSNull class]]) {
			self.SendMailForgotPasswordResult = nil;
		}
		else {
			self.SendMailForgotPasswordResult = [[IACADForgotPassword alloc] initWithData:[dictionary objectForKey: @"SendMailForgotPasswordResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.SendMailForgotPasswordResult JSONDictionary] forKey:@"SendMailForgotPasswordResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end