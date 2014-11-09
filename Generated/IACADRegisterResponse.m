


#import <Foundation/Foundation.h>
#import "IACADRegisterResult.h"
#import "IACADRegisterResponse.h"


@implementation IACADRegisterResponse

@synthesize RegisterResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *RegisterResultRef = [dictionary objectForKey:@"RegisterResult"];
		if([RegisterResultRef isKindOfClass:[NSNull class]]) {
			self.RegisterResult = nil;
		}
		else {
			self.RegisterResult = [[IACADRegisterResult alloc] initWithData:[dictionary objectForKey: @"RegisterResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.RegisterResult JSONDictionary] forKey:@"RegisterResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end