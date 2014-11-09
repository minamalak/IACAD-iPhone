


#import <Foundation/Foundation.h>
#import "IACADEditProfileResult.h"
#import "IACADEditProfileResponse.h"


@implementation IACADEditProfileResponse

@synthesize EditProfileResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *EditProfileResultRef = [dictionary objectForKey:@"EditProfileResult"];
		if([EditProfileResultRef isKindOfClass:[NSNull class]]) {
			self.EditProfileResult = nil;
		}
		else {
			self.EditProfileResult = [[IACADEditProfileResult alloc] initWithData:[dictionary objectForKey: @"EditProfileResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.EditProfileResult JSONDictionary] forKey:@"EditProfileResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end