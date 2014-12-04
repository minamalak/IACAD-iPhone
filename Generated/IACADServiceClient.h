
#import <Foundation/Foundation.h>
#import "WebService.h"


@class IACADGetAllDonationTypes;
@class IACADGetAllDonationTypesResponse;
@class IACADGetAnonymousDonationTypes;
@class IACADGetAnonymousDonationTypesResponse;
@class IACADListCharities;
@class IACADListCharitiesResponse;
@class IACADListCharitiesForAnonymousDonation;
@class IACADListCharitiesForAnonymousDonationResponse;
@class IACADGetCharityDetails;
@class IACADGetCharityDetailsResponse;
@class IACADGetCharitiesByDonationType;
@class IACADGetCharitiesByDonationTypeResponse;
@class IACADGetDonationItemsByCharityAndDonationType;
@class IACADGetDonationItemsByCharityAndDonationTypeResponse;
@class IACADGetDonationItemsByCharityAndDonationTypeAndContries;
@class IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse;
@class IACADGetDonationItemDetails;
@class IACADGetDonationItemDetailsResponse;
@class IACADLogin;
@class IACADLoginResponse;
@class IACADRegister;
@class IACADRegisterResponse;
@class IACADGetMobileContent;
@class IACADGetMobileContentResponse;
@class IACADGetRegex;
@class IACADGetRegexResponse;
@class IACADGetEvents;
@class IACADGetEventsResponse;
@class IACADGetIPADImages;
@class IACADGetIPADImagesResponse;
@class IACADGetEventDetails;
@class IACADGetEventDetailsResponse;
@class IACADGetCountries;
@class IACADGetCountriesResponse;
@class IACADGetCitiesByCountry;
@class IACADGetCitiesByCountryResponse;
@class IACADAddAnonymiousDonation;
@class IACADAddAnonymiousDonationResponse;
@class IACADGetCharityName;
@class IACADGetCharityNameResponse;
@class IACADGetCatalogCountries;
@class IACADGetCatalogCountriesResponse;
@class IACADDonateToCatalogProject;
@class IACADDonateToCatalogProjectResponse;
@class IACADSendMailForgotPassword;
@class IACADSendMailForgotPasswordResponse;
@class IACADGetProfile;
@class IACADGetProfileResponse;
@class IACADEditProfile;
@class IACADEditProfileResponse;
@class IACADGetCatalogPersonCountries;
@class IACADGetCatalogPersonCountriesResponse;
@class IACADGetPersonsByCharityAndDonationType;
@class IACADGetPersonsByCharityAndDonationTypeResponse;
@class IACADGetPersonsByCharityAndDonationTypeAndContries;
@class IACADGetPersonsByCharityAndDonationTypeAndContriesResponse;
@class IACADGetCatalogPersonDetails;
@class IACADGetCatalogPersonDetailsResponse;
@class IACADDonateToCatalogPerson;
@class IACADDonateToCatalogPersonResponse;
@class IACADGetDonorProjects;
@class IACADGetDonorProjectsResponse;
@class IACADGetProject;
@class IACADGetProjectResponse;
@class IACADGetReliefCharities;
@class IACADGetReliefCharitiesResponse;
@class IACADGetReliefDisasterForCharity;
@class IACADGetReliefDisasterForCharityResponse;
@class IACADGetReliefNeedForDisaster;
@class IACADGetReliefNeedForDisasterResponse;
@class IACADAddReliefDonation;
@class IACADAddReliefDonationResponse;
@class IACADListSecretQuestions;
@class IACADListSecretQuestionsResponse;

@protocol IACADServiceClientCaller <NSObject>

