


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "IACADReliefDonationItem.h"
	#import "IACADAddReliefDonation.h"


@implementation IACADAddReliefDonation

@synthesize culture;
@synthesize charityId;
@synthesize items;
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
		self.charityId = [dictionary objectForKey: @"charityId"];
		items = [[NSMutableArray alloc] init];
		NSObject *itemsArrRef = nil;
			itemsArrRef = [dictionary objectForKey:@"items"];

		if([itemsArrRef isKindOfClass:[NSArray class]]) {
			NSArray* itemsArr = (NSArray *)itemsArrRef;
			for(NSDictionary * childObj in itemsArr) {
				[items addObject:[[IACADReliefDonationItem alloc] initWithData:childObj]];
			}
		}
		self.disasterId = [dictionary objectForKey: @"disasterId"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:self.charityId forKey:@"charityId"];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADReliefDonationItem* childObj in items) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"items"];
	[dictionary setValue:self.disasterId forKey:@"disasterId"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&charityId=%@&disasterId=%@&", self.culture, self.charityId, self.disasterId];
}

@end