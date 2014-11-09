


#import <Foundation/Foundation.h>
#import "IACADCity.h"
#import "IACADGetCitiesByCountryResponse.h"


@implementation IACADGetCitiesByCountryResponse

@synthesize GetCitiesByCountryResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetCitiesByCountryResult = [[NSMutableArray alloc] init];
		NSObject *GetCitiesByCountryResultArrRef = [dictionary objectForKey:@"GetCitiesByCountryResult"];
		if([GetCitiesByCountryResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetCitiesByCountryResultArr = (NSArray *)GetCitiesByCountryResultArrRef;
			for(NSDictionary* childObj in GetCitiesByCountryResultArr) {
				[GetCitiesByCountryResult addObject:[[IACADCity alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCity* childObj in GetCitiesByCountryResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetCitiesByCountryResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end