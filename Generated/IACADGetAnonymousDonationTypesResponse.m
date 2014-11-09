


#import <Foundation/Foundation.h>
#import "IACADGeneralDonationType.h"
#import "IACADGetAnonymousDonationTypesResponse.h"


@implementation IACADGetAnonymousDonationTypesResponse

@synthesize GetAnonymousDonationTypesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetAnonymousDonationTypesResult = [[NSMutableArray alloc] init];
		NSObject *GetAnonymousDonationTypesResultArrRef = [dictionary objectForKey:@"GetAnonymousDonationTypesResult"];
		if([GetAnonymousDonationTypesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetAnonymousDonationTypesResultArr = (NSArray *)GetAnonymousDonationTypesResultArrRef;
			for(NSDictionary* childObj in GetAnonymousDonationTypesResultArr) {
				[GetAnonymousDonationTypesResult addObject:[[IACADGeneralDonationType alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADGeneralDonationType* childObj in GetAnonymousDonationTypesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetAnonymousDonationTypesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end