


#import <Foundation/Foundation.h>
#import "IACADLogin.h"


@implementation IACADLogin

@synthesize username;
@synthesize password;
@synthesize culture;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *usernameRef = [dictionary objectForKey:@"username"];
		if([usernameRef isKindOfClass:[NSNull class]]) {
			self.username = nil;
		}
		else {
			self.username = [[dictionary objectForKey: @"username"] copy];
		}
						
		NSObject *passwordRef = [dictionary objectForKey:@"password"];
		if([passwordRef isKindOfClass:[NSNull class]]) {
			self.password = nil;
		}
		else {
			self.password = [[dictionary objectForKey: @"password"] copy];
		}
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.username forKey:@"username"];
	[dictionary setValue:self.password forKey:@"password"];
	[dictionary setValue:self.culture forKey:@"culture"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?username=%@&password=%@&culture=%@&", self.username, self.password, self.culture];
}

@end