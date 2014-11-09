


#import <Foundation/Foundation.h>
#import "IACADCatalogPerson.h"
#import "WebServiceEntities.h"

@implementation IACADCatalogPerson
@synthesize CharityId;
@synthesize CountryID;
@synthesize CountryNameAr;
@synthesize CountryNameEn;
@synthesize DateOfBirth;
@synthesize DateOfBirthText;
@synthesize DonationCost;
@synthesize DonationTypeId;
@synthesize FamilyNameAr;
@synthesize FamilyNameEn;
@synthesize FatherNameAr;
@synthesize FatherNameEn;
@synthesize FirstNameAr;
@synthesize FirstNameEn;
@synthesize FormattedDonationCost;
@synthesize FullName;
@synthesize FullNameAr;
@synthesize FullNameEn;
@synthesize Gender;
@synthesize GenderText;
@synthesize GenrealPersonsPhotoFileID;
@synthesize GrandNameAr;
@synthesize GrandNameEn;
@synthesize ID;
@synthesize IsLocked;


- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.CharityId = [[dictionary objectForKey: @"CharityId"] intValue];
		self.CountryID = [[dictionary objectForKey: @"CountryID"] intValue];
						
		NSObject *CountryNameArRef = [dictionary objectForKey:@"CountryNameAr"];
		if([CountryNameArRef isKindOfClass:[NSNull class]]) {
			self.CountryNameAr = nil;
		}
		else {
			self.CountryNameAr = [[dictionary objectForKey: @"CountryNameAr"] copy];
		}
						
		NSObject *CountryNameEnRef = [dictionary objectForKey:@"CountryNameEn"];
		if([CountryNameEnRef isKindOfClass:[NSNull class]]) {
			self.CountryNameEn = nil;
		}
		else {
			self.CountryNameEn = [[dictionary objectForKey: @"CountryNameEn"] copy];
		}
		self.DateOfBirth = [WebServiceEntities deserializeJsonDateString:[dictionary objectForKey: @"DateOfBirth"]];
						
		NSObject *DateOfBirthTextRef = [dictionary objectForKey:@"DateOfBirthText"];
		if([DateOfBirthTextRef isKindOfClass:[NSNull class]]) {
			self.DateOfBirthText = nil;
		}
		else {
			self.DateOfBirthText = [[dictionary objectForKey: @"DateOfBirthText"] copy];
		}
						
		NSObject *DonationCostRef = [dictionary objectForKey:@"DonationCost"];
		if([DonationCostRef isKindOfClass:[NSNull class]]) {
			self.DonationCost = 0;
		}
		else {
			self.DonationCost = [[dictionary objectForKey: @"DonationCost"] doubleValue];
		}
		self.DonationTypeId = [[dictionary objectForKey: @"DonationTypeId"] intValue];
						
		NSObject *FamilyNameArRef = [dictionary objectForKey:@"FamilyNameAr"];
		if([FamilyNameArRef isKindOfClass:[NSNull class]]) {
			self.FamilyNameAr = nil;
		}
		else {
			self.FamilyNameAr = [[dictionary objectForKey: @"FamilyNameAr"] copy];
		}
						
		NSObject *FamilyNameEnRef = [dictionary objectForKey:@"FamilyNameEn"];
		if([FamilyNameEnRef isKindOfClass:[NSNull class]]) {
			self.FamilyNameEn = nil;
		}
		else {
			self.FamilyNameEn = [[dictionary objectForKey: @"FamilyNameEn"] copy];
		}
						
		NSObject *FatherNameArRef = [dictionary objectForKey:@"FatherNameAr"];
		if([FatherNameArRef isKindOfClass:[NSNull class]]) {
			self.FatherNameAr = nil;
		}
		else {
			self.FatherNameAr = [[dictionary objectForKey: @"FatherNameAr"] copy];
		}
						
		NSObject *FatherNameEnRef = [dictionary objectForKey:@"FatherNameEn"];
		if([FatherNameEnRef isKindOfClass:[NSNull class]]) {
			self.FatherNameEn = nil;
		}
		else {
			self.FatherNameEn = [[dictionary objectForKey: @"FatherNameEn"] copy];
		}
						
		NSObject *FirstNameArRef = [dictionary objectForKey:@"FirstNameAr"];
		if([FirstNameArRef isKindOfClass:[NSNull class]]) {
			self.FirstNameAr = nil;
		}
		else {
			self.FirstNameAr = [[dictionary objectForKey: @"FirstNameAr"] copy];
		}
						
		NSObject *FirstNameEnRef = [dictionary objectForKey:@"FirstNameEn"];
		if([FirstNameEnRef isKindOfClass:[NSNull class]]) {
			self.FirstNameEn = nil;
		}
		else {
			self.FirstNameEn = [[dictionary objectForKey: @"FirstNameEn"] copy];
		}
						
		NSObject *FormattedDonationCostRef = [dictionary objectForKey:@"FormattedDonationCost"];
		if([FormattedDonationCostRef isKindOfClass:[NSNull class]]) {
			self.FormattedDonationCost = nil;
		}
		else {
			self.FormattedDonationCost = [[dictionary objectForKey: @"FormattedDonationCost"] copy];
		}
						
		NSObject *FullNameRef = [dictionary objectForKey:@"FullName"];
		if([FullNameRef isKindOfClass:[NSNull class]]) {
			self.FullName = nil;
		}
		else {
			self.FullName = [[dictionary objectForKey: @"FullName"] copy];
		}
						
		NSObject *FullNameArRef = [dictionary objectForKey:@"FullNameAr"];
		if([FullNameArRef isKindOfClass:[NSNull class]]) {
			self.FullNameAr = nil;
		}
		else {
			self.FullNameAr = [[dictionary objectForKey: @"FullNameAr"] copy];
		}
						
		NSObject *FullNameEnRef = [dictionary objectForKey:@"FullNameEn"];
		if([FullNameEnRef isKindOfClass:[NSNull class]]) {
			self.FullNameEn = nil;
		}
		else {
			self.FullNameEn = [[dictionary objectForKey: @"FullNameEn"] copy];
		}
						
		NSObject *GenderRef = [dictionary objectForKey:@"Gender"];
		if([GenderRef isKindOfClass:[NSNull class]]) {
			self.Gender = nil;
		}
		else {
			self.Gender = [[dictionary objectForKey: @"Gender"] boolValue];
		}
						
		NSObject *GenderTextRef = [dictionary objectForKey:@"GenderText"];
		if([GenderTextRef isKindOfClass:[NSNull class]]) {
			self.GenderText = nil;
		}
		else {
			self.GenderText = [[dictionary objectForKey: @"GenderText"] copy];
		}
						
		NSObject *GenrealPersonsPhotoFileIDRef = [dictionary objectForKey:@"GenrealPersonsPhotoFileID"];
		if([GenrealPersonsPhotoFileIDRef isKindOfClass:[NSNull class]]) {
			self.GenrealPersonsPhotoFileID = nil;
		}
		else {
			self.GenrealPersonsPhotoFileID = [dictionary objectForKey: @"GenrealPersonsPhotoFileID"];
		}
						
		NSObject *GrandNameArRef = [dictionary objectForKey:@"GrandNameAr"];
		if([GrandNameArRef isKindOfClass:[NSNull class]]) {
			self.GrandNameAr = nil;
		}
		else {
			self.GrandNameAr = [[dictionary objectForKey: @"GrandNameAr"] copy];
		}
						
		NSObject *GrandNameEnRef = [dictionary objectForKey:@"GrandNameEn"];
		if([GrandNameEnRef isKindOfClass:[NSNull class]]) {
			self.GrandNameEn = nil;
		}
		else {
			self.GrandNameEn = [[dictionary objectForKey: @"GrandNameEn"] copy];
		}
		self.ID = [[dictionary objectForKey: @"ID"] longValue];
						
		NSObject *IsLockedRef = [dictionary objectForKey:@"IsLocked"];
		if([IsLockedRef isKindOfClass:[NSNull class]]) {
			self.IsLocked = nil;
		}
		else {
			self.IsLocked = [[dictionary objectForKey: @"IsLocked"] boolValue];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt: self.CharityId] forKey:@"CharityId"];
	[dictionary setValue:[NSNumber numberWithInt: self.CountryID] forKey:@"CountryID"];
	[dictionary setValue:self.CountryNameAr forKey:@"CountryNameAr"];
	[dictionary setValue:self.CountryNameEn forKey:@"CountryNameEn"];
	[dictionary setValue:[WebServiceEntities serializeToJsonDateString: self.DateOfBirth] forKey:@"DateOfBirth"];
	[dictionary setValue:self.DateOfBirthText forKey:@"DateOfBirthText"];
	[dictionary setValue:[NSNumber numberWithDouble: self.DonationCost] forKey:@"DonationCost"];
	[dictionary setValue:[NSNumber numberWithInt: self.DonationTypeId] forKey:@"DonationTypeId"];
	[dictionary setValue:self.FamilyNameAr forKey:@"FamilyNameAr"];
	[dictionary setValue:self.FamilyNameEn forKey:@"FamilyNameEn"];
	[dictionary setValue:self.FatherNameAr forKey:@"FatherNameAr"];
	[dictionary setValue:self.FatherNameEn forKey:@"FatherNameEn"];
	[dictionary setValue:self.FirstNameAr forKey:@"FirstNameAr"];
	[dictionary setValue:self.FirstNameEn forKey:@"FirstNameEn"];
	[dictionary setValue:self.FormattedDonationCost forKey:@"FormattedDonationCost"];
	[dictionary setValue:self.FullName forKey:@"FullName"];
	[dictionary setValue:self.FullNameAr forKey:@"FullNameAr"];
	[dictionary setValue:self.FullNameEn forKey:@"FullNameEn"];
	[dictionary setValue:[NSNumber numberWithBool: self.Gender] forKey:@"Gender"];
	[dictionary setValue:self.GenderText forKey:@"GenderText"];
	[dictionary setValue:self.GenrealPersonsPhotoFileID forKey:@"GenrealPersonsPhotoFileID"];
	[dictionary setValue:self.GrandNameAr forKey:@"GrandNameAr"];
	[dictionary setValue:self.GrandNameEn forKey:@"GrandNameEn"];
	[dictionary setValue:[NSNumber numberWithLong: self.ID] forKey:@"ID"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsLocked] forKey:@"IsLocked"];
	return dictionary;
}

@end
