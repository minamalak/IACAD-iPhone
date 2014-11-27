


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADGetPersonsByCharityAndDonationTypeAndContries.h"


@implementation IACADGetPersonsByCharityAndDonationTypeAndContries

@synthesize charityId;
@synthesize donationTypeId;
@synthesize countryId;
@synthesize culture;
@synthesize pageIndex;
@synthesize pageSize;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.charityId = [dictionary objectForKey: @"charityId"];
		self.donationTypeId = [dictionary objectForKey: @"donationTypeId"];
		countryId = [[NSMutableArray alloc] init];
		NSObject *countryIdArrRef = nil;
			countryIdArrRef = [dictionary objectForKey:@"countryId"];

		if([countryIdArrRef isKindOfClass:[NSArray class]]) {
			NSArray* countryIdArr = (NSArray *)countryIdArrRef;
			for(NSNumber* childObj in countryIdArr) {
				[countryId addObject:childObj];
			}
		}
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {  
			self.culture = nil;
		}
		else {
			self.culture = [dictionary objectForKey: @"culture"];
		}
		self.pageIndex = [dictionary objectForKey: @"pageIndex"];
		self.pageSize = [dictionary objectForKey: @"pageSize"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.charityId forKey:@"charityId"];
	[dictionary setValue:self.donationTypeId forKey:@"donationTypeId"];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(NSNumber* childObj in countryId) {
		[arr addObject:childObj];
	}
	[dictionary setValue:arr forKey:@"countryId"];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:self.pageIndex forKey:@"pageIndex"];
	[dictionary setValue:self.pageSize forKey:@"pageSize"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?charityId=%@&donationTypeId=%@&culture=%@&pageIndex=%@&pageSize=%@&", self.charityId, self.donationTypeId, self.culture, self.pageIndex, self.pageSize];
}

@end