


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADReliefDonationItem.h"

@implementation IACADReliefDonationItem
@synthesize Amount;
@synthesize ReliefNeedId;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.Amount = [dictionary objectForKey: @"Amount"];
		self.ReliefNeedId = [dictionary objectForKey: @"ReliefNeedId"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.Amount forKey:@"Amount"];
	[dictionary setValue:self.ReliefNeedId forKey:@"ReliefNeedId"];
	return dictionary;
}

@end
