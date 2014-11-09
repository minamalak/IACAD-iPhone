


#import <Foundation/Foundation.h>
#import "IACADGetPersonsByCharityAndDonationType.h"


@implementation IACADGetPersonsByCharityAndDonationType

@synthesize charityId;
@synthesize donationTypeId;
@synthesize countryId;
@synthesize culture;
@synthesize pageIndex;
@synthesize pageSize;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.charityId = [[dictionary objectForKey: @"charityId"] intValue];
		self.donationTypeId = [[dictionary objectForKey: @"donationTypeId"] intValue];
		self.countryId = [[dictionary objectForKey: @"countryId"] intValue];
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
		self.pageIndex = [[dictionary objectForKey: @"pageIndex"] intValue];
		self.pageSize = [[dictionary objectForKey: @"pageSize"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt: self.charityId] forKey:@"charityId"];
	[dictionary setValue:[NSNumber numberWithInt: self.donationTypeId] forKey:@"donationTypeId"];
	[dictionary setValue:[NSNumber numberWithInt: self.countryId] forKey:@"countryId"];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:[NSNumber numberWithInt: self.pageIndex] forKey:@"pageIndex"];
	[dictionary setValue:[NSNumber numberWithInt: self.pageSize] forKey:@"pageSize"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?charityId=%d&donationTypeId=%d&countryId=%d&culture=%@&pageIndex=%d&pageSize=%d&", self.charityId, self.donationTypeId, self.countryId, self.culture, self.pageIndex, self.pageSize];
}

@end