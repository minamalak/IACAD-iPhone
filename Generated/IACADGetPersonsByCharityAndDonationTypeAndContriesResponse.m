


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "IACADCatalogPerson.h"
	#import "IACADGetPersonsByCharityAndDonationTypeAndContriesResponse.h"


@implementation IACADGetPersonsByCharityAndDonationTypeAndContriesResponse

@synthesize GetPersonsByCharityAndDonationTypeAndContriesResult;
@synthesize count;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetPersonsByCharityAndDonationTypeAndContriesResult = [[NSMutableArray alloc] init];
		NSObject *GetPersonsByCharityAndDonationTypeAndContriesResultArrRef = nil;
			GetPersonsByCharityAndDonationTypeAndContriesResultArrRef = [dictionary objectForKey:@"GetPersonsByCharityAndDonationTypeAndContriesResult"];

		if([GetPersonsByCharityAndDonationTypeAndContriesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetPersonsByCharityAndDonationTypeAndContriesResultArr = (NSArray *)GetPersonsByCharityAndDonationTypeAndContriesResultArrRef;
			for(NSDictionary * childObj in GetPersonsByCharityAndDonationTypeAndContriesResultArr) {
				[GetPersonsByCharityAndDonationTypeAndContriesResult addObject:[[IACADCatalogPerson alloc] initWithData:childObj]];
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
	for(IACADCatalogPerson* childObj in GetPersonsByCharityAndDonationTypeAndContriesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetPersonsByCharityAndDonationTypeAndContriesResult"];
	[dictionary setValue:self.count forKey:@"count"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?count=%@&", self.count];
}

@end