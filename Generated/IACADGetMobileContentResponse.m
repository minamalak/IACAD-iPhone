


#import <Foundation/Foundation.h>
#import "IACADGetMobileContentResponse.h"


@implementation IACADGetMobileContentResponse

@synthesize GetMobileContentResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *GetMobileContentResultRef = [dictionary objectForKey:@"GetMobileContentResult"];
		if([GetMobileContentResultRef isKindOfClass:[NSNull class]]) {
			self.GetMobileContentResult = nil;
		}
		else {
			self.GetMobileContentResult = [[dictionary objectForKey: @"GetMobileContentResult"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.GetMobileContentResult forKey:@"GetMobileContentResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?GetMobileContentResult=%@&", self.GetMobileContentResult];
}

@end