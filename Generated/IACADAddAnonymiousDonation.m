


#import <Foundation/Foundation.h>
#import "IACADAnonymiousDonationItem.h"
#import "IACADAddAnonymiousDonation.h"


@implementation IACADAddAnonymiousDonation

@synthesize culture;
@synthesize charityId;
@synthesize items;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
		self.charityId = [[dictionary objectForKey: @"charityId"] intValue];
		items = [[NSMutableArray alloc] init];
		NSObject *itemsArrRef = [dictionary objectForKey:@"items"];
		if([itemsArrRef isKindOfClass:[NSArray class]]) {
			NSArray* itemsArr = (NSArray *)itemsArrRef;
			for(NSDictionary* childObj in itemsArr) {
				[items addObject:[[IACADAnonymiousDonationItem alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:[NSNumber numberWithInt: self.charityId] forKey:@"charityId"];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADAnonymiousDonationItem* childObj in items) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"items"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&charityId=%d&", self.culture, self.charityId];
}

@end