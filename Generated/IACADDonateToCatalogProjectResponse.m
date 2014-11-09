


#import <Foundation/Foundation.h>
#import "IACADDonateCatalogResult.h"
#import "IACADDonateToCatalogProjectResponse.h"


@implementation IACADDonateToCatalogProjectResponse

@synthesize DonateToCatalogProjectResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *DonateToCatalogProjectResultRef = [dictionary objectForKey:@"DonateToCatalogProjectResult"];
		if([DonateToCatalogProjectResultRef isKindOfClass:[NSNull class]]) {
			self.DonateToCatalogProjectResult = nil;
		}
		else {
			self.DonateToCatalogProjectResult = [[IACADDonateCatalogResult alloc] initWithData:[dictionary objectForKey: @"DonateToCatalogProjectResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.DonateToCatalogProjectResult JSONDictionary] forKey:@"DonateToCatalogProjectResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end