@optional
- (void)GetAllDonationTypesCallback:(IACADGetAllDonationTypesResponse *)response error:(NSError *)error;
- (void)GetAnonymousDonationTypesCallback:(IACADGetAnonymousDonationTypesResponse *)response error:(NSError *)error;
- (void)ListCharitiesCallback:(IACADListCharitiesResponse *)response error:(NSError *)error;
- (void)ListCharitiesForAnonymousDonationCallback:(IACADListCharitiesForAnonymousDonationResponse *)response error:(NSError *)error;
- (void)GetCharityDetailsCallback:(IACADGetCharityDetailsResponse *)response error:(NSError *)error;
- (void)GetCharitiesByDonationTypeCallback:(IACADGetCharitiesByDonationTypeResponse *)response error:(NSError *)error;
- (void)GetDonationItemsByCharityAndDonationTypeCallback:(IACADGetDonationItemsByCharityAndDonationTypeResponse *)response error:(NSError *)error;
- (void)GetDonationItemsByCharityAndDonationTypeAndContriesCallback:(IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse *)response error:(NSError *)error;
- (void)GetDonationItemDetailsCallback:(IACADGetDonationItemDetailsResponse *)response error:(NSError *)error;
- (void)LoginCallback:(IACADLoginResponse *)response error:(NSError *)error;
- (void)RegisterCallback:(IACADRegisterResponse *)response error:(NSError *)error;
- (void)GetMobileContentCallback:(IACADGetMobileContentResponse *)response error:(NSError *)error;
- (void)GetRegexCallback:(IACADGetRegexResponse *)response error:(NSError *)error;
- (void)GetEventsCallback:(IACADGetEventsResponse *)response error:(NSError *)error;
- (void)GetIPADImagesCallback:(IACADGetIPADImagesResponse *)response error:(NSError *)error;
- (void)GetEventDetailsCallback:(IACADGetEventDetailsResponse *)response error:(NSError *)error;
- (void)GetCountriesCallback:(IACADGetCountriesResponse *)response error:(NSError *)error;
- (void)GetCitiesByCountryCallback:(IACADGetCitiesByCountryResponse *)response error:(NSError *)error;
- (void)AddAnonymiousDonationCallback:(IACADAddAnonymiousDonationResponse *)response error:(NSError *)error;
- (void)GetCharityNameCallback:(IACADGetCharityNameResponse *)response error:(NSError *)error;
- (void)GetCatalogCountriesCallback:(IACADGetCatalogCountriesResponse *)response error:(NSError *)error;
- (void)DonateToCatalogProjectCallback:(IACADDonateToCatalogProjectResponse *)response error:(NSError *)error;
- (void)SendMailForgotPasswordCallback:(IACADSendMailForgotPasswordResponse *)response error:(NSError *)error;
- (void)GetProfileCallback:(IACADGetProfileResponse *)response error:(NSError *)error;
- (void)EditProfileCallback:(IACADEditProfileResponse *)response error:(NSError *)error;
- (void)GetCatalogPersonCountriesCallback:(IACADGetCatalogPersonCountriesResponse *)response error:(NSError *)error;
- (void)GetPersonsByCharityAndDonationTypeCallback:(IACADGetPersonsByCharityAndDonationTypeResponse *)response error:(NSError *)error;
- (void)GetPersonsByCharityAndDonationTypeAndContriesCallback:(IACADGetPersonsByCharityAndDonationTypeAndContriesResponse *)response error:(NSError *)error;
- (void)GetCatalogPersonDetailsCallback:(IACADGetCatalogPersonDetailsResponse *)response error:(NSError *)error;
- (void)DonateToCatalogPersonCallback:(IACADDonateToCatalogPersonResponse *)response error:(NSError *)error;
- (void)GetDonorProjectsCallback:(IACADGetDonorProjectsResponse *)response error:(NSError *)error;
- (void)GetProjectCallback:(IACADGetProjectResponse *)response error:(NSError *)error;
- (void)GetReliefCharitiesCallback:(IACADGetReliefCharitiesResponse *)response error:(NSError *)error;
- (void)GetReliefDisasterForCharityCallback:(IACADGetReliefDisasterForCharityResponse *)response error:(NSError *)error;
- (void)GetReliefNeedForDisasterCallback:(IACADGetReliefNeedForDisasterResponse *)response error:(NSError *)error;
- (void)AddReliefDonationCallback:(IACADAddReliefDonationResponse *)response error:(NSError *)error;
- (void)ListSecretQuestionsCallback:(IACADListSecretQuestionsResponse *)response error:(NSError *)error;
@end

