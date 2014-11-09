


#import <Foundation/Foundation.h>
#import "IACADGetCitiesByCountry.h"


@implementation IACADGetCitiesByCountry

@synthesize culture;
@synthesize countryId;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
		self.countryId = [[dictionary objectForKey: @"countryId"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:[NSNumber numberWithInt: self.countryId] forKey:@"countryId"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&countryId=%d&", self.culture, self.countryId];
}

@end