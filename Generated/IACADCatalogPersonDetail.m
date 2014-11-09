


#import <Foundation/Foundation.h>
#import "IACADCatalogPersonDetail.h"
#import "WebServiceEntities.h"

@implementation IACADCatalogPersonDetail
@synthesize AgeMonths;
@synthesize AgeYears;
@synthesize AnotherScholarship;
@synthesize AnotherScholarshipProviderName;
@synthesize CaseSearch;
@synthesize CharityId;
@synthesize CharityName;
@synthesize CityName;
@synthesize CityNameAr;
@synthesize CityNameEn;
@synthesize CountryID;
@synthesize CountryName;
@synthesize CountryNameAr;
@synthesize CountryNameEn;
@synthesize DateOfBirth;
@synthesize DateOfBirthText;
@synthesize DaughtersNumber;
@synthesize DonationCost;
@synthesize DonationTypeId;
@synthesize DonationTypesName;
@synthesize DonationTypesNameAr;
@synthesize DonationTypesNameEn;
@synthesize EducationCost;
@synthesize FamilyMembers;
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
@synthesize HealthText;
@synthesize HealthTextAr;
@synthesize HealthTextEn;
@synthesize HousingStatusName;
@synthesize HousingStatusNameAr;
@synthesize HousingStatusNameEn;
@synthesize ID;
@synthesize IncomeSource;
@synthesize IncomeSourceAr;
@synthesize IncomeSourceEn;
@synthesize InstitutionAddressAr;
@synthesize InstitutionAddressEn;
@synthesize IsLocked;
@synthesize MonthlyIncome;
@synthesize NationalityCountryName;
@synthesize NationalityCountryNameAr;
@synthesize NationalityCountryNameEn;
@synthesize PersonsStatusID;
@synthesize SearchKey;
@synthesize SonsNumber;
@synthesize StudentAddress;
@synthesize StudentAddressAr;
@synthesize StudentAddressEn;
@synthesize StudentBusinessPhone;
@synthesize StudentCertificateCertificateName;
@synthesize StudentCertificateCertificateNameAr;
@synthesize StudentCertificateCertificateNameEn;
@synthesize StudentCertificateDate;
@synthesize StudentEmail;
@synthesize StudentHomePhone;
@synthesize StudentInstitutionName;
@synthesize StudentInstitutionNameAr;
@synthesize StudentInstitutionNameEn;
@synthesize StudentMaritalStatus;
@synthesize StudentMaritalStatusAr;
@synthesize StudentMaritalStatusEn;
@synthesize StudentMobilePhone;
@synthesize StudentScholarshipGradeName;
@synthesize StudentScholarshipGradeNameAr;
@synthesize StudentScholarshipGradeNameEn;
@synthesize StudentWork;
@synthesize StudentWorkAr;
@synthesize StudentWorkEn;
@synthesize StudentWorkOwner;
@synthesize StudentWorkOwnerAr;
@synthesize StudentWorkOwnerEn;
@synthesize StudentsSponsorshipTypeName;
@synthesize StudentsSponsorshipTypeNameAr;
@synthesize StudentsSponsorshipTypeNameEn;
@synthesize StudyLevelText;
@synthesize StudyLevelTextAr;
@synthesize StudyLevelTextEn;
@synthesize TeacherAddressAr;
@synthesize TeacherAddressEn;
@synthesize TeacherChildrenCount;
@synthesize TeacherEducatinoPlace;
@synthesize TeacherEducationType;
@synthesize TeacherFileCV;
@synthesize TeacherFileGraduationCertificate;
@synthesize TeacherFileRecommendation;
@synthesize TeacherMaritalStatusText;
@synthesize TeacherMaritalStatusTextAr;
@synthesize TeacherMaritalStatusTextEn;
@synthesize UniversityName;
@synthesize UniversityNameAr;
@synthesize UniversityNameEn;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *AgeMonthsRef = [dictionary objectForKey:@"AgeMonths"];
		if([AgeMonthsRef isKindOfClass:[NSNull class]]) {
			self.AgeMonths = 0;
		}
		else {
			self.AgeMonths = [[dictionary objectForKey: @"AgeMonths"] intValue];
		}
						
		NSObject *AgeYearsRef = [dictionary objectForKey:@"AgeYears"];
		if([AgeYearsRef isKindOfClass:[NSNull class]]) {
			self.AgeYears = 0;
		}
		else {
			self.AgeYears = [[dictionary objectForKey: @"AgeYears"] intValue];
		}
						
		NSObject *AnotherScholarshipRef = [dictionary objectForKey:@"AnotherScholarship"];
		if([AnotherScholarshipRef isKindOfClass:[NSNull class]]) {
			self.AnotherScholarship = nil;
		}
		else {
			self.AnotherScholarship = [[dictionary objectForKey: @"AnotherScholarship"] boolValue];
		}
						
		NSObject *AnotherScholarshipProviderNameRef = [dictionary objectForKey:@"AnotherScholarshipProviderName"];
		if([AnotherScholarshipProviderNameRef isKindOfClass:[NSNull class]]) {
			self.AnotherScholarshipProviderName = nil;
		}
		else {
			self.AnotherScholarshipProviderName = [[dictionary objectForKey: @"AnotherScholarshipProviderName"] copy];
		}
						
		NSObject *CaseSearchRef = [dictionary objectForKey:@"CaseSearch"];
		if([CaseSearchRef isKindOfClass:[NSNull class]]) {
			self.CaseSearch = nil;
		}
		else {
			self.CaseSearch = [[dictionary objectForKey: @"CaseSearch"] copy];
		}
		self.CharityId = [[dictionary objectForKey: @"CharityId"] intValue];
						
		NSObject *CharityNameRef = [dictionary objectForKey:@"CharityName"];
		if([CharityNameRef isKindOfClass:[NSNull class]]) {
			self.CharityName = nil;
		}
		else {
			self.CharityName = [[dictionary objectForKey: @"CharityName"] copy];
		}
						
		NSObject *CityNameRef = [dictionary objectForKey:@"CityName"];
		if([CityNameRef isKindOfClass:[NSNull class]]) {
			self.CityName = nil;
		}
		else {
			self.CityName = [[dictionary objectForKey: @"CityName"] copy];
		}
						
		NSObject *CityNameArRef = [dictionary objectForKey:@"CityNameAr"];
		if([CityNameArRef isKindOfClass:[NSNull class]]) {
			self.CityNameAr = nil;
		}
		else {
			self.CityNameAr = [[dictionary objectForKey: @"CityNameAr"] copy];
		}
						
		NSObject *CityNameEnRef = [dictionary objectForKey:@"CityNameEn"];
		if([CityNameEnRef isKindOfClass:[NSNull class]]) {
			self.CityNameEn = nil;
		}
		else {
			self.CityNameEn = [[dictionary objectForKey: @"CityNameEn"] copy];
		}
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
		self.DateOfBirth = [WebServiceEntities deserializeJsonDateString:[dictionary objectForKey: @"DateOfBirth"]];
						
		NSObject *DateOfBirthTextRef = [dictionary objectForKey:@"DateOfBirthText"];
		if([DateOfBirthTextRef isKindOfClass:[NSNull class]]) {
			self.DateOfBirthText = nil;
		}
		else {
			self.DateOfBirthText = [[dictionary objectForKey: @"DateOfBirthText"] copy];
		}
						
		NSObject *DaughtersNumberRef = [dictionary objectForKey:@"DaughtersNumber"];
		if([DaughtersNumberRef isKindOfClass:[NSNull class]]) {
			self.DaughtersNumber = 0;
		}
		else {
			self.DaughtersNumber = [[dictionary objectForKey: @"DaughtersNumber"] intValue];
		}
						
		NSObject *DonationCostRef = [dictionary objectForKey:@"DonationCost"];
		if([DonationCostRef isKindOfClass:[NSNull class]]) {
			self.DonationCost = 0;
		}
		else {
			self.DonationCost = [[dictionary objectForKey: @"DonationCost"] doubleValue];
		}
		self.DonationTypeId = [[dictionary objectForKey: @"DonationTypeId"] intValue];
						
		NSObject *DonationTypesNameRef = [dictionary objectForKey:@"DonationTypesName"];
		if([DonationTypesNameRef isKindOfClass:[NSNull class]]) {
			self.DonationTypesName = nil;
		}
		else {
			self.DonationTypesName = [[dictionary objectForKey: @"DonationTypesName"] copy];
		}
						
		NSObject *DonationTypesNameArRef = [dictionary objectForKey:@"DonationTypesNameAr"];
		if([DonationTypesNameArRef isKindOfClass:[NSNull class]]) {
			self.DonationTypesNameAr = nil;
		}
		else {
			self.DonationTypesNameAr = [[dictionary objectForKey: @"DonationTypesNameAr"] copy];
		}
						
		NSObject *DonationTypesNameEnRef = [dictionary objectForKey:@"DonationTypesNameEn"];
		if([DonationTypesNameEnRef isKindOfClass:[NSNull class]]) {
			self.DonationTypesNameEn = nil;
		}
		else {
			self.DonationTypesNameEn = [[dictionary objectForKey: @"DonationTypesNameEn"] copy];
		}
						
		NSObject *EducationCostRef = [dictionary objectForKey:@"EducationCost"];
		if([EducationCostRef isKindOfClass:[NSNull class]]) {
			self.EducationCost = nil;
		}
		else {
			self.EducationCost = [[dictionary objectForKey: @"EducationCost"] copy];
		}
						
		NSObject *FamilyMembersRef = [dictionary objectForKey:@"FamilyMembers"];
		if([FamilyMembersRef isKindOfClass:[NSNull class]]) {
			self.FamilyMembers = 0;
		}
		else {
			self.FamilyMembers = [[dictionary objectForKey: @"FamilyMembers"] intValue];
		}
						
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
						
		NSObject *HealthTextRef = [dictionary objectForKey:@"HealthText"];
		if([HealthTextRef isKindOfClass:[NSNull class]]) {
			self.HealthText = nil;
		}
		else {
			self.HealthText = [[dictionary objectForKey: @"HealthText"] copy];
		}
						
		NSObject *HealthTextArRef = [dictionary objectForKey:@"HealthTextAr"];
		if([HealthTextArRef isKindOfClass:[NSNull class]]) {
			self.HealthTextAr = nil;
		}
		else {
			self.HealthTextAr = [[dictionary objectForKey: @"HealthTextAr"] copy];
		}
						
		NSObject *HealthTextEnRef = [dictionary objectForKey:@"HealthTextEn"];
		if([HealthTextEnRef isKindOfClass:[NSNull class]]) {
			self.HealthTextEn = nil;
		}
		else {
			self.HealthTextEn = [[dictionary objectForKey: @"HealthTextEn"] copy];
		}
						
		NSObject *HousingStatusNameRef = [dictionary objectForKey:@"HousingStatusName"];
		if([HousingStatusNameRef isKindOfClass:[NSNull class]]) {
			self.HousingStatusName = nil;
		}
		else {
			self.HousingStatusName = [[dictionary objectForKey: @"HousingStatusName"] copy];
		}
						
		NSObject *HousingStatusNameArRef = [dictionary objectForKey:@"HousingStatusNameAr"];
		if([HousingStatusNameArRef isKindOfClass:[NSNull class]]) {
			self.HousingStatusNameAr = nil;
		}
		else {
			self.HousingStatusNameAr = [[dictionary objectForKey: @"HousingStatusNameAr"] copy];
		}
						
		NSObject *HousingStatusNameEnRef = [dictionary objectForKey:@"HousingStatusNameEn"];
		if([HousingStatusNameEnRef isKindOfClass:[NSNull class]]) {
			self.HousingStatusNameEn = nil;
		}
		else {
			self.HousingStatusNameEn = [[dictionary objectForKey: @"HousingStatusNameEn"] copy];
		}
		self.ID = [[dictionary objectForKey: @"ID"] longValue];
						
		NSObject *IncomeSourceRef = [dictionary objectForKey:@"IncomeSource"];
		if([IncomeSourceRef isKindOfClass:[NSNull class]]) {
			self.IncomeSource = nil;
		}
		else {
			self.IncomeSource = [[dictionary objectForKey: @"IncomeSource"] copy];
		}
						
		NSObject *IncomeSourceArRef = [dictionary objectForKey:@"IncomeSourceAr"];
		if([IncomeSourceArRef isKindOfClass:[NSNull class]]) {
			self.IncomeSourceAr = nil;
		}
		else {
			self.IncomeSourceAr = [[dictionary objectForKey: @"IncomeSourceAr"] copy];
		}
						
		NSObject *IncomeSourceEnRef = [dictionary objectForKey:@"IncomeSourceEn"];
		if([IncomeSourceEnRef isKindOfClass:[NSNull class]]) {
			self.IncomeSourceEn = nil;
		}
		else {
			self.IncomeSourceEn = [[dictionary objectForKey: @"IncomeSourceEn"] copy];
		}
						
		NSObject *InstitutionAddressArRef = [dictionary objectForKey:@"InstitutionAddressAr"];
		if([InstitutionAddressArRef isKindOfClass:[NSNull class]]) {
			self.InstitutionAddressAr = nil;
		}
		else {
			self.InstitutionAddressAr = [[dictionary objectForKey: @"InstitutionAddressAr"] copy];
		}
						
		NSObject *InstitutionAddressEnRef = [dictionary objectForKey:@"InstitutionAddressEn"];
		if([InstitutionAddressEnRef isKindOfClass:[NSNull class]]) {
			self.InstitutionAddressEn = nil;
		}
		else {
			self.InstitutionAddressEn = [[dictionary objectForKey: @"InstitutionAddressEn"] copy];
		}
						
		NSObject *IsLockedRef = [dictionary objectForKey:@"IsLocked"];
		if([IsLockedRef isKindOfClass:[NSNull class]]) {
			self.IsLocked = nil;
		}
		else {
			self.IsLocked = [[dictionary objectForKey: @"IsLocked"] boolValue];
		}
						
		NSObject *MonthlyIncomeRef = [dictionary objectForKey:@"MonthlyIncome"];
		if([MonthlyIncomeRef isKindOfClass:[NSNull class]]) {
			self.MonthlyIncome = 0;
		}
		else {
			self.MonthlyIncome = [[dictionary objectForKey: @"MonthlyIncome"] doubleValue];
		}
						
		NSObject *NationalityCountryNameRef = [dictionary objectForKey:@"NationalityCountryName"];
		if([NationalityCountryNameRef isKindOfClass:[NSNull class]]) {
			self.NationalityCountryName = nil;
		}
		else {
			self.NationalityCountryName = [[dictionary objectForKey: @"NationalityCountryName"] copy];
		}
						
		NSObject *NationalityCountryNameArRef = [dictionary objectForKey:@"NationalityCountryNameAr"];
		if([NationalityCountryNameArRef isKindOfClass:[NSNull class]]) {
			self.NationalityCountryNameAr = nil;
		}
		else {
			self.NationalityCountryNameAr = [[dictionary objectForKey: @"NationalityCountryNameAr"] copy];
		}
						
		NSObject *NationalityCountryNameEnRef = [dictionary objectForKey:@"NationalityCountryNameEn"];
		if([NationalityCountryNameEnRef isKindOfClass:[NSNull class]]) {
			self.NationalityCountryNameEn = nil;
		}
		else {
			self.NationalityCountryNameEn = [[dictionary objectForKey: @"NationalityCountryNameEn"] copy];
		}
		self.PersonsStatusID = [[dictionary objectForKey: @"PersonsStatusID"] intValue];
						
		NSObject *SearchKeyRef = [dictionary objectForKey:@"SearchKey"];
		if([SearchKeyRef isKindOfClass:[NSNull class]]) {
			self.SearchKey = nil;
		}
		else {
			self.SearchKey = [[dictionary objectForKey: @"SearchKey"] copy];
		}
						
		NSObject *SonsNumberRef = [dictionary objectForKey:@"SonsNumber"];
		if([SonsNumberRef isKindOfClass:[NSNull class]]) {
			self.SonsNumber = 0;
		}
		else {
			self.SonsNumber = [[dictionary objectForKey: @"SonsNumber"] intValue];
		}
						
		NSObject *StudentAddressRef = [dictionary objectForKey:@"StudentAddress"];
		if([StudentAddressRef isKindOfClass:[NSNull class]]) {
			self.StudentAddress = nil;
		}
		else {
			self.StudentAddress = [[dictionary objectForKey: @"StudentAddress"] copy];
		}
						
		NSObject *StudentAddressArRef = [dictionary objectForKey:@"StudentAddressAr"];
		if([StudentAddressArRef isKindOfClass:[NSNull class]]) {
			self.StudentAddressAr = nil;
		}
		else {
			self.StudentAddressAr = [[dictionary objectForKey: @"StudentAddressAr"] copy];
		}
						
		NSObject *StudentAddressEnRef = [dictionary objectForKey:@"StudentAddressEn"];
		if([StudentAddressEnRef isKindOfClass:[NSNull class]]) {
			self.StudentAddressEn = nil;
		}
		else {
			self.StudentAddressEn = [[dictionary objectForKey: @"StudentAddressEn"] copy];
		}
						
		NSObject *StudentBusinessPhoneRef = [dictionary objectForKey:@"StudentBusinessPhone"];
		if([StudentBusinessPhoneRef isKindOfClass:[NSNull class]]) {
			self.StudentBusinessPhone = nil;
		}
		else {
			self.StudentBusinessPhone = [[dictionary objectForKey: @"StudentBusinessPhone"] copy];
		}
						
		NSObject *StudentCertificateCertificateNameRef = [dictionary objectForKey:@"StudentCertificateCertificateName"];
		if([StudentCertificateCertificateNameRef isKindOfClass:[NSNull class]]) {
			self.StudentCertificateCertificateName = nil;
		}
		else {
			self.StudentCertificateCertificateName = [[dictionary objectForKey: @"StudentCertificateCertificateName"] copy];
		}
						
		NSObject *StudentCertificateCertificateNameArRef = [dictionary objectForKey:@"StudentCertificateCertificateNameAr"];
		if([StudentCertificateCertificateNameArRef isKindOfClass:[NSNull class]]) {
			self.StudentCertificateCertificateNameAr = nil;
		}
		else {
			self.StudentCertificateCertificateNameAr = [[dictionary objectForKey: @"StudentCertificateCertificateNameAr"] copy];
		}
						
		NSObject *StudentCertificateCertificateNameEnRef = [dictionary objectForKey:@"StudentCertificateCertificateNameEn"];
		if([StudentCertificateCertificateNameEnRef isKindOfClass:[NSNull class]]) {
			self.StudentCertificateCertificateNameEn = nil;
		}
		else {
			self.StudentCertificateCertificateNameEn = [[dictionary objectForKey: @"StudentCertificateCertificateNameEn"] copy];
		}
						
		NSObject *StudentCertificateDateRef = [dictionary objectForKey:@"StudentCertificateDate"];
		if([StudentCertificateDateRef isKindOfClass:[NSNull class]]) {
			self.StudentCertificateDate = nil;
		}
		else {
			self.StudentCertificateDate = [WebServiceEntities deserializeJsonDateString:[dictionary objectForKey: @"StudentCertificateDate"]];
		}
						
		NSObject *StudentEmailRef = [dictionary objectForKey:@"StudentEmail"];
		if([StudentEmailRef isKindOfClass:[NSNull class]]) {
			self.StudentEmail = nil;
		}
		else {
			self.StudentEmail = [[dictionary objectForKey: @"StudentEmail"] copy];
		}
						
		NSObject *StudentHomePhoneRef = [dictionary objectForKey:@"StudentHomePhone"];
		if([StudentHomePhoneRef isKindOfClass:[NSNull class]]) {
			self.StudentHomePhone = nil;
		}
		else {
			self.StudentHomePhone = [[dictionary objectForKey: @"StudentHomePhone"] copy];
		}
						
		NSObject *StudentInstitutionNameRef = [dictionary objectForKey:@"StudentInstitutionName"];
		if([StudentInstitutionNameRef isKindOfClass:[NSNull class]]) {
			self.StudentInstitutionName = nil;
		}
		else {
			self.StudentInstitutionName = [[dictionary objectForKey: @"StudentInstitutionName"] copy];
		}
						
		NSObject *StudentInstitutionNameArRef = [dictionary objectForKey:@"StudentInstitutionNameAr"];
		if([StudentInstitutionNameArRef isKindOfClass:[NSNull class]]) {
			self.StudentInstitutionNameAr = nil;
		}
		else {
			self.StudentInstitutionNameAr = [[dictionary objectForKey: @"StudentInstitutionNameAr"] copy];
		}
						
		NSObject *StudentInstitutionNameEnRef = [dictionary objectForKey:@"StudentInstitutionNameEn"];
		if([StudentInstitutionNameEnRef isKindOfClass:[NSNull class]]) {
			self.StudentInstitutionNameEn = nil;
		}
		else {
			self.StudentInstitutionNameEn = [[dictionary objectForKey: @"StudentInstitutionNameEn"] copy];
		}
						
		NSObject *StudentMaritalStatusRef = [dictionary objectForKey:@"StudentMaritalStatus"];
		if([StudentMaritalStatusRef isKindOfClass:[NSNull class]]) {
			self.StudentMaritalStatus = nil;
		}
		else {
			self.StudentMaritalStatus = [[dictionary objectForKey: @"StudentMaritalStatus"] copy];
		}
						
		NSObject *StudentMaritalStatusArRef = [dictionary objectForKey:@"StudentMaritalStatusAr"];
		if([StudentMaritalStatusArRef isKindOfClass:[NSNull class]]) {
			self.StudentMaritalStatusAr = nil;
		}
		else {
			self.StudentMaritalStatusAr = [[dictionary objectForKey: @"StudentMaritalStatusAr"] copy];
		}
						
		NSObject *StudentMaritalStatusEnRef = [dictionary objectForKey:@"StudentMaritalStatusEn"];
		if([StudentMaritalStatusEnRef isKindOfClass:[NSNull class]]) {
			self.StudentMaritalStatusEn = nil;
		}
		else {
			self.StudentMaritalStatusEn = [[dictionary objectForKey: @"StudentMaritalStatusEn"] copy];
		}
						
		NSObject *StudentMobilePhoneRef = [dictionary objectForKey:@"StudentMobilePhone"];
		if([StudentMobilePhoneRef isKindOfClass:[NSNull class]]) {
			self.StudentMobilePhone = nil;
		}
		else {
			self.StudentMobilePhone = [[dictionary objectForKey: @"StudentMobilePhone"] copy];
		}
						
		NSObject *StudentScholarshipGradeNameRef = [dictionary objectForKey:@"StudentScholarshipGradeName"];
		if([StudentScholarshipGradeNameRef isKindOfClass:[NSNull class]]) {
			self.StudentScholarshipGradeName = nil;
		}
		else {
			self.StudentScholarshipGradeName = [[dictionary objectForKey: @"StudentScholarshipGradeName"] copy];
		}
						
		NSObject *StudentScholarshipGradeNameArRef = [dictionary objectForKey:@"StudentScholarshipGradeNameAr"];
		if([StudentScholarshipGradeNameArRef isKindOfClass:[NSNull class]]) {
			self.StudentScholarshipGradeNameAr = nil;
		}
		else {
			self.StudentScholarshipGradeNameAr = [[dictionary objectForKey: @"StudentScholarshipGradeNameAr"] copy];
		}
						
		NSObject *StudentScholarshipGradeNameEnRef = [dictionary objectForKey:@"StudentScholarshipGradeNameEn"];
		if([StudentScholarshipGradeNameEnRef isKindOfClass:[NSNull class]]) {
			self.StudentScholarshipGradeNameEn = nil;
		}
		else {
			self.StudentScholarshipGradeNameEn = [[dictionary objectForKey: @"StudentScholarshipGradeNameEn"] copy];
		}
						
		NSObject *StudentWorkRef = [dictionary objectForKey:@"StudentWork"];
		if([StudentWorkRef isKindOfClass:[NSNull class]]) {
			self.StudentWork = nil;
		}
		else {
			self.StudentWork = [[dictionary objectForKey: @"StudentWork"] copy];
		}
						
		NSObject *StudentWorkArRef = [dictionary objectForKey:@"StudentWorkAr"];
		if([StudentWorkArRef isKindOfClass:[NSNull class]]) {
			self.StudentWorkAr = nil;
		}
		else {
			self.StudentWorkAr = [[dictionary objectForKey: @"StudentWorkAr"] copy];
		}
						
		NSObject *StudentWorkEnRef = [dictionary objectForKey:@"StudentWorkEn"];
		if([StudentWorkEnRef isKindOfClass:[NSNull class]]) {
			self.StudentWorkEn = nil;
		}
		else {
			self.StudentWorkEn = [[dictionary objectForKey: @"StudentWorkEn"] copy];
		}
						
		NSObject *StudentWorkOwnerRef = [dictionary objectForKey:@"StudentWorkOwner"];
		if([StudentWorkOwnerRef isKindOfClass:[NSNull class]]) {
			self.StudentWorkOwner = nil;
		}
		else {
			self.StudentWorkOwner = [[dictionary objectForKey: @"StudentWorkOwner"] copy];
		}
						
		NSObject *StudentWorkOwnerArRef = [dictionary objectForKey:@"StudentWorkOwnerAr"];
		if([StudentWorkOwnerArRef isKindOfClass:[NSNull class]]) {
			self.StudentWorkOwnerAr = nil;
		}
		else {
			self.StudentWorkOwnerAr = [[dictionary objectForKey: @"StudentWorkOwnerAr"] copy];
		}
						
		NSObject *StudentWorkOwnerEnRef = [dictionary objectForKey:@"StudentWorkOwnerEn"];
		if([StudentWorkOwnerEnRef isKindOfClass:[NSNull class]]) {
			self.StudentWorkOwnerEn = nil;
		}
		else {
			self.StudentWorkOwnerEn = [[dictionary objectForKey: @"StudentWorkOwnerEn"] copy];
		}
						
		NSObject *StudentsSponsorshipTypeNameRef = [dictionary objectForKey:@"StudentsSponsorshipTypeName"];
		if([StudentsSponsorshipTypeNameRef isKindOfClass:[NSNull class]]) {
			self.StudentsSponsorshipTypeName = nil;
		}
		else {
			self.StudentsSponsorshipTypeName = [[dictionary objectForKey: @"StudentsSponsorshipTypeName"] copy];
		}
						
		NSObject *StudentsSponsorshipTypeNameArRef = [dictionary objectForKey:@"StudentsSponsorshipTypeNameAr"];
		if([StudentsSponsorshipTypeNameArRef isKindOfClass:[NSNull class]]) {
			self.StudentsSponsorshipTypeNameAr = nil;
		}
		else {
			self.StudentsSponsorshipTypeNameAr = [[dictionary objectForKey: @"StudentsSponsorshipTypeNameAr"] copy];
		}
						
		NSObject *StudentsSponsorshipTypeNameEnRef = [dictionary objectForKey:@"StudentsSponsorshipTypeNameEn"];
		if([StudentsSponsorshipTypeNameEnRef isKindOfClass:[NSNull class]]) {
			self.StudentsSponsorshipTypeNameEn = nil;
		}
		else {
			self.StudentsSponsorshipTypeNameEn = [[dictionary objectForKey: @"StudentsSponsorshipTypeNameEn"] copy];
		}
						
		NSObject *StudyLevelTextRef = [dictionary objectForKey:@"StudyLevelText"];
		if([StudyLevelTextRef isKindOfClass:[NSNull class]]) {
			self.StudyLevelText = nil;
		}
		else {
			self.StudyLevelText = [[dictionary objectForKey: @"StudyLevelText"] copy];
		}
						
		NSObject *StudyLevelTextArRef = [dictionary objectForKey:@"StudyLevelTextAr"];
		if([StudyLevelTextArRef isKindOfClass:[NSNull class]]) {
			self.StudyLevelTextAr = nil;
		}
		else {
			self.StudyLevelTextAr = [[dictionary objectForKey: @"StudyLevelTextAr"] copy];
		}
						
		NSObject *StudyLevelTextEnRef = [dictionary objectForKey:@"StudyLevelTextEn"];
		if([StudyLevelTextEnRef isKindOfClass:[NSNull class]]) {
			self.StudyLevelTextEn = nil;
		}
		else {
			self.StudyLevelTextEn = [[dictionary objectForKey: @"StudyLevelTextEn"] copy];
		}
						
		NSObject *TeacherAddressArRef = [dictionary objectForKey:@"TeacherAddressAr"];
		if([TeacherAddressArRef isKindOfClass:[NSNull class]]) {
			self.TeacherAddressAr = nil;
		}
		else {
			self.TeacherAddressAr = [[dictionary objectForKey: @"TeacherAddressAr"] copy];
		}
						
		NSObject *TeacherAddressEnRef = [dictionary objectForKey:@"TeacherAddressEn"];
		if([TeacherAddressEnRef isKindOfClass:[NSNull class]]) {
			self.TeacherAddressEn = nil;
		}
		else {
			self.TeacherAddressEn = [[dictionary objectForKey: @"TeacherAddressEn"] copy];
		}
						
		NSObject *TeacherChildrenCountRef = [dictionary objectForKey:@"TeacherChildrenCount"];
		if([TeacherChildrenCountRef isKindOfClass:[NSNull class]]) {
			self.TeacherChildrenCount = nil;
		}
		else {
			self.TeacherChildrenCount = [[dictionary objectForKey: @"TeacherChildrenCount"] intValue];
		}
						
		NSObject *TeacherEducatinoPlaceRef = [dictionary objectForKey:@"TeacherEducatinoPlace"];
		if([TeacherEducatinoPlaceRef isKindOfClass:[NSNull class]]) {
			self.TeacherEducatinoPlace = nil;
		}
		else {
			self.TeacherEducatinoPlace = [[dictionary objectForKey: @"TeacherEducatinoPlace"] copy];
		}
						
		NSObject *TeacherEducationTypeRef = [dictionary objectForKey:@"TeacherEducationType"];
		if([TeacherEducationTypeRef isKindOfClass:[NSNull class]]) {
			self.TeacherEducationType = nil;
		}
		else {
			self.TeacherEducationType = [[dictionary objectForKey: @"TeacherEducationType"] copy];
		}
						
		NSObject *TeacherFileCVRef = [dictionary objectForKey:@"TeacherFileCV"];
		if([TeacherFileCVRef isKindOfClass:[NSNull class]]) {
			self.TeacherFileCV = nil;
		}
		else {
			self.TeacherFileCV = [dictionary objectForKey: @"TeacherFileCV"];
		}
						
		NSObject *TeacherFileGraduationCertificateRef = [dictionary objectForKey:@"TeacherFileGraduationCertificate"];
		if([TeacherFileGraduationCertificateRef isKindOfClass:[NSNull class]]) {
			self.TeacherFileGraduationCertificate = nil;
		}
		else {
			self.TeacherFileGraduationCertificate = [dictionary objectForKey: @"TeacherFileGraduationCertificate"];
		}
						
		NSObject *TeacherFileRecommendationRef = [dictionary objectForKey:@"TeacherFileRecommendation"];
		if([TeacherFileRecommendationRef isKindOfClass:[NSNull class]]) {
			self.TeacherFileRecommendation = nil;
		}
		else {
			self.TeacherFileRecommendation = [dictionary objectForKey: @"TeacherFileRecommendation"];
		}
						
		NSObject *TeacherMaritalStatusTextRef = [dictionary objectForKey:@"TeacherMaritalStatusText"];
		if([TeacherMaritalStatusTextRef isKindOfClass:[NSNull class]]) {
			self.TeacherMaritalStatusText = nil;
		}
		else {
			self.TeacherMaritalStatusText = [[dictionary objectForKey: @"TeacherMaritalStatusText"] copy];
		}
						
		NSObject *TeacherMaritalStatusTextArRef = [dictionary objectForKey:@"TeacherMaritalStatusTextAr"];
		if([TeacherMaritalStatusTextArRef isKindOfClass:[NSNull class]]) {
			self.TeacherMaritalStatusTextAr = nil;
		}
		else {
			self.TeacherMaritalStatusTextAr = [[dictionary objectForKey: @"TeacherMaritalStatusTextAr"] copy];
		}
						
		NSObject *TeacherMaritalStatusTextEnRef = [dictionary objectForKey:@"TeacherMaritalStatusTextEn"];
		if([TeacherMaritalStatusTextEnRef isKindOfClass:[NSNull class]]) {
			self.TeacherMaritalStatusTextEn = nil;
		}
		else {
			self.TeacherMaritalStatusTextEn = [[dictionary objectForKey: @"TeacherMaritalStatusTextEn"] copy];
		}
						
		NSObject *UniversityNameRef = [dictionary objectForKey:@"UniversityName"];
		if([UniversityNameRef isKindOfClass:[NSNull class]]) {
			self.UniversityName = nil;
		}
		else {
			self.UniversityName = [[dictionary objectForKey: @"UniversityName"] copy];
		}
						
		NSObject *UniversityNameArRef = [dictionary objectForKey:@"UniversityNameAr"];
		if([UniversityNameArRef isKindOfClass:[NSNull class]]) {
			self.UniversityNameAr = nil;
		}
		else {
			self.UniversityNameAr = [[dictionary objectForKey: @"UniversityNameAr"] copy];
		}
						
		NSObject *UniversityNameEnRef = [dictionary objectForKey:@"UniversityNameEn"];
		if([UniversityNameEnRef isKindOfClass:[NSNull class]]) {
			self.UniversityNameEn = nil;
		}
		else {
			self.UniversityNameEn = [[dictionary objectForKey: @"UniversityNameEn"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt: self.AgeMonths] forKey:@"AgeMonths"];
	[dictionary setValue:[NSNumber numberWithInt: self.AgeYears] forKey:@"AgeYears"];
	[dictionary setValue:[NSNumber numberWithBool: self.AnotherScholarship] forKey:@"AnotherScholarship"];
	[dictionary setValue:self.AnotherScholarshipProviderName forKey:@"AnotherScholarshipProviderName"];
	[dictionary setValue:self.CaseSearch forKey:@"CaseSearch"];
	[dictionary setValue:[NSNumber numberWithInt: self.CharityId] forKey:@"CharityId"];
	[dictionary setValue:self.CharityName forKey:@"CharityName"];
	[dictionary setValue:self.CityName forKey:@"CityName"];
	[dictionary setValue:self.CityNameAr forKey:@"CityNameAr"];
	[dictionary setValue:self.CityNameEn forKey:@"CityNameEn"];
	[dictionary setValue:[NSNumber numberWithInt: self.CountryID] forKey:@"CountryID"];
	[dictionary setValue:self.CountryName forKey:@"CountryName"];
	[dictionary setValue:self.CountryNameAr forKey:@"CountryNameAr"];
	[dictionary setValue:self.CountryNameEn forKey:@"CountryNameEn"];
	[dictionary setValue:[WebServiceEntities serializeToJsonDateString: self.DateOfBirth] forKey:@"DateOfBirth"];
	[dictionary setValue:self.DateOfBirthText forKey:@"DateOfBirthText"];
	[dictionary setValue:[NSNumber numberWithInt: self.DaughtersNumber] forKey:@"DaughtersNumber"];
	[dictionary setValue:[NSNumber numberWithDouble: self.DonationCost] forKey:@"DonationCost"];
	[dictionary setValue:[NSNumber numberWithInt: self.DonationTypeId] forKey:@"DonationTypeId"];
	[dictionary setValue:self.DonationTypesName forKey:@"DonationTypesName"];
	[dictionary setValue:self.DonationTypesNameAr forKey:@"DonationTypesNameAr"];
	[dictionary setValue:self.DonationTypesNameEn forKey:@"DonationTypesNameEn"];
	[dictionary setValue:self.EducationCost forKey:@"EducationCost"];
	[dictionary setValue:[NSNumber numberWithInt: self.FamilyMembers] forKey:@"FamilyMembers"];
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
	[dictionary setValue:self.HealthText forKey:@"HealthText"];
	[dictionary setValue:self.HealthTextAr forKey:@"HealthTextAr"];
	[dictionary setValue:self.HealthTextEn forKey:@"HealthTextEn"];
	[dictionary setValue:self.HousingStatusName forKey:@"HousingStatusName"];
	[dictionary setValue:self.HousingStatusNameAr forKey:@"HousingStatusNameAr"];
	[dictionary setValue:self.HousingStatusNameEn forKey:@"HousingStatusNameEn"];
	[dictionary setValue:[NSNumber numberWithLong: self.ID] forKey:@"ID"];
	[dictionary setValue:self.IncomeSource forKey:@"IncomeSource"];
	[dictionary setValue:self.IncomeSourceAr forKey:@"IncomeSourceAr"];
	[dictionary setValue:self.IncomeSourceEn forKey:@"IncomeSourceEn"];
	[dictionary setValue:self.InstitutionAddressAr forKey:@"InstitutionAddressAr"];
	[dictionary setValue:self.InstitutionAddressEn forKey:@"InstitutionAddressEn"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsLocked] forKey:@"IsLocked"];
	[dictionary setValue:[NSNumber numberWithDouble: self.MonthlyIncome] forKey:@"MonthlyIncome"];
	[dictionary setValue:self.NationalityCountryName forKey:@"NationalityCountryName"];
	[dictionary setValue:self.NationalityCountryNameAr forKey:@"NationalityCountryNameAr"];
	[dictionary setValue:self.NationalityCountryNameEn forKey:@"NationalityCountryNameEn"];
	[dictionary setValue:[NSNumber numberWithInt: self.PersonsStatusID] forKey:@"PersonsStatusID"];
	[dictionary setValue:self.SearchKey forKey:@"SearchKey"];
	[dictionary setValue:[NSNumber numberWithInt: self.SonsNumber] forKey:@"SonsNumber"];
	[dictionary setValue:self.StudentAddress forKey:@"StudentAddress"];
	[dictionary setValue:self.StudentAddressAr forKey:@"StudentAddressAr"];
	[dictionary setValue:self.StudentAddressEn forKey:@"StudentAddressEn"];
	[dictionary setValue:self.StudentBusinessPhone forKey:@"StudentBusinessPhone"];
	[dictionary setValue:self.StudentCertificateCertificateName forKey:@"StudentCertificateCertificateName"];
	[dictionary setValue:self.StudentCertificateCertificateNameAr forKey:@"StudentCertificateCertificateNameAr"];
	[dictionary setValue:self.StudentCertificateCertificateNameEn forKey:@"StudentCertificateCertificateNameEn"];
	[dictionary setValue:[WebServiceEntities serializeToJsonDateString: self.StudentCertificateDate] forKey:@"StudentCertificateDate"];
	[dictionary setValue:self.StudentEmail forKey:@"StudentEmail"];
	[dictionary setValue:self.StudentHomePhone forKey:@"StudentHomePhone"];
	[dictionary setValue:self.StudentInstitutionName forKey:@"StudentInstitutionName"];
	[dictionary setValue:self.StudentInstitutionNameAr forKey:@"StudentInstitutionNameAr"];
	[dictionary setValue:self.StudentInstitutionNameEn forKey:@"StudentInstitutionNameEn"];
	[dictionary setValue:self.StudentMaritalStatus forKey:@"StudentMaritalStatus"];
	[dictionary setValue:self.StudentMaritalStatusAr forKey:@"StudentMaritalStatusAr"];
	[dictionary setValue:self.StudentMaritalStatusEn forKey:@"StudentMaritalStatusEn"];
	[dictionary setValue:self.StudentMobilePhone forKey:@"StudentMobilePhone"];
	[dictionary setValue:self.StudentScholarshipGradeName forKey:@"StudentScholarshipGradeName"];
	[dictionary setValue:self.StudentScholarshipGradeNameAr forKey:@"StudentScholarshipGradeNameAr"];
	[dictionary setValue:self.StudentScholarshipGradeNameEn forKey:@"StudentScholarshipGradeNameEn"];
	[dictionary setValue:self.StudentWork forKey:@"StudentWork"];
	[dictionary setValue:self.StudentWorkAr forKey:@"StudentWorkAr"];
	[dictionary setValue:self.StudentWorkEn forKey:@"StudentWorkEn"];
	[dictionary setValue:self.StudentWorkOwner forKey:@"StudentWorkOwner"];
	[dictionary setValue:self.StudentWorkOwnerAr forKey:@"StudentWorkOwnerAr"];
	[dictionary setValue:self.StudentWorkOwnerEn forKey:@"StudentWorkOwnerEn"];
	[dictionary setValue:self.StudentsSponsorshipTypeName forKey:@"StudentsSponsorshipTypeName"];
	[dictionary setValue:self.StudentsSponsorshipTypeNameAr forKey:@"StudentsSponsorshipTypeNameAr"];
	[dictionary setValue:self.StudentsSponsorshipTypeNameEn forKey:@"StudentsSponsorshipTypeNameEn"];
	[dictionary setValue:self.StudyLevelText forKey:@"StudyLevelText"];
	[dictionary setValue:self.StudyLevelTextAr forKey:@"StudyLevelTextAr"];
	[dictionary setValue:self.StudyLevelTextEn forKey:@"StudyLevelTextEn"];
	[dictionary setValue:self.TeacherAddressAr forKey:@"TeacherAddressAr"];
	[dictionary setValue:self.TeacherAddressEn forKey:@"TeacherAddressEn"];
	[dictionary setValue:[NSNumber numberWithInt: self.TeacherChildrenCount] forKey:@"TeacherChildrenCount"];
	[dictionary setValue:self.TeacherEducatinoPlace forKey:@"TeacherEducatinoPlace"];
	[dictionary setValue:self.TeacherEducationType forKey:@"TeacherEducationType"];
	[dictionary setValue:self.TeacherFileCV forKey:@"TeacherFileCV"];
	[dictionary setValue:self.TeacherFileGraduationCertificate forKey:@"TeacherFileGraduationCertificate"];
	[dictionary setValue:self.TeacherFileRecommendation forKey:@"TeacherFileRecommendation"];
	[dictionary setValue:self.TeacherMaritalStatusText forKey:@"TeacherMaritalStatusText"];
	[dictionary setValue:self.TeacherMaritalStatusTextAr forKey:@"TeacherMaritalStatusTextAr"];
	[dictionary setValue:self.TeacherMaritalStatusTextEn forKey:@"TeacherMaritalStatusTextEn"];
	[dictionary setValue:self.UniversityName forKey:@"UniversityName"];
	[dictionary setValue:self.UniversityNameAr forKey:@"UniversityNameAr"];
	[dictionary setValue:self.UniversityNameEn forKey:@"UniversityNameEn"];
	return dictionary;
}

@end
