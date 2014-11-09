


#import <Foundation/Foundation.h>
#import "IACADDonateToCatalogProject.h"


@implementation IACADDonateToCatalogProject

@synthesize culture;
@synthesize charityId;
@synthesize donorId;
@synthesize externalEntityDonationItemsAssociationPerCharityId;
@synthesize projectName;
@synthesize projectNotes;
@synthesize noOfItems;

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
		self.donorId = [dictionary objectForKey: @"donorId"];
		self.externalEntityDonationItemsAssociationPerCharityId = [[dictionary objectForKey: @"externalEntityDonationItemsAssociationPerCharityId"] intValue];
						
		NSObject *projectNameRef = [dictionary objectForKey:@"projectName"];
		if([projectNameRef isKindOfClass:[NSNull class]]) {
			self.projectName = nil;
		}
		else {
			self.projectName = [[dictionary objectForKey: @"projectName"] copy];
		}
						
		NSObject *projectNotesRef = [dictionary objectForKey:@"projectNotes"];
		if([projectNotesRef isKindOfClass:[NSNull class]]) {
			self.projectNotes = nil;
		}
		else {
			self.projectNotes = [[dictionary objectForKey: @"projectNotes"] copy];
		}
		self.noOfItems = [[dictionary objectForKey: @"noOfItems"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:[NSNumber numberWithInt: self.charityId] forKey:@"charityId"];
	[dictionary setValue:self.donorId forKey:@"donorId"];
	[dictionary setValue:[NSNumber numberWithInt: self.externalEntityDonationItemsAssociationPerCharityId] forKey:@"externalEntityDonationItemsAssociationPerCharityId"];
	[dictionary setValue:self.projectName forKey:@"projectName"];
	[dictionary setValue:self.projectNotes forKey:@"projectNotes"];
	[dictionary setValue:[NSNumber numberWithInt: self.noOfItems] forKey:@"noOfItems"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&charityId=%d&donorId=%@&externalEntityDonationItemsAssociationPerCharityId=%d&projectName=%@&projectNotes=%@&noOfItems=%d&", self.culture, self.charityId, self.donorId, self.externalEntityDonationItemsAssociationPerCharityId, self.projectName, self.projectNotes, self.noOfItems];
}

@end