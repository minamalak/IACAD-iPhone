


#import <Foundation/Foundation.h>
#import "IACADCountry.h"
#import "IACADGetCountriesResponse.h"


@implementation IACADGetCountriesResponse

@synthesize GetCountriesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetCountriesResult = [[NSMutableArray alloc] init];
		NSObject *GetCountriesResultArrRef = [dictionary objectForKey:@"GetCountriesResult"];
		if([GetCountriesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetCountriesResultArr = (NSArray *)GetCountriesResultArrRef;
			for(NSDictionary* childObj in GetCountriesResultArr) {
				[GetCountriesResult addObject:[[IACADCountry alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCountry* childObj in GetCountriesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetCountriesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end