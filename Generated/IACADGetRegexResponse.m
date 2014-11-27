


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADGetRegexResponse.h"


@implementation IACADGetRegexResponse

@synthesize GetRegexResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *GetRegexResultRef = [dictionary objectForKey:@"GetRegexResult"];
		if([GetRegexResultRef isKindOfClass:[NSNull class]]) {  
			self.GetRegexResult = nil;
		}
		else {
			self.GetRegexResult = [dictionary objectForKey: @"GetRegexResult"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.GetRegexResult forKey:@"GetRegexResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?GetRegexResult=%@&", self.GetRegexResult];
}

@end