typedef enum IACADMethodCall {
	IACADMethodCallGetAllDonationTypes = 1,
	IACADMethodCallGetAnonymousDonationTypes = 2,
	IACADMethodCallListCharities = 3,
	IACADMethodCallListCharitiesForAnonymousDonation = 4,
	IACADMethodCallGetCharityDetails = 5,
	IACADMethodCallGetCharitiesByDonationType = 6,
	IACADMethodCallGetDonationItemsByCharityAndDonationType = 7,
	IACADMethodCallGetDonationItemsByCharityAndDonationTypeAndContries = 8,
	IACADMethodCallGetDonationItemDetails = 9,
	IACADMethodCallLogin = 10,
	IACADMethodCallRegister = 11,
	IACADMethodCallGetMobileContent = 12,
	IACADMethodCallGetRegex = 13,
	IACADMethodCallGetEvents = 14,
	IACADMethodCallGetIPADImages = 15,
	IACADMethodCallGetEventDetails = 16,
	IACADMethodCallGetCountries = 17,
	IACADMethodCallGetCitiesByCountry = 18,
	IACADMethodCallAddAnonymiousDonation = 19,
	IACADMethodCallGetCharityName = 20,
	IACADMethodCallGetCatalogCountries = 21,
	IACADMethodCallDonateToCatalogProject = 22,
	IACADMethodCallSendMailForgotPassword = 23,
	IACADMethodCallGetProfile = 24,
	IACADMethodCallEditProfile = 25,
	IACADMethodCallGetCatalogPersonCountries = 26,
	IACADMethodCallGetPersonsByCharityAndDonationType = 27,
	IACADMethodCallGetPersonsByCharityAndDonationTypeAndContries = 28,
	IACADMethodCallGetCatalogPersonDetails = 29,
	IACADMethodCallDonateToCatalogPerson = 30,
	IACADMethodCallGetDonorProjects = 31,
	IACADMethodCallGetProject = 32,
	IACADMethodCallGetReliefCharities = 33,
	IACADMethodCallGetReliefDisasterForCharity = 34,
	IACADMethodCallGetReliefNeedForDisaster = 35,
	IACADMethodCallAddReliefDonation = 36,
	IACADMethodCallListSecretQuestions = 37,
} IACADMethodCall;

@interface IACADServiceClient : NSObject<WebServiceCaller> {
	
}

