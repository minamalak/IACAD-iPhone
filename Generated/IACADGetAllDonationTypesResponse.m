


#import <Foundation/Foundation.h>
#import "IACADDonationType.h"
#import "IACADGetAllDonationTypesResponse.h"


@implementation IACADGetAllDonationTypesResponse

@synthesize GetAllDonationTypesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetAllDonationTypesResult = [[NSMutableArray alloc] init];
		NSObject *GetAllDonationTypesResultArrRef = [dictionary objectForKey:@"GetAllDonationTypesResult"];
		if([GetAllDonationTypesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetAllDonationTypesResultArr = (NSArray *)GetAllDonationTypesResultArrRef;
			for(NSDictionary* childObj in GetAllDonationTypesResultArr) {
				[GetAllDonationTypesResult addObject:[[IACADDonationType alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADDonationType* childObj in GetAllDonationTypesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetAllDonationTypesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end