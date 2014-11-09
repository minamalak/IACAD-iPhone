


#import <Foundation/Foundation.h>
#import "IACADLoginResult.h"
#import "IACADLoginResponse.h"


@implementation IACADLoginResponse

@synthesize LoginResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *LoginResultRef = [dictionary objectForKey:@"LoginResult"];
		if([LoginResultRef isKindOfClass:[NSNull class]]) {
			self.LoginResult = nil;
		}
		else {
			self.LoginResult = [[IACADLoginResult alloc] initWithData:[dictionary objectForKey: @"LoginResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.LoginResult JSONDictionary] forKey:@"LoginResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end