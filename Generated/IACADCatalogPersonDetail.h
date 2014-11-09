


#import <Foundation/Foundation.h>



@interface IACADCatalogPersonDetail : NSObject {
}

@property (nonatomic) int AgeMonths;
@property (nonatomic) int AgeYears;
@property (nonatomic) BOOL AnotherScholarship;
@property (nonatomic, retain) NSString* AnotherScholarshipProviderName;
@property (nonatomic, retain) NSString* CaseSearch;
@property (nonatomic) int CharityId;
@property (nonatomic, retain) NSString* CharityName;
@property (nonatomic, retain) NSString* CityName;
@property (nonatomic, retain) NSString* CityNameAr;
@property (nonatomic, retain) NSString* CityNameEn;
@property (nonatomic) int CountryID;
@property (nonatomic, retain) NSString* CountryName;
@property (nonatomic, retain) NSString* CountryNameAr;
@property (nonatomic, retain) NSString* CountryNameEn;
@property (nonatomic, retain) NSDate* DateOfBirth;
@property (nonatomic, retain) NSString* DateOfBirthText;
@property (nonatomic) int DaughtersNumber;
@property (nonatomic) double DonationCost;
@property (nonatomic) int DonationTypeId;
@property (nonatomic, retain) NSString* DonationTypesName;
@property (nonatomic, retain) NSString* DonationTypesNameAr;
@property (nonatomic, retain) NSString* DonationTypesNameEn;
@property (nonatomic, retain) NSString* EducationCost;
@property (nonatomic) int FamilyMembers;
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
@property (nonatomic, retain) NSString* HealthText;
@property (nonatomic, retain) NSString* HealthTextAr;
@property (nonatomic, retain) NSString* HealthTextEn;
@property (nonatomic, retain) NSString* HousingStatusName;
@property (nonatomic, retain) NSString* HousingStatusNameAr;
@property (nonatomic, retain) NSString* HousingStatusNameEn;
@property (nonatomic) int64_t ID;
@property (nonatomic, retain) NSString* IncomeSource;
@property (nonatomic, retain) NSString* IncomeSourceAr;
@property (nonatomic, retain) NSString* IncomeSourceEn;
@property (nonatomic, retain) NSString* InstitutionAddressAr;
@property (nonatomic, retain) NSString* InstitutionAddressEn;
@property (nonatomic) BOOL IsLocked;
@property (nonatomic) double MonthlyIncome;
@property (nonatomic, retain) NSString* NationalityCountryName;
@property (nonatomic, retain) NSString* NationalityCountryNameAr;
@property (nonatomic, retain) NSString* NationalityCountryNameEn;
@property (nonatomic) int PersonsStatusID;
@property (nonatomic, retain) NSString* SearchKey;
@property (nonatomic) int SonsNumber;
@property (nonatomic, retain) NSString* StudentAddress;
@property (nonatomic, retain) NSString* StudentAddressAr;
@property (nonatomic, retain) NSString* StudentAddressEn;
@property (nonatomic, retain) NSString* StudentBusinessPhone;
@property (nonatomic, retain) NSString* StudentCertificateCertificateName;
@property (nonatomic, retain) NSString* StudentCertificateCertificateNameAr;
@property (nonatomic, retain) NSString* StudentCertificateCertificateNameEn;
@property (nonatomic, retain) NSDate* StudentCertificateDate;
@property (nonatomic, retain) NSString* StudentEmail;
@property (nonatomic, retain) NSString* StudentHomePhone;
@property (nonatomic, retain) NSString* StudentInstitutionName;
@property (nonatomic, retain) NSString* StudentInstitutionNameAr;
@property (nonatomic, retain) NSString* StudentInstitutionNameEn;
@property (nonatomic, retain) NSString* StudentMaritalStatus;
@property (nonatomic, retain) NSString* StudentMaritalStatusAr;
@property (nonatomic, retain) NSString* StudentMaritalStatusEn;
@property (nonatomic, retain) NSString* StudentMobilePhone;
@property (nonatomic, retain) NSString* StudentScholarshipGradeName;
@property (nonatomic, retain) NSString* StudentScholarshipGradeNameAr;
@property (nonatomic, retain) NSString* StudentScholarshipGradeNameEn;
@property (nonatomic, retain) NSString* StudentWork;
@property (nonatomic, retain) NSString* StudentWorkAr;
@property (nonatomic, retain) NSString* StudentWorkEn;
@property (nonatomic, retain) NSString* StudentWorkOwner;
@property (nonatomic, retain) NSString* StudentWorkOwnerAr;
@property (nonatomic, retain) NSString* StudentWorkOwnerEn;
@property (nonatomic, retain) NSString* StudentsSponsorshipTypeName;
@property (nonatomic, retain) NSString* StudentsSponsorshipTypeNameAr;
@property (nonatomic, retain) NSString* StudentsSponsorshipTypeNameEn;
@property (nonatomic, retain) NSString* StudyLevelText;
@property (nonatomic, retain) NSString* StudyLevelTextAr;
@property (nonatomic, retain) NSString* StudyLevelTextEn;
@property (nonatomic, retain) NSString* TeacherAddressAr;
@property (nonatomic, retain) NSString* TeacherAddressEn;
@property (nonatomic) int TeacherChildrenCount;
@property (nonatomic, retain) NSString* TeacherEducatinoPlace;
@property (nonatomic, retain) NSString* TeacherEducationType;
@property (nonatomic, retain) NSString* TeacherFileCV;
@property (nonatomic, retain) NSString* TeacherFileGraduationCertificate;
@property (nonatomic, retain) NSString* TeacherFileRecommendation;
@property (nonatomic, retain) NSString* TeacherMaritalStatusText;
@property (nonatomic, retain) NSString* TeacherMaritalStatusTextAr;
@property (nonatomic, retain) NSString* TeacherMaritalStatusTextEn;
@property (nonatomic, retain) NSString* UniversityName;
@property (nonatomic, retain) NSString* UniversityNameAr;
@property (nonatomic, retain) NSString* UniversityNameEn;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
