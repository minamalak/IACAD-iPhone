


#import <Foundation/Foundation.h>
#import "IACADCatalogPersonDetail.h"
#import "IACADGetCatalogPersonDetailsResponse.h"


@implementation IACADGetCatalogPersonDetailsResponse

@synthesize GetCatalogPersonDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *GetCatalogPersonDetailsResultRef = [dictionary objectForKey:@"GetCatalogPersonDetailsResult"];
		if([GetCatalogPersonDetailsResultRef isKindOfClass:[NSNull class]]) {
			self.GetCatalogPersonDetailsResult = nil;
		}
		else {
			self.GetCatalogPersonDetailsResult = [[IACADCatalogPersonDetail alloc] initWithData:[dictionary objectForKey: @"GetCatalogPersonDetailsResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.GetCatalogPersonDetailsResult JSONDictionary] forKey:@"GetCatalogPersonDetailsResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end