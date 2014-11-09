


#import <Foundation/Foundation.h>
#import "IACADIACADEvent.h"
#import "IACADGetEventDetailsResponse.h"


@implementation IACADGetEventDetailsResponse

@synthesize GetEventDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *GetEventDetailsResultRef = [dictionary objectForKey:@"GetEventDetailsResult"];
		if([GetEventDetailsResultRef isKindOfClass:[NSNull class]]) {
			self.GetEventDetailsResult = nil;
		}
		else {
			self.GetEventDetailsResult = [[IACADIACADEvent alloc] initWithData:[dictionary objectForKey: @"GetEventDetailsResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.GetEventDetailsResult JSONDictionary] forKey:@"GetEventDetailsResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end