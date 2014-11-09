


#import <Foundation/Foundation.h>
#import "IACADUser.h"
#import "IACADRegisterResult.h"

@implementation IACADRegisterResult
@synthesize FailureMessage;
@synthesize RegisterStatus;
@synthesize User;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *FailureMessageRef = [dictionary objectForKey:@"FailureMessage"];
		if([FailureMessageRef isKindOfClass:[NSNull class]]) {
			self.FailureMessage = nil;
		}
		else {
			self.FailureMessage = [[dictionary objectForKey: @"FailureMessage"] copy];
		}
		self.RegisterStatus = [[dictionary objectForKey: @"RegisterStatus"] boolValue];
						
		NSObject *UserRef = [dictionary objectForKey:@"User"];
		if([UserRef isKindOfClass:[NSNull class]]) {
			self.User = nil;
		}
		else {
			self.User = [[IACADUser alloc] initWithData:[dictionary objectForKey: @"User"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.FailureMessage forKey:@"FailureMessage"];
	[dictionary setValue:[NSNumber numberWithBool: self.RegisterStatus] forKey:@"RegisterStatus"];
	[dictionary setValue:[self.User JSONDictionary] forKey:@"User"];
	return dictionary;
}

@end