- (IACADGetAllDonationTypesResponse *)GetAllDonationTypesIsPost:(BOOL)isPost input: (IACADGetAllDonationTypes *)input error:(NSError **)error;
- (void)GetAllDonationTypesAsyncIsPost:(BOOL)isPost input: (IACADGetAllDonationTypes *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetAnonymousDonationTypesResponse *)GetAnonymousDonationTypesIsPost:(BOOL)isPost input: (IACADGetAnonymousDonationTypes *)input error:(NSError **)error;
- (void)GetAnonymousDonationTypesAsyncIsPost:(BOOL)isPost input: (IACADGetAnonymousDonationTypes *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADListCharitiesResponse *)ListCharitiesIsPost:(BOOL)isPost input: (IACADListCharities *)input error:(NSError **)error;
- (void)ListCharitiesAsyncIsPost:(BOOL)isPost input: (IACADListCharities *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADListCharitiesForAnonymousDonationResponse *)ListCharitiesForAnonymousDonationIsPost:(BOOL)isPost input: (IACADListCharitiesForAnonymousDonation *)input error:(NSError **)error;
- (void)ListCharitiesForAnonymousDonationAsyncIsPost:(BOOL)isPost input: (IACADListCharitiesForAnonymousDonation *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetCharityDetailsResponse *)GetCharityDetailsIsPost:(BOOL)isPost input: (IACADGetCharityDetails *)input error:(NSError **)error;
- (void)GetCharityDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetCharityDetails *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetCharitiesByDonationTypeResponse *)GetCharitiesByDonationTypeIsPost:(BOOL)isPost input: (IACADGetCharitiesByDonationType *)input error:(NSError **)error;
- (void)GetCharitiesByDonationTypeAsyncIsPost:(BOOL)isPost input: (IACADGetCharitiesByDonationType *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetDonationItemsByCharityAndDonationTypeResponse *)GetDonationItemsByCharityAndDonationTypeIsPost:(BOOL)isPost input: (IACADGetDonationItemsByCharityAndDonationType *)input error:(NSError **)error;
- (void)GetDonationItemsByCharityAndDonationTypeAsyncIsPost:(BOOL)isPost input: (IACADGetDonationItemsByCharityAndDonationType *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse *)GetDonationItemsByCharityAndDonationTypeAndContriesIsPost:(BOOL)isPost input: (IACADGetDonationItemsByCharityAndDonationTypeAndContries *)input error:(NSError **)error;
- (void)GetDonationItemsByCharityAndDonationTypeAndContriesAsyncIsPost:(BOOL)isPost input: (IACADGetDonationItemsByCharityAndDonationTypeAndContries *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetDonationItemDetailsResponse *)GetDonationItemDetailsIsPost:(BOOL)isPost input: (IACADGetDonationItemDetails *)input error:(NSError **)error;
- (void)GetDonationItemDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetDonationItemDetails *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADLoginResponse *)LoginIsPost:(BOOL)isPost input: (IACADLogin *)input error:(NSError **)error;
- (void)LoginAsyncIsPost:(BOOL)isPost input: (IACADLogin *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADRegisterResponse *)RegisterIsPost:(BOOL)isPost input: (IACADRegister *)input error:(NSError **)error;
- (void)RegisterAsyncIsPost:(BOOL)isPost input: (IACADRegister *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetMobileContentResponse *)GetMobileContentIsPost:(BOOL)isPost input: (IACADGetMobileContent *)input error:(NSError **)error;
- (void)GetMobileContentAsyncIsPost:(BOOL)isPost input: (IACADGetMobileContent *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetRegexResponse *)GetRegexIsPost:(BOOL)isPost input: (IACADGetRegex *)input error:(NSError **)error;
- (void)GetRegexAsyncIsPost:(BOOL)isPost input: (IACADGetRegex *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetEventsResponse *)GetEventsIsPost:(BOOL)isPost input: (IACADGetEvents *)input error:(NSError **)error;
- (void)GetEventsAsyncIsPost:(BOOL)isPost input: (IACADGetEvents *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetIPADImagesResponse *)GetIPADImagesIsPost:(BOOL)isPost input: (IACADGetIPADImages *)input error:(NSError **)error;
- (void)GetIPADImagesAsyncIsPost:(BOOL)isPost input: (IACADGetIPADImages *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetEventDetailsResponse *)GetEventDetailsIsPost:(BOOL)isPost input: (IACADGetEventDetails *)input error:(NSError **)error;
- (void)GetEventDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetEventDetails *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetCountriesResponse *)GetCountriesIsPost:(BOOL)isPost input: (IACADGetCountries *)input error:(NSError **)error;
- (void)GetCountriesAsyncIsPost:(BOOL)isPost input: (IACADGetCountries *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetCitiesByCountryResponse *)GetCitiesByCountryIsPost:(BOOL)isPost input: (IACADGetCitiesByCountry *)input error:(NSError **)error;
- (void)GetCitiesByCountryAsyncIsPost:(BOOL)isPost input: (IACADGetCitiesByCountry *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADAddAnonymiousDonationResponse *)AddAnonymiousDonationIsPost:(BOOL)isPost input: (IACADAddAnonymiousDonation *)input error:(NSError **)error;
- (void)AddAnonymiousDonationAsyncIsPost:(BOOL)isPost input: (IACADAddAnonymiousDonation *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetCharityNameResponse *)GetCharityNameIsPost:(BOOL)isPost input: (IACADGetCharityName *)input error:(NSError **)error;
- (void)GetCharityNameAsyncIsPost:(BOOL)isPost input: (IACADGetCharityName *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetCatalogCountriesResponse *)GetCatalogCountriesIsPost:(BOOL)isPost input: (IACADGetCatalogCountries *)input error:(NSError **)error;
- (void)GetCatalogCountriesAsyncIsPost:(BOOL)isPost input: (IACADGetCatalogCountries *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADDonateToCatalogProjectResponse *)DonateToCatalogProjectIsPost:(BOOL)isPost input: (IACADDonateToCatalogProject *)input error:(NSError **)error;
- (void)DonateToCatalogProjectAsyncIsPost:(BOOL)isPost input: (IACADDonateToCatalogProject *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADSendMailForgotPasswordResponse *)SendMailForgotPasswordIsPost:(BOOL)isPost input: (IACADSendMailForgotPassword *)input error:(NSError **)error;
- (void)SendMailForgotPasswordAsyncIsPost:(BOOL)isPost input: (IACADSendMailForgotPassword *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetProfileResponse *)GetProfileIsPost:(BOOL)isPost input: (IACADGetProfile *)input error:(NSError **)error;
- (void)GetProfileAsyncIsPost:(BOOL)isPost input: (IACADGetProfile *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADEditProfileResponse *)EditProfileIsPost:(BOOL)isPost input: (IACADEditProfile *)input error:(NSError **)error;
- (void)EditProfileAsyncIsPost:(BOOL)isPost input: (IACADEditProfile *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetCatalogPersonCountriesResponse *)GetCatalogPersonCountriesIsPost:(BOOL)isPost input: (IACADGetCatalogPersonCountries *)input error:(NSError **)error;
- (void)GetCatalogPersonCountriesAsyncIsPost:(BOOL)isPost input: (IACADGetCatalogPersonCountries *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetPersonsByCharityAndDonationTypeResponse *)GetPersonsByCharityAndDonationTypeIsPost:(BOOL)isPost input: (IACADGetPersonsByCharityAndDonationType *)input error:(NSError **)error;
- (void)GetPersonsByCharityAndDonationTypeAsyncIsPost:(BOOL)isPost input: (IACADGetPersonsByCharityAndDonationType *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetPersonsByCharityAndDonationTypeAndContriesResponse *)GetPersonsByCharityAndDonationTypeAndContriesIsPost:(BOOL)isPost input: (IACADGetPersonsByCharityAndDonationTypeAndContries *)input error:(NSError **)error;
- (void)GetPersonsByCharityAndDonationTypeAndContriesAsyncIsPost:(BOOL)isPost input: (IACADGetPersonsByCharityAndDonationTypeAndContries *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetCatalogPersonDetailsResponse *)GetCatalogPersonDetailsIsPost:(BOOL)isPost input: (IACADGetCatalogPersonDetails *)input error:(NSError **)error;
- (void)GetCatalogPersonDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetCatalogPersonDetails *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADDonateToCatalogPersonResponse *)DonateToCatalogPersonIsPost:(BOOL)isPost input: (IACADDonateToCatalogPerson *)input error:(NSError **)error;
- (void)DonateToCatalogPersonAsyncIsPost:(BOOL)isPost input: (IACADDonateToCatalogPerson *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetDonorProjectsResponse *)GetDonorProjectsIsPost:(BOOL)isPost input: (IACADGetDonorProjects *)input error:(NSError **)error;
- (void)GetDonorProjectsAsyncIsPost:(BOOL)isPost input: (IACADGetDonorProjects *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetProjectResponse *)GetProjectIsPost:(BOOL)isPost input: (IACADGetProject *)input error:(NSError **)error;
- (void)GetProjectAsyncIsPost:(BOOL)isPost input: (IACADGetProject *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetReliefCharitiesResponse *)GetReliefCharitiesIsPost:(BOOL)isPost input: (IACADGetReliefCharities *)input error:(NSError **)error;
- (void)GetReliefCharitiesAsyncIsPost:(BOOL)isPost input: (IACADGetReliefCharities *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetReliefDisasterForCharityResponse *)GetReliefDisasterForCharityIsPost:(BOOL)isPost input: (IACADGetReliefDisasterForCharity *)input error:(NSError **)error;
- (void)GetReliefDisasterForCharityAsyncIsPost:(BOOL)isPost input: (IACADGetReliefDisasterForCharity *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetReliefNeedForDisasterResponse *)GetReliefNeedForDisasterIsPost:(BOOL)isPost input: (IACADGetReliefNeedForDisaster *)input error:(NSError **)error;
- (void)GetReliefNeedForDisasterAsyncIsPost:(BOOL)isPost input: (IACADGetReliefNeedForDisaster *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADAddReliefDonationResponse *)AddReliefDonationIsPost:(BOOL)isPost input: (IACADAddReliefDonation *)input error:(NSError **)error;
- (void)AddReliefDonationAsyncIsPost:(BOOL)isPost input: (IACADAddReliefDonation *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADListSecretQuestionsResponse *)ListSecretQuestionsIsPost:(BOOL)isPost input: (IACADListSecretQuestions *)input error:(NSError **)error;
- (void)ListSecretQuestionsAsyncIsPost:(BOOL)isPost input: (IACADListSecretQuestions *)input caller:(id<IACADServiceClientCaller>)caller;

@end