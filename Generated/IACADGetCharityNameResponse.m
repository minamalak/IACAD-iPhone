


#import <Foundation/Foundation.h>
#import "IACADGetCharityNameResponse.h"


@implementation IACADGetCharityNameResponse

@synthesize GetCharityNameResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *GetCharityNameResultRef = [dictionary objectForKey:@"GetCharityNameResult"];
		if([GetCharityNameResultRef isKindOfClass:[NSNull class]]) {
			self.GetCharityNameResult = nil;
		}
		else {
			self.GetCharityNameResult = [[dictionary objectForKey: @"GetCharityNameResult"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.GetCharityNameResult forKey:@"GetCharityNameResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?GetCharityNameResult=%@&", self.GetCharityNameResult];
}

@end