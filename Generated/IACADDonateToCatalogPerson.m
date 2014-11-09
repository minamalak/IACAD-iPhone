


#import <Foundation/Foundation.h>
#import "IACADDonateToCatalogPerson.h"


@implementation IACADDonateToCatalogPerson

@synthesize culture;
@synthesize charityId;
@synthesize donorId;
@synthesize personId;
@synthesize monthlyCost;
@synthesize noOfMonths;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
		self.charityId = [[dictionary objectForKey: @"charityId"] intValue];
		self.donorId = [dictionary objectForKey: @"donorId"];
		self.personId = [[dictionary objectForKey: @"personId"] longValue];
		self.monthlyCost = [[dictionary objectForKey: @"monthlyCost"] doubleValue];
		self.noOfMonths = [[dictionary objectForKey: @"noOfMonths"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:[NSNumber numberWithInt: self.charityId] forKey:@"charityId"];
	[dictionary setValue:self.donorId forKey:@"donorId"];
	[dictionary setValue:[NSNumber numberWithLong: self.personId] forKey:@"personId"];
	[dictionary setValue:[NSNumber numberWithDouble: self.monthlyCost] forKey:@"monthlyCost"];
	[dictionary setValue:[NSNumber numberWithInt: self.noOfMonths] forKey:@"noOfMonths"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&charityId=%d&donorId=%@&personId=%d&monthlyCost=%f&noOfMonths=%d&", self.culture, self.charityId, self.donorId, self.personId, self.monthlyCost, self.noOfMonths];
}

@end