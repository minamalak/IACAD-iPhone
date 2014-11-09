


#import <Foundation/Foundation.h>
#import "IACADCharity.h"
#import "IACADGetCharityDetailsResponse.h"


@implementation IACADGetCharityDetailsResponse

@synthesize GetCharityDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *GetCharityDetailsResultRef = [dictionary objectForKey:@"GetCharityDetailsResult"];
		if([GetCharityDetailsResultRef isKindOfClass:[NSNull class]]) {
			self.GetCharityDetailsResult = nil;
		}
		else {
			self.GetCharityDetailsResult = [[IACADCharity alloc] initWithData:[dictionary objectForKey: @"GetCharityDetailsResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.GetCharityDetailsResult JSONDictionary] forKey:@"GetCharityDetailsResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end