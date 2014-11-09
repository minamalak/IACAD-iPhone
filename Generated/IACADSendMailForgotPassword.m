


#import <Foundation/Foundation.h>
#import "IACADSendMailForgotPassword.h"


@implementation IACADSendMailForgotPassword

@synthesize UserName;
@synthesize language;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *UserNameRef = [dictionary objectForKey:@"UserName"];
		if([UserNameRef isKindOfClass:[NSNull class]]) {
			self.UserName = nil;
		}
		else {
			self.UserName = [[dictionary objectForKey: @"UserName"] copy];
		}
						
		NSObject *languageRef = [dictionary objectForKey:@"language"];
		if([languageRef isKindOfClass:[NSNull class]]) {
			self.language = nil;
		}
		else {
			self.language = [[dictionary objectForKey: @"language"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.UserName forKey:@"UserName"];
	[dictionary setValue:self.language forKey:@"language"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?UserName=%@&language=%@&", self.UserName, self.language];
}

@end