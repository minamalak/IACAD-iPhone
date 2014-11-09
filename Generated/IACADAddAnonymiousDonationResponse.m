


#import <Foundation/Foundation.h>
#import "IACADAddAnonymiousDonationResponse.h"


@implementation IACADAddAnonymiousDonationResponse

@synthesize AddAnonymiousDonationResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *AddAnonymiousDonationResultRef = [dictionary objectForKey:@"AddAnonymiousDonationResult"];
		if([AddAnonymiousDonationResultRef isKindOfClass:[NSNull class]]) {
			self.AddAnonymiousDonationResult = nil;
		}
		else {
			self.AddAnonymiousDonationResult = [[dictionary objectForKey: @"AddAnonymiousDonationResult"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.AddAnonymiousDonationResult forKey:@"AddAnonymiousDonationResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?AddAnonymiousDonationResult=%@&", self.AddAnonymiousDonationResult];
}

@end