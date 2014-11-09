


#import <Foundation/Foundation.h>
#import "IACADCatalogDonationItem.h"

@implementation IACADCatalogDonationItem
@synthesize Area;
@synthesize Capacity;
@synthesize CategoryId;
@synthesize CharityDescription;
@synthesize CharityId;
@synthesize CharityName;
@synthesize CharityNameAr;
@synthesize CharityNameEn;
@synthesize Cost;
@synthesize CountryID;
@synthesize CountryName;
@synthesize CountryNameAr;
@synthesize CountryNameEn;
@synthesize Description;
@synthesize DescriptionAr;
@synthesize DescriptionEn;
@synthesize DonationItemId;
@synthesize DonationItemsWaterTypeId;
@synthesize DonationTypeId;
@synthesize DonationTypeName;
@synthesize DonationTypeNameAr;
@synthesize DonationTypeNameEn;
@synthesize DonationTypesCharityShowInCatalog;
@synthesize DontationItemsWaterTypeName;
@synthesize DontationItemsWaterTypeNameAr;
@synthesize DontationItemsWaterTypeNameEn;
@synthesize ExternalEntityDonationItemShowInCatalog;
@synthesize ExternalEntityDonationItemsAssociationPerCharityId;
@synthesize ExternalEntityName;
@synthesize FormattedCost;
@synthesize ImageId;
@synthesize InitialDuration;
@synthesize IsActive;
@synthesize IsContribution;
@synthesize IsQuantitative;
@synthesize Name;
@synthesize NameAr;
@synthesize NameEn;
@synthesize RemainingStock;
@synthesize ShowInCatalog;
@synthesize StockPrice;
@synthesize TotalStock;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *AreaRef = [dictionary objectForKey:@"Area"];
		if([AreaRef isKindOfClass:[NSNull class]]) {
			self.Area = nil;
		}
		else {
			self.Area = [[dictionary objectForKey: @"Area"] intValue];
		}
						
		NSObject *CapacityRef = [dictionary objectForKey:@"Capacity"];
		if([CapacityRef isKindOfClass:[NSNull class]]) {
			self.Capacity = nil;
		}
		else {
			self.Capacity = [[dictionary objectForKey: @"Capacity"] intValue];
		}
		self.CategoryId = [[dictionary objectForKey: @"CategoryId"] intValue];
						
		NSObject *CharityDescriptionRef = [dictionary objectForKey:@"CharityDescription"];
		if([CharityDescriptionRef isKindOfClass:[NSNull class]]) {
			self.CharityDescription = nil;
		}
		else {
			self.CharityDescription = [[dictionary objectForKey: @"CharityDescription"] copy];
		}
		self.CharityId = [[dictionary objectForKey: @"CharityId"] intValue];
						
		NSObject *CharityNameRef = [dictionary objectForKey:@"CharityName"];
		if([CharityNameRef isKindOfClass:[NSNull class]]) {
			self.CharityName = nil;
		}
		else {
			self.CharityName = [[dictionary objectForKey: @"CharityName"] copy];
		}
						
		NSObject *CharityNameArRef = [dictionary objectForKey:@"CharityNameAr"];
		if([CharityNameArRef isKindOfClass:[NSNull class]]) {
			self.CharityNameAr = nil;
		}
		else {
			self.CharityNameAr = [[dictionary objectForKey: @"CharityNameAr"] copy];
		}
						
		NSObject *CharityNameEnRef = [dictionary objectForKey:@"CharityNameEn"];
		if([CharityNameEnRef isKindOfClass:[NSNull class]]) {
			self.CharityNameEn = nil;
		}
		else {
			self.CharityNameEn = [[dictionary objectForKey: @"CharityNameEn"] copy];
		}
		self.Cost = [[dictionary objectForKey: @"Cost"] doubleValue];
		self.CountryID = [[dictionary objectForKey: @"CountryID"] intValue];
						
		NSObject *CountryNameRef = [dictionary objectForKey:@"CountryName"];
		if([CountryNameRef isKindOfClass:[NSNull class]]) {
			self.CountryName = nil;
		}
		else {
			self.CountryName = [[dictionary objectForKey: @"CountryName"] copy];
		}
						
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
						
		NSObject *DescriptionRef = [dictionary objectForKey:@"Description"];
		if([DescriptionRef isKindOfClass:[NSNull class]]) {
			self.Description = nil;
		}
		else {
			self.Description = [[dictionary objectForKey: @"Description"] copy];
		}
						
		NSObject *DescriptionArRef = [dictionary objectForKey:@"DescriptionAr"];
		if([DescriptionArRef isKindOfClass:[NSNull class]]) {
			self.DescriptionAr = nil;
		}
		else {
			self.DescriptionAr = [[dictionary objectForKey: @"DescriptionAr"] copy];
		}
						
		NSObject *DescriptionEnRef = [dictionary objectForKey:@"DescriptionEn"];
		if([DescriptionEnRef isKindOfClass:[NSNull class]]) {
			self.DescriptionEn = nil;
		}
		else {
			self.DescriptionEn = [[dictionary objectForKey: @"DescriptionEn"] copy];
		}
		self.DonationItemId = [[dictionary objectForKey: @"DonationItemId"] intValue];
						
		NSObject *DonationItemsWaterTypeIdRef = [dictionary objectForKey:@"DonationItemsWaterTypeId"];
		if([DonationItemsWaterTypeIdRef isKindOfClass:[NSNull class]]) {
			self.DonationItemsWaterTypeId = nil;
		}
		else {
			self.DonationItemsWaterTypeId = [[dictionary objectForKey: @"DonationItemsWaterTypeId"] intValue];
		}
		self.DonationTypeId = [[dictionary objectForKey: @"DonationTypeId"] intValue];
						
		NSObject *DonationTypeNameRef = [dictionary objectForKey:@"DonationTypeName"];
		if([DonationTypeNameRef isKindOfClass:[NSNull class]]) {
			self.DonationTypeName = nil;
		}
		else {
			self.DonationTypeName = [[dictionary objectForKey: @"DonationTypeName"] copy];
		}
						
		NSObject *DonationTypeNameArRef = [dictionary objectForKey:@"DonationTypeNameAr"];
		if([DonationTypeNameArRef isKindOfClass:[NSNull class]]) {
			self.DonationTypeNameAr = nil;
		}
		else {
			self.DonationTypeNameAr = [[dictionary objectForKey: @"DonationTypeNameAr"] copy];
		}
						
		NSObject *DonationTypeNameEnRef = [dictionary objectForKey:@"DonationTypeNameEn"];
		if([DonationTypeNameEnRef isKindOfClass:[NSNull class]]) {
			self.DonationTypeNameEn = nil;
		}
		else {
			self.DonationTypeNameEn = [[dictionary objectForKey: @"DonationTypeNameEn"] copy];
		}
		self.DonationTypesCharityShowInCatalog = [[dictionary objectForKey: @"DonationTypesCharityShowInCatalog"] boolValue];
						
		NSObject *DontationItemsWaterTypeNameRef = [dictionary objectForKey:@"DontationItemsWaterTypeName"];
		if([DontationItemsWaterTypeNameRef isKindOfClass:[NSNull class]]) {
			self.DontationItemsWaterTypeName = nil;
		}
		else {
			self.DontationItemsWaterTypeName = [[dictionary objectForKey: @"DontationItemsWaterTypeName"] copy];
		}
						
		NSObject *DontationItemsWaterTypeNameArRef = [dictionary objectForKey:@"DontationItemsWaterTypeNameAr"];
		if([DontationItemsWaterTypeNameArRef isKindOfClass:[NSNull class]]) {
			self.DontationItemsWaterTypeNameAr = nil;
		}
		else {
			self.DontationItemsWaterTypeNameAr = [[dictionary objectForKey: @"DontationItemsWaterTypeNameAr"] copy];
		}
						
		NSObject *DontationItemsWaterTypeNameEnRef = [dictionary objectForKey:@"DontationItemsWaterTypeNameEn"];
		if([DontationItemsWaterTypeNameEnRef isKindOfClass:[NSNull class]]) {
			self.DontationItemsWaterTypeNameEn = nil;
		}
		else {
			self.DontationItemsWaterTypeNameEn = [[dictionary objectForKey: @"DontationItemsWaterTypeNameEn"] copy];
		}
		self.ExternalEntityDonationItemShowInCatalog = [[dictionary objectForKey: @"ExternalEntityDonationItemShowInCatalog"] boolValue];
		self.ExternalEntityDonationItemsAssociationPerCharityId = [[dictionary objectForKey: @"ExternalEntityDonationItemsAssociationPerCharityId"] intValue];
						
		NSObject *ExternalEntityNameRef = [dictionary objectForKey:@"ExternalEntityName"];
		if([ExternalEntityNameRef isKindOfClass:[NSNull class]]) {
			self.ExternalEntityName = nil;
		}
		else {
			self.ExternalEntityName = [[dictionary objectForKey: @"ExternalEntityName"] copy];
		}
						
		NSObject *FormattedCostRef = [dictionary objectForKey:@"FormattedCost"];
		if([FormattedCostRef isKindOfClass:[NSNull class]]) {
			self.FormattedCost = nil;
		}
		else {
			self.FormattedCost = [[dictionary objectForKey: @"FormattedCost"] copy];
		}
		self.ImageId = [dictionary objectForKey: @"ImageId"];
		self.InitialDuration = [[dictionary objectForKey: @"InitialDuration"] intValue];
		self.IsActive = [[dictionary objectForKey: @"IsActive"] boolValue];
		self.IsContribution = [[dictionary objectForKey: @"IsContribution"] boolValue];
		self.IsQuantitative = [[dictionary objectForKey: @"IsQuantitative"] boolValue];
						
		NSObject *NameRef = [dictionary objectForKey:@"Name"];
		if([NameRef isKindOfClass:[NSNull class]]) {
			self.Name = nil;
		}
		else {
			self.Name = [[dictionary objectForKey: @"Name"] copy];
		}
						
		NSObject *NameArRef = [dictionary objectForKey:@"NameAr"];
		if([NameArRef isKindOfClass:[NSNull class]]) {
			self.NameAr = nil;
		}
		else {
			self.NameAr = [[dictionary objectForKey: @"NameAr"] copy];
		}
						
		NSObject *NameEnRef = [dictionary objectForKey:@"NameEn"];
		if([NameEnRef isKindOfClass:[NSNull class]]) {
			self.NameEn = nil;
		}
		else {
			self.NameEn = [[dictionary objectForKey: @"NameEn"] copy];
		}
		self.RemainingStock = [[dictionary objectForKey: @"RemainingStock"] longValue];
		self.ShowInCatalog = [[dictionary objectForKey: @"ShowInCatalog"] boolValue];
		self.StockPrice = [[dictionary objectForKey: @"StockPrice"] doubleValue];
		self.TotalStock = [[dictionary objectForKey: @"TotalStock"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt: self.Area] forKey:@"Area"];
	[dictionary setValue:[NSNumber numberWithInt: self.Capacity] forKey:@"Capacity"];
	[dictionary setValue:[NSNumber numberWithInt: self.CategoryId] forKey:@"CategoryId"];
	[dictionary setValue:self.CharityDescription forKey:@"CharityDescription"];
	[dictionary setValue:[NSNumber numberWithInt: self.CharityId] forKey:@"CharityId"];
	[dictionary setValue:self.CharityName forKey:@"CharityName"];
	[dictionary setValue:self.CharityNameAr forKey:@"CharityNameAr"];
	[dictionary setValue:self.CharityNameEn forKey:@"CharityNameEn"];
	[dictionary setValue:[NSNumber numberWithDouble: self.Cost] forKey:@"Cost"];
	[dictionary setValue:[NSNumber numberWithInt: self.CountryID] forKey:@"CountryID"];
	[dictionary setValue:self.CountryName forKey:@"CountryName"];
	[dictionary setValue:self.CountryNameAr forKey:@"CountryNameAr"];
	[dictionary setValue:self.CountryNameEn forKey:@"CountryNameEn"];
	[dictionary setValue:self.Description forKey:@"Description"];
	[dictionary setValue:self.DescriptionAr forKey:@"DescriptionAr"];
	[dictionary setValue:self.DescriptionEn forKey:@"DescriptionEn"];
	[dictionary setValue:[NSNumber numberWithInt: self.DonationItemId] forKey:@"DonationItemId"];
	[dictionary setValue:[NSNumber numberWithInt: self.DonationItemsWaterTypeId] forKey:@"DonationItemsWaterTypeId"];
	[dictionary setValue:[NSNumber numberWithInt: self.DonationTypeId] forKey:@"DonationTypeId"];
	[dictionary setValue:self.DonationTypeName forKey:@"DonationTypeName"];
	[dictionary setValue:self.DonationTypeNameAr forKey:@"DonationTypeNameAr"];
	[dictionary setValue:self.DonationTypeNameEn forKey:@"DonationTypeNameEn"];
	[dictionary setValue:[NSNumber numberWithBool: self.DonationTypesCharityShowInCatalog] forKey:@"DonationTypesCharityShowInCatalog"];
	[dictionary setValue:self.DontationItemsWaterTypeName forKey:@"DontationItemsWaterTypeName"];
	[dictionary setValue:self.DontationItemsWaterTypeNameAr forKey:@"DontationItemsWaterTypeNameAr"];
	[dictionary setValue:self.DontationItemsWaterTypeNameEn forKey:@"DontationItemsWaterTypeNameEn"];
	[dictionary setValue:[NSNumber numberWithBool: self.ExternalEntityDonationItemShowInCatalog] forKey:@"ExternalEntityDonationItemShowInCatalog"];
	[dictionary setValue:[NSNumber numberWithInt: self.ExternalEntityDonationItemsAssociationPerCharityId] forKey:@"ExternalEntityDonationItemsAssociationPerCharityId"];
	[dictionary setValue:self.ExternalEntityName forKey:@"ExternalEntityName"];
	[dictionary setValue:self.FormattedCost forKey:@"FormattedCost"];
	[dictionary setValue:self.ImageId forKey:@"ImageId"];
	[dictionary setValue:[NSNumber numberWithInt: self.InitialDuration] forKey:@"InitialDuration"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsActive] forKey:@"IsActive"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsContribution] forKey:@"IsContribution"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsQuantitative] forKey:@"IsQuantitative"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:self.NameAr forKey:@"NameAr"];
	[dictionary setValue:self.NameEn forKey:@"NameEn"];
	[dictionary setValue:[NSNumber numberWithLong: self.RemainingStock] forKey:@"RemainingStock"];
	[dictionary setValue:[NSNumber numberWithBool: self.ShowInCatalog] forKey:@"ShowInCatalog"];
	[dictionary setValue:[NSNumber numberWithDouble: self.StockPrice] forKey:@"StockPrice"];
	[dictionary setValue:[NSNumber numberWithInt: self.TotalStock] forKey:@"TotalStock"];
	return dictionary;
}

@end
