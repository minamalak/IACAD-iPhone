


#import <Foundation/Foundation.h>
#import "IACADGetAnonymousDonationTypes.h"


@implementation IACADGetAnonymousDonationTypes

@synthesize charityId;
@synthesize culture;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.charityId = [[dictionary objectForKey: @"charityId"] intValue];
						
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
	[dictionary setValue:[NSNumber numberWithInt: self.charityId] forKey:@"charityId"];
	[dictionary setValue:self.culture forKey:@"culture"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?charityId=%d&culture=%@&", self.charityId, self.culture];
}

@end