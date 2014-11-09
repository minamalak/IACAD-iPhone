


#import <Foundation/Foundation.h>
#import "IACADGetDonationItemDetails.h"


@implementation IACADGetDonationItemDetails

@synthesize entityDonationItemsAssociationPerCharityId;
@synthesize culture;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.entityDonationItemsAssociationPerCharityId = [[dictionary objectForKey: @"entityDonationItemsAssociationPerCharityId"] intValue];
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt: self.entityDonationItemsAssociationPerCharityId] forKey:@"entityDonationItemsAssociationPerCharityId"];
	[dictionary setValue:self.culture forKey:@"culture"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?entityDonationItemsAssociationPerCharityId=%d&culture=%@&", self.entityDonationItemsAssociationPerCharityId, self.culture];
}

@end