


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADAddReliefDonationResponse.h"


@implementation IACADAddReliefDonationResponse

@synthesize AddReliefDonationResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *AddReliefDonationResultRef = [dictionary objectForKey:@"AddReliefDonationResult"];
		if([AddReliefDonationResultRef isKindOfClass:[NSNull class]]) {  
			self.AddReliefDonationResult = nil;
		}
		else {
			self.AddReliefDonationResult = [dictionary objectForKey: @"AddReliefDonationResult"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.AddReliefDonationResult forKey:@"AddReliefDonationResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?AddReliefDonationResult=%@&", self.AddReliefDonationResult];
}

@end