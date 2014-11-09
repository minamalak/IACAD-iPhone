


#import <Foundation/Foundation.h>



@interface IACADCatalogDonationItem : NSObject {
}

@property (nonatomic) int Area;
@property (nonatomic) int Capacity;
@property (nonatomic) int CategoryId;
@property (nonatomic, retain) NSString* CharityDescription;
@property (nonatomic) int CharityId;
@property (nonatomic, retain) NSString* CharityName;
@property (nonatomic, retain) NSString* CharityNameAr;
@property (nonatomic, retain) NSString* CharityNameEn;
@property (nonatomic) double Cost;
@property (nonatomic) int CountryID;
@property (nonatomic, retain) NSString* CountryName;
@property (nonatomic, retain) NSString* CountryNameAr;
@property (nonatomic, retain) NSString* CountryNameEn;
@property (nonatomic, retain) NSString* Description;
@property (nonatomic, retain) NSString* DescriptionAr;
@property (nonatomic, retain) NSString* DescriptionEn;
@property (nonatomic) int DonationItemId;
@property (nonatomic) int DonationItemsWaterTypeId;
@property (nonatomic) int DonationTypeId;
@property (nonatomic, retain) NSString* DonationTypeName;
@property (nonatomic, retain) NSString* DonationTypeNameAr;
@property (nonatomic, retain) NSString* DonationTypeNameEn;
@property (nonatomic) BOOL DonationTypesCharityShowInCatalog;
@property (nonatomic, retain) NSString* DontationItemsWaterTypeName;
@property (nonatomic, retain) NSString* DontationItemsWaterTypeNameAr;
@property (nonatomic, retain) NSString* DontationItemsWaterTypeNameEn;
@property (nonatomic) BOOL ExternalEntityDonationItemShowInCatalog;
@property (nonatomic) int ExternalEntityDonationItemsAssociationPerCharityId;
@property (nonatomic, retain) NSString* ExternalEntityName;
@property (nonatomic, retain) NSString* FormattedCost;
@property (nonatomic, retain) NSString* ImageId;
@property (nonatomic) int InitialDuration;
@property (nonatomic) BOOL IsActive;
@property (nonatomic) BOOL IsContribution;
@property (nonatomic) BOOL IsQuantitative;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* NameAr;
@property (nonatomic, retain) NSString* NameEn;
@property (nonatomic) int64_t RemainingStock;
@property (nonatomic) BOOL ShowInCatalog;
@property (nonatomic) double StockPrice;
@property (nonatomic) int TotalStock;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
