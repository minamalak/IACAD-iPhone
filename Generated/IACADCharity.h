


#import <Foundation/Foundation.h>



@interface IACADCharity : NSObject {
}

@property (nonatomic, retain) NSString* ADReference;
@property (nonatomic, retain) NSString* AXID;
@property (nonatomic, retain) NSString* AccessKey;
@property (nonatomic, retain) NSString* Address;
@property (nonatomic, retain) NSString* AddressAr;
@property (nonatomic, retain) NSString* AddressEn;
@property (nonatomic, retain) NSString* AnonymousDonationAXID;
@property (nonatomic, retain) NSString* CharityCode;
@property (nonatomic, retain) NSString* City;
@property (nonatomic) int CityID;
@property (nonatomic, retain) NSString* ContributionTypeImage;
@property (nonatomic, retain) NSString* DepartmentsCombined;
@property (nonatomic, retain) NSString* Description;
@property (nonatomic, retain) NSString* DescriptionAr;
@property (nonatomic, retain) NSString* DescriptionEn;
@property (nonatomic, retain) NSString* Email;
@property (nonatomic, retain) NSString* Fax;
@property (nonatomic, retain) NSString* GeographicLocation;
@property (nonatomic) BOOL HideCaseProfile;
@property (nonatomic) int ID;
@property (nonatomic, retain) NSString* ImageId;
@property (nonatomic) BOOL IsIACAD;
@property (nonatomic, retain) NSString* Latitude;
@property (nonatomic, retain) NSString* Longitude;
@property (nonatomic, retain) NSString* MerchantId;
@property (nonatomic, retain) NSString* Mobile;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* NameAr;
@property (nonatomic, retain) NSString* NameEn;
@property (nonatomic, retain) NSString* Phone;
@property (nonatomic, retain) NSString* ReportsLogo;
@property (nonatomic, retain) NSString* SecretKey;
@property (nonatomic) BOOL ShowOnHomepage;
@property (nonatomic, retain) NSString* SiteName;
@property (nonatomic, retain) NSString* StoreID;
@property (nonatomic, retain) NSString* WebSite;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
