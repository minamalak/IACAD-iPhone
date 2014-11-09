


#import <Foundation/Foundation.h>
#import "IACADUser.h"
#import "IACADGetProfileResponse.h"


@implementation IACADGetProfileResponse

@synthesize GetProfileResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *GetProfileResultRef = [dictionary objectForKey:@"GetProfileResult"];
		if([GetProfileResultRef isKindOfClass:[NSNull class]]) {
			self.GetProfileResult = nil;
		}
		else {
			self.GetProfileResult = [[IACADUser alloc] initWithData:[dictionary objectForKey: @"GetProfileResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.GetProfileResult JSONDictionary] forKey:@"GetProfileResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end