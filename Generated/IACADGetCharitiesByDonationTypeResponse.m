


#import <Foundation/Foundation.h>
#import "IACADCharity.h"
#import "IACADGetCharitiesByDonationTypeResponse.h"


@implementation IACADGetCharitiesByDonationTypeResponse

@synthesize GetCharitiesByDonationTypeResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetCharitiesByDonationTypeResult = [[NSMutableArray alloc] init];
		NSObject *GetCharitiesByDonationTypeResultArrRef = [dictionary objectForKey:@"GetCharitiesByDonationTypeResult"];
		if([GetCharitiesByDonationTypeResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetCharitiesByDonationTypeResultArr = (NSArray *)GetCharitiesByDonationTypeResultArrRef;
			for(NSDictionary* childObj in GetCharitiesByDonationTypeResultArr) {
				[GetCharitiesByDonationTypeResult addObject:[[IACADCharity alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCharity* childObj in GetCharitiesByDonationTypeResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetCharitiesByDonationTypeResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end