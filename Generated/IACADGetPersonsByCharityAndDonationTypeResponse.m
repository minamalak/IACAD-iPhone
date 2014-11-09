


#import <Foundation/Foundation.h>
#import "IACADCatalogPerson.h"
#import "IACADGetPersonsByCharityAndDonationTypeResponse.h"


@implementation IACADGetPersonsByCharityAndDonationTypeResponse

@synthesize GetPersonsByCharityAndDonationTypeResult;
@synthesize count;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetPersonsByCharityAndDonationTypeResult = [[NSMutableArray alloc] init];
		NSObject *GetPersonsByCharityAndDonationTypeResultArrRef = [dictionary objectForKey:@"GetPersonsByCharityAndDonationTypeResult"];
		if([GetPersonsByCharityAndDonationTypeResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetPersonsByCharityAndDonationTypeResultArr = (NSArray *)GetPersonsByCharityAndDonationTypeResultArrRef;
			for(NSDictionary* childObj in GetPersonsByCharityAndDonationTypeResultArr) {
				[GetPersonsByCharityAndDonationTypeResult addObject:[[IACADCatalogPerson alloc] initWithData:childObj]];
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
	for(IACADCatalogPerson* childObj in GetPersonsByCharityAndDonationTypeResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetPersonsByCharityAndDonationTypeResult"];
	[dictionary setValue:[NSNumber numberWithInt: self.count] forKey:@"count"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?count=%d&", self.count];
}

@end