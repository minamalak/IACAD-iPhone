


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADGetReliefNeedForDisaster.h"


@implementation IACADGetReliefNeedForDisaster

@synthesize culture;
@synthesize disasterId;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {  
			self.culture = nil;
		}
		else {
			self.culture = [dictionary objectForKey: @"culture"];
		}
		self.disasterId = [dictionary objectForKey: @"disasterId"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:self.disasterId forKey:@"disasterId"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&disasterId=%@&", self.culture, self.disasterId];
}

@end