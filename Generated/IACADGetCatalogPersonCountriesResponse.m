


#import <Foundation/Foundation.h>
#import "IACADCountry.h"
#import "IACADGetCatalogPersonCountriesResponse.h"


@implementation IACADGetCatalogPersonCountriesResponse

@synthesize GetCatalogPersonCountriesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetCatalogPersonCountriesResult = [[NSMutableArray alloc] init];
		NSObject *GetCatalogPersonCountriesResultArrRef = [dictionary objectForKey:@"GetCatalogPersonCountriesResult"];
		if([GetCatalogPersonCountriesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetCatalogPersonCountriesResultArr = (NSArray *)GetCatalogPersonCountriesResultArrRef;
			for(NSDictionary* childObj in GetCatalogPersonCountriesResultArr) {
				[GetCatalogPersonCountriesResult addObject:[[IACADCountry alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCountry* childObj in GetCatalogPersonCountriesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetCatalogPersonCountriesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end