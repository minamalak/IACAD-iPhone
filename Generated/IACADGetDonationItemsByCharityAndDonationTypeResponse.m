


#import <Foundation/Foundation.h>
#import "IACADCatalogDonationItem.h"
#import "IACADGetDonationItemsByCharityAndDonationTypeResponse.h"


@implementation IACADGetDonationItemsByCharityAndDonationTypeResponse

@synthesize GetDonationItemsByCharityAndDonationTypeResult;
@synthesize count;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetDonationItemsByCharityAndDonationTypeResult = [[NSMutableArray alloc] init];
		NSObject *GetDonationItemsByCharityAndDonationTypeResultArrRef = [dictionary objectForKey:@"GetDonationItemsByCharityAndDonationTypeResult"];
		if([GetDonationItemsByCharityAndDonationTypeResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetDonationItemsByCharityAndDonationTypeResultArr = (NSArray *)GetDonationItemsByCharityAndDonationTypeResultArrRef;
			for(NSDictionary* childObj in GetDonationItemsByCharityAndDonationTypeResultArr) {
				[GetDonationItemsByCharityAndDonationTypeResult addObject:[[IACADCatalogDonationItem alloc] initWithData:childObj]];
			}
		}
		self.count = [[dictionary objectForKey: @"count"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCatalogDonationItem* childObj in GetDonationItemsByCharityAndDonationTypeResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetDonationItemsByCharityAndDonationTypeResult"];
	[dictionary setValue:[NSNumber numberWithInt: self.count] forKey:@"count"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?count=%d&", self.count];
}

@end