


#import <Foundation/Foundation.h>
#import "IACADDonateCatalogResult.h"
#import "IACADDonateToCatalogPersonResponse.h"


@implementation IACADDonateToCatalogPersonResponse

@synthesize DonateToCatalogPersonResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *DonateToCatalogPersonResultRef = [dictionary objectForKey:@"DonateToCatalogPersonResult"];
		if([DonateToCatalogPersonResultRef isKindOfClass:[NSNull class]]) {
			self.DonateToCatalogPersonResult = nil;
		}
		else {
			self.DonateToCatalogPersonResult = [[IACADDonateCatalogResult alloc] initWithData:[dictionary objectForKey: @"DonateToCatalogPersonResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.DonateToCatalogPersonResult JSONDictionary] forKey:@"DonateToCatalogPersonResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end