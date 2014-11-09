


#import <Foundation/Foundation.h>
#import "IACADCharity.h"

@implementation IACADCharity
@synthesize ADReference;
@synthesize AXID;
@synthesize AccessKey;
@synthesize Address;
@synthesize AddressAr;
@synthesize AddressEn;
@synthesize AnonymousDonationAXID;
@synthesize CharityCode;
@synthesize City;
@synthesize CityID;
@synthesize ContributionTypeImage;
@synthesize DepartmentsCombined;
@synthesize Description;
@synthesize DescriptionAr;
@synthesize DescriptionEn;
@synthesize Email;
@synthesize Fax;
@synthesize GeographicLocation;
@synthesize HideCaseProfile;
@synthesize ID;
@synthesize ImageId;
@synthesize IsIACAD;
@synthesize Latitude;
@synthesize Longitude;
@synthesize MerchantId;
@synthesize Mobile;
@synthesize Name;
@synthesize NameAr;
@synthesize NameEn;
@synthesize Phone;
@synthesize ReportsLogo;
@synthesize SecretKey;
@synthesize ShowOnHomepage;
@synthesize SiteName;
@synthesize StoreID;
@synthesize WebSite;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *ADReferenceRef = [dictionary objectForKey:@"ADReference"];
		if([ADReferenceRef isKindOfClass:[NSNull class]]) {
			self.ADReference = nil;
		}
		else {
			self.ADReference = [[dictionary objectForKey: @"ADReference"] copy];
		}
						
		NSObject *AXIDRef = [dictionary objectForKey:@"AXID"];
		if([AXIDRef isKindOfClass:[NSNull class]]) {
			self.AXID = nil;
		}
		else {
			self.AXID = [[dictionary objectForKey: @"AXID"] copy];
		}
						
		NSObject *AccessKeyRef = [dictionary objectForKey:@"AccessKey"];
		if([AccessKeyRef isKindOfClass:[NSNull class]]) {
			self.AccessKey = nil;
		}
		else {
			self.AccessKey = [[dictionary objectForKey: @"AccessKey"] copy];
		}
						
		NSObject *AddressRef = [dictionary objectForKey:@"Address"];
		if([AddressRef isKindOfClass:[NSNull class]]) {
			self.Address = nil;
		}
		else {
			self.Address = [[dictionary objectForKey: @"Address"] copy];
		}
						
		NSObject *AddressArRef = [dictionary objectForKey:@"AddressAr"];
		if([AddressArRef isKindOfClass:[NSNull class]]) {
			self.AddressAr = nil;
		}
		else {
			self.AddressAr = [[dictionary objectForKey: @"AddressAr"] copy];
		}
						
		NSObject *AddressEnRef = [dictionary objectForKey:@"AddressEn"];
		if([AddressEnRef isKindOfClass:[NSNull class]]) {
			self.AddressEn = nil;
		}
		else {
			self.AddressEn = [[dictionary objectForKey: @"AddressEn"] copy];
		}
						
		NSObject *AnonymousDonationAXIDRef = [dictionary objectForKey:@"AnonymousDonationAXID"];
		if([AnonymousDonationAXIDRef isKindOfClass:[NSNull class]]) {
			self.AnonymousDonationAXID = nil;
		}
		else {
			self.AnonymousDonationAXID = [[dictionary objectForKey: @"AnonymousDonationAXID"] copy];
		}
						
		NSObject *CharityCodeRef = [dictionary objectForKey:@"CharityCode"];
		if([CharityCodeRef isKindOfClass:[NSNull class]]) {
			self.CharityCode = nil;
		}
		else {
			self.CharityCode = [[dictionary objectForKey: @"CharityCode"] copy];
		}
						
		NSObject *CityRef = [dictionary objectForKey:@"City"];
		if([CityRef isKindOfClass:[NSNull class]]) {
			self.City = nil;
		}
		else {
			self.City = [[dictionary objectForKey: @"City"] copy];
		}
						
		NSObject *CityIDRef = [dictionary objectForKey:@"CityID"];
		if([CityIDRef isKindOfClass:[NSNull class]]) {
			self.CityID = 0;
		}
		else {
			self.CityID = [[dictionary objectForKey: @"CityID"] intValue];
		}
						
		NSObject *ContributionTypeImageRef = [dictionary objectForKey:@"ContributionTypeImage"];
		if([ContributionTypeImageRef isKindOfClass:[NSNull class]]) {
			self.ContributionTypeImage = nil;
		}
		else {
			self.ContributionTypeImage = [dictionary objectForKey: @"ContributionTypeImage"];
		}
						
		NSObject *DepartmentsCombinedRef = [dictionary objectForKey:@"DepartmentsCombined"];
		if([DepartmentsCombinedRef isKindOfClass:[NSNull class]]) {
			self.DepartmentsCombined = nil;
		}
		else {
			self.DepartmentsCombined = [[dictionary objectForKey: @"DepartmentsCombined"] copy];
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
						
		NSObject *EmailRef = [dictionary objectForKey:@"Email"];
		if([EmailRef isKindOfClass:[NSNull class]]) {
			self.Email = nil;
		}
		else {
			self.Email = [[dictionary objectForKey: @"Email"] copy];
		}
						
		NSObject *FaxRef = [dictionary objectForKey:@"Fax"];
		if([FaxRef isKindOfClass:[NSNull class]]) {
			self.Fax = nil;
		}
		else {
			self.Fax = [[dictionary objectForKey: @"Fax"] copy];
		}
						
		NSObject *GeographicLocationRef = [dictionary objectForKey:@"GeographicLocation"];
		if([GeographicLocationRef isKindOfClass:[NSNull class]]) {
			self.GeographicLocation = nil;
		}
		else {
			self.GeographicLocation = [[dictionary objectForKey: @"GeographicLocation"] copy];
		}
		self.HideCaseProfile = [[dictionary objectForKey: @"HideCaseProfile"] boolValue];
		self.ID = [[dictionary objectForKey: @"ID"] intValue];
						
		NSObject *ImageIdRef = [dictionary objectForKey:@"ImageId"];
		if([ImageIdRef isKindOfClass:[NSNull class]]) {
			self.ImageId = nil;
		}
		else {
			self.ImageId = [dictionary objectForKey: @"ImageId"];
		}
						
		NSObject *IsIACADRef = [dictionary objectForKey:@"IsIACAD"];
		if([IsIACADRef isKindOfClass:[NSNull class]]) {
			self.IsIACAD = nil;
		}
		else {
			self.IsIACAD = [[dictionary objectForKey: @"IsIACAD"] boolValue];
		}
						
		NSObject *LatitudeRef = [dictionary objectForKey:@"Latitude"];
		if([LatitudeRef isKindOfClass:[NSNull class]]) {
			self.Latitude = nil;
		}
		else {
			self.Latitude = [[dictionary objectForKey: @"Latitude"] copy];
		}
						
		NSObject *LongitudeRef = [dictionary objectForKey:@"Longitude"];
		if([LongitudeRef isKindOfClass:[NSNull class]]) {
			self.Longitude = nil;
		}
		else {
			self.Longitude = [[dictionary objectForKey: @"Longitude"] copy];
		}
						
		NSObject *MerchantIdRef = [dictionary objectForKey:@"MerchantId"];
		if([MerchantIdRef isKindOfClass:[NSNull class]]) {
			self.MerchantId = nil;
		}
		else {
			self.MerchantId = [[dictionary objectForKey: @"MerchantId"] copy];
		}
						
		NSObject *MobileRef = [dictionary objectForKey:@"Mobile"];
		if([MobileRef isKindOfClass:[NSNull class]]) {
			self.Mobile = nil;
		}
		else {
			self.Mobile = [[dictionary objectForKey: @"Mobile"] copy];
		}
						
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
						
		NSObject *PhoneRef = [dictionary objectForKey:@"Phone"];
		if([PhoneRef isKindOfClass:[NSNull class]]) {
			self.Phone = nil;
		}
		else {
			self.Phone = [[dictionary objectForKey: @"Phone"] copy];
		}
						
		NSObject *ReportsLogoRef = [dictionary objectForKey:@"ReportsLogo"];
		if([ReportsLogoRef isKindOfClass:[NSNull class]]) {
			self.ReportsLogo = nil;
		}
		else {
			self.ReportsLogo = [dictionary objectForKey: @"ReportsLogo"];
		}
						
		NSObject *SecretKeyRef = [dictionary objectForKey:@"SecretKey"];
		if([SecretKeyRef isKindOfClass:[NSNull class]]) {
			self.SecretKey = nil;
		}
		else {
			self.SecretKey = [[dictionary objectForKey: @"SecretKey"] copy];
		}
		self.ShowOnHomepage = [[dictionary objectForKey: @"ShowOnHomepage"] boolValue];
						
		NSObject *SiteNameRef = [dictionary objectForKey:@"SiteName"];
		if([SiteNameRef isKindOfClass:[NSNull class]]) {
			self.SiteName = nil;
		}
		else {
			self.SiteName = [[dictionary objectForKey: @"SiteName"] copy];
		}
						
		NSObject *StoreIDRef = [dictionary objectForKey:@"StoreID"];
		if([StoreIDRef isKindOfClass:[NSNull class]]) {
			self.StoreID = nil;
		}
		else {
			self.StoreID = [[dictionary objectForKey: @"StoreID"] copy];
		}
						
		NSObject *WebSiteRef = [dictionary objectForKey:@"WebSite"];
		if([WebSiteRef isKindOfClass:[NSNull class]]) {
			self.WebSite = nil;
		}
		else {
			self.WebSite = [[dictionary objectForKey: @"WebSite"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.ADReference forKey:@"ADReference"];
	[dictionary setValue:self.AXID forKey:@"AXID"];
	[dictionary setValue:self.AccessKey forKey:@"AccessKey"];
	[dictionary setValue:self.Address forKey:@"Address"];
	[dictionary setValue:self.AddressAr forKey:@"AddressAr"];
	[dictionary setValue:self.AddressEn forKey:@"AddressEn"];
	[dictionary setValue:self.AnonymousDonationAXID forKey:@"AnonymousDonationAXID"];
	[dictionary setValue:self.CharityCode forKey:@"CharityCode"];
	[dictionary setValue:self.City forKey:@"City"];
	[dictionary setValue:[NSNumber numberWithInt: self.CityID] forKey:@"CityID"];
	[dictionary setValue:self.ContributionTypeImage forKey:@"ContributionTypeImage"];
	[dictionary setValue:self.DepartmentsCombined forKey:@"DepartmentsCombined"];
	[dictionary setValue:self.Description forKey:@"Description"];
	[dictionary setValue:self.DescriptionAr forKey:@"DescriptionAr"];
	[dictionary setValue:self.DescriptionEn forKey:@"DescriptionEn"];
	[dictionary setValue:self.Email forKey:@"Email"];
	[dictionary setValue:self.Fax forKey:@"Fax"];
	[dictionary setValue:self.GeographicLocation forKey:@"GeographicLocation"];
	[dictionary setValue:[NSNumber numberWithBool: self.HideCaseProfile] forKey:@"HideCaseProfile"];
	[dictionary setValue:[NSNumber numberWithInt: self.ID] forKey:@"ID"];
	[dictionary setValue:self.ImageId forKey:@"ImageId"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsIACAD] forKey:@"IsIACAD"];
	[dictionary setValue:self.Latitude forKey:@"Latitude"];
	[dictionary setValue:self.Longitude forKey:@"Longitude"];
	[dictionary setValue:self.MerchantId forKey:@"MerchantId"];
	[dictionary setValue:self.Mobile forKey:@"Mobile"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:self.NameAr forKey:@"NameAr"];
	[dictionary setValue:self.NameEn forKey:@"NameEn"];
	[dictionary setValue:self.Phone forKey:@"Phone"];
	[dictionary setValue:self.ReportsLogo forKey:@"ReportsLogo"];
	[dictionary setValue:self.SecretKey forKey:@"SecretKey"];
	[dictionary setValue:[NSNumber numberWithBool: self.ShowOnHomepage] forKey:@"ShowOnHomepage"];
	[dictionary setValue:self.SiteName forKey:@"SiteName"];
	[dictionary setValue:self.StoreID forKey:@"StoreID"];
	[dictionary setValue:self.WebSite forKey:@"WebSite"];
	return dictionary;
}

@end
