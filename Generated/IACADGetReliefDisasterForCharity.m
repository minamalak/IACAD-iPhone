


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADGetReliefDisasterForCharity.h"


@implementation IACADGetReliefDisasterForCharity

@synthesize culture;
@synthesize charityId;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {  
			self.culture = nil;
		}
		else {
			self.culture = [dictionary objectForKey: @"culture"];
		}
		self.charityId = [dictionary objectForKey: @"charityId"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:self.charityId forKey:@"charityId"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&charityId=%@&", self.culture, self.charityId];
}

@end