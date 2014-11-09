


#import <Foundation/Foundation.h>
#import "IACADUser.h"
#import "IACADEditProfileResult.h"

@implementation IACADEditProfileResult
@synthesize EditProfileStatus;
@synthesize FailureMessage;
@synthesize User;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.EditProfileStatus = [[dictionary objectForKey: @"EditProfileStatus"] boolValue];
						
		NSObject *FailureMessageRef = [dictionary objectForKey:@"FailureMessage"];
		if([FailureMessageRef isKindOfClass:[NSNull class]]) {
			self.FailureMessage = nil;
		}
		else {
			self.FailureMessage = [[dictionary objectForKey: @"FailureMessage"] copy];
		}
						
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
	[dictionary setValue:[NSNumber numberWithBool: self.EditProfileStatus] forKey:@"EditProfileStatus"];
	[dictionary setValue:self.FailureMessage forKey:@"FailureMessage"];
	[dictionary setValue:[self.User JSONDictionary] forKey:@"User"];
	return dictionary;
}

@end
