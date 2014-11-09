


#import <Foundation/Foundation.h>
#import "IACADCatalogDonationItem.h"
#import "IACADGetDonationItemDetailsResponse.h"


@implementation IACADGetDonationItemDetailsResponse

@synthesize GetDonationItemDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *GetDonationItemDetailsResultRef = [dictionary objectForKey:@"GetDonationItemDetailsResult"];
		if([GetDonationItemDetailsResultRef isKindOfClass:[NSNull class]]) {
			self.GetDonationItemDetailsResult = nil;
		}
		else {
			self.GetDonationItemDetailsResult = [[IACADCatalogDonationItem alloc] initWithData:[dictionary objectForKey: @"GetDonationItemDetailsResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.GetDonationItemDetailsResult JSONDictionary] forKey:@"GetDonationItemDetailsResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end