


#import <Foundation/Foundation.h>
#import "IACADGetCatalogPersonCountries.h"


@implementation IACADGetCatalogPersonCountries

@synthesize donationTypeId;
@synthesize culture;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.donationTypeId = [[dictionary objectForKey: @"donationTypeId"] intValue];
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt: self.donationTypeId] forKey:@"donationTypeId"];
	[dictionary setValue:self.culture forKey:@"culture"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?donationTypeId=%d&culture=%@&", self.donationTypeId, self.culture];
}

@end