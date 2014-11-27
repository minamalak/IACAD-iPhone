


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "IACADCatalogDonationItem.h"
	#import "IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse.h"


@implementation IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse

@synthesize GetDonationItemsByCharityAndDonationTypeAndContriesResult;
@synthesize count;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetDonationItemsByCharityAndDonationTypeAndContriesResult = [[NSMutableArray alloc] init];
		NSObject *GetDonationItemsByCharityAndDonationTypeAndContriesResultArrRef = nil;
			GetDonationItemsByCharityAndDonationTypeAndContriesResultArrRef = [dictionary objectForKey:@"GetDonationItemsByCharityAndDonationTypeAndContriesResult"];

		if([GetDonationItemsByCharityAndDonationTypeAndContriesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetDonationItemsByCharityAndDonationTypeAndContriesResultArr = (NSArray *)GetDonationItemsByCharityAndDonationTypeAndContriesResultArrRef;
			for(NSDictionary * childObj in GetDonationItemsByCharityAndDonationTypeAndContriesResultArr) {
				[GetDonationItemsByCharityAndDonationTypeAndContriesResult addObject:[[IACADCatalogDonationItem alloc] initWithData:childObj]];
			}
		}
		self.count = [dictionary objectForKey: @"count"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCatalogDonationItem* childObj in GetDonationItemsByCharityAndDonationTypeAndContriesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetDonationItemsByCharityAndDonationTypeAndContriesResult"];
	[dictionary setValue:self.count forKey:@"count"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?count=%@&", self.count];
}

@end