


#import <Foundation/Foundation.h>
#import "IACADAnonymiousDonationItem.h"

@implementation IACADAnonymiousDonationItem
@synthesize Amount;
@synthesize DonationTypeID;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.Amount = [[dictionary objectForKey: @"Amount"] doubleValue];
		self.DonationTypeID = [[dictionary objectForKey: @"DonationTypeID"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithDouble: self.Amount] forKey:@"Amount"];
	[dictionary setValue:[NSNumber numberWithInt: self.DonationTypeID] forKey:@"DonationTypeID"];
	return dictionary;
}

@end
