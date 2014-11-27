


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADReliefCharityDisasterOnSite.h"

@implementation IACADReliefCharityDisasterOnSite
@synthesize CharityId;
@synthesize CharityName;
@synthesize DisasterId;
@synthesize DisasterName;
@synthesize DonationExpirationDate;
@synthesize Id;
@synthesize ShowOnSite;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.CharityId = [dictionary objectForKey: @"CharityId"];
						
		NSObject *CharityNameRef = [dictionary objectForKey:@"CharityName"];
		if([CharityNameRef isKindOfClass:[NSNull class]]) {
			self.CharityName = nil;
		}
		else {
			self.CharityName = [dictionary objectForKey: @"CharityName"];
		}
		self.DisasterId = [dictionary objectForKey: @"DisasterId"];
						
		NSObject *DisasterNameRef = [dictionary objectForKey:@"DisasterName"];
		if([DisasterNameRef isKindOfClass:[NSNull class]]) {
			self.DisasterName = nil;
		}
		else {
			self.DisasterName = [dictionary objectForKey: @"DisasterName"];
		}
		self.DonationExpirationDate = [WebServiceEntities deserializeJsonDateString:[dictionary objectForKey: @"DonationExpirationDate"]];
		self.Id = [dictionary objectForKey: @"Id"];
		self.ShowOnSite = [dictionary objectForKey: @"ShowOnSite"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.CharityId forKey:@"CharityId"];
	[dictionary setValue:self.CharityName forKey:@"CharityName"];
	[dictionary setValue:self.DisasterId forKey:@"DisasterId"];
	[dictionary setValue:self.DisasterName forKey:@"DisasterName"];
	[dictionary setValue:[WebServiceEntities serializeToJsonDateString: self.DonationExpirationDate] forKey:@"DonationExpirationDate"];
	[dictionary setValue:self.Id forKey:@"Id"];
	[dictionary setValue:self.ShowOnSite forKey:@"ShowOnSite"];
	return dictionary;
}

@end
