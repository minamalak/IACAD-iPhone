


#import <Foundation/Foundation.h>
#import "IACADGetCatalogPersonDetails.h"


@implementation IACADGetCatalogPersonDetails

@synthesize charityId;
@synthesize personId;
@synthesize culture;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.charityId = [[dictionary objectForKey: @"charityId"] intValue];
		self.personId = [[dictionary objectForKey: @"personId"] longValue];
						
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
	[dictionary setValue:[NSNumber numberWithLong: self.personId] forKey:@"personId"];
	[dictionary setValue:self.culture forKey:@"culture"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?charityId=%d&personId=%d&culture=%@&", self.charityId, self.personId, self.culture];
}

@end