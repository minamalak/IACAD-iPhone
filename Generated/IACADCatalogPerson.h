


#import <Foundation/Foundation.h>



@interface IACADCatalogPerson : NSObject {
}

@property (nonatomic) int CharityId;
@property (nonatomic) int CountryID;
@property (nonatomic, retain) NSString* CountryNameAr;
@property (nonatomic, retain) NSString* CountryNameEn;
@property (nonatomic, retain) NSDate* DateOfBirth;
@property (nonatomic, retain) NSString* DateOfBirthText;
@property (nonatomic) double DonationCost;
@property (nonatomic) int DonationTypeId;
@property (nonatomic, retain) NSString* FamilyNameAr;
@property (nonatomic, retain) NSString* FamilyNameEn;
@property (nonatomic, retain) NSString* FatherNameAr;
@property (nonatomic, retain) NSString* FatherNameEn;
@property (nonatomic, retain) NSString* FirstNameAr;
@property (nonatomic, retain) NSString* FirstNameEn;
@property (nonatomic, retain) NSString* FormattedDonationCost;
@property (nonatomic, retain) NSString* FullName;
@property (nonatomic, retain) NSString* FullNameAr;
@property (nonatomic, retain) NSString* FullNameEn;
@property (nonatomic) BOOL Gender;
@property (nonatomic, retain) NSString* GenderText;
@property (nonatomic, retain) NSString* GenrealPersonsPhotoFileID;
@property (nonatomic, retain) NSString* GrandNameAr;
@property (nonatomic, retain) NSString* GrandNameEn;
@property (nonatomic) int64_t ID;
@property (nonatomic) BOOL IsLocked;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
