


#import <Foundation/Foundation.h>
#import "IACADCountry.h"
#import "IACADGetCatalogCountriesResponse.h"


@implementation IACADGetCatalogCountriesResponse

@synthesize GetCatalogCountriesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetCatalogCountriesResult = [[NSMutableArray alloc] init];
		NSObject *GetCatalogCountriesResultArrRef = [dictionary objectForKey:@"GetCatalogCountriesResult"];
		if([GetCatalogCountriesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetCatalogCountriesResultArr = (NSArray *)GetCatalogCountriesResultArrRef;
			for(NSDictionary* childObj in GetCatalogCountriesResultArr) {
				[GetCatalogCountriesResult addObject:[[IACADCountry alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCountry* childObj in GetCatalogCountriesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetCatalogCountriesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end