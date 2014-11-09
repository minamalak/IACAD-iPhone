
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
@class IACADGetDonationItemDetails;
@class IACADGetDonationItemDetailsResponse;
@class IACADLogin;
@class IACADLoginResponse;
@class IACADRegister;
@class IACADRegisterResponse;
@class IACADGetMobileContent;
@class IACADGetMobileContentResponse;
@class IACADGetEvents;
@class IACADGetEventsResponse;
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
@class IACADGetCatalogPersonDetails;
@class IACADGetCatalogPersonDetailsResponse;
@class IACADDonateToCatalogPerson;
@class IACADDonateToCatalogPersonResponse;

@protocol IACADServiceClientCaller <NSObject>

@optional
- (void)GetAllDonationTypesCallback:(IACADGetAllDonationTypesResponse *)response error:(NSError *)error;
- (void)GetAnonymousDonationTypesCallback:(IACADGetAnonymousDonationTypesResponse *)response error:(NSError *)error;
- (void)ListCharitiesCallback:(IACADListCharitiesResponse *)response error:(NSError *)error;
- (void)ListCharitiesForAnonymousDonationCallback:(IACADListCharitiesForAnonymousDonationResponse *)response error:(NSError *)error;
- (void)GetCharityDetailsCallback:(IACADGetCharityDetailsResponse *)response error:(NSError *)error;
- (void)GetCharitiesByDonationTypeCallback:(IACADGetCharitiesByDonationTypeResponse *)response error:(NSError *)error;
- (void)GetDonationItemsByCharityAndDonationTypeCallback:(IACADGetDonationItemsByCharityAndDonationTypeResponse *)response error:(NSError *)error;
- (void)GetDonationItemDetailsCallback:(IACADGetDonationItemDetailsResponse *)response error:(NSError *)error;
- (void)LoginCallback:(IACADLoginResponse *)response error:(NSError *)error;
- (void)RegisterCallback:(IACADRegisterResponse *)response error:(NSError *)error;
- (void)GetMobileContentCallback:(IACADGetMobileContentResponse *)response error:(NSError *)error;
- (void)GetEventsCallback:(IACADGetEventsResponse *)response error:(NSError *)error;
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
- (void)GetCatalogPersonDetailsCallback:(IACADGetCatalogPersonDetailsResponse *)response error:(NSError *)error;
- (void)DonateToCatalogPersonCallback:(IACADDonateToCatalogPersonResponse *)response error:(NSError *)error;
@end

typedef enum IACADMethodCall {
	IACADMethodCallGetAllDonationTypes = 1,
	IACADMethodCallGetAnonymousDonationTypes = 2,
	IACADMethodCallListCharities = 3,
	IACADMethodCallListCharitiesForAnonymousDonation = 4,
	IACADMethodCallGetCharityDetails = 5,
	IACADMethodCallGetCharitiesByDonationType = 6,
	IACADMethodCallGetDonationItemsByCharityAndDonationType = 7,
	IACADMethodCallGetDonationItemDetails = 8,
	IACADMethodCallLogin = 9,
	IACADMethodCallRegister = 10,
	IACADMethodCallGetMobileContent = 11,
	IACADMethodCallGetEvents = 12,
	IACADMethodCallGetEventDetails = 13,
	IACADMethodCallGetCountries = 14,
	IACADMethodCallGetCitiesByCountry = 15,
	IACADMethodCallAddAnonymiousDonation = 16,
	IACADMethodCallGetCharityName = 17,
	IACADMethodCallGetCatalogCountries = 18,
	IACADMethodCallDonateToCatalogProject = 19,
	IACADMethodCallSendMailForgotPassword = 20,
	IACADMethodCallGetProfile = 21,
	IACADMethodCallEditProfile = 22,
	IACADMethodCallGetCatalogPersonCountries = 23,
	IACADMethodCallGetPersonsByCharityAndDonationType = 24,
	IACADMethodCallGetCatalogPersonDetails = 25,
	IACADMethodCallDonateToCatalogPerson = 26,
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
- (IACADGetDonationItemDetailsResponse *)GetDonationItemDetailsIsPost:(BOOL)isPost input: (IACADGetDonationItemDetails *)input error:(NSError **)error;
- (void)GetDonationItemDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetDonationItemDetails *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADLoginResponse *)LoginIsPost:(BOOL)isPost input: (IACADLogin *)input error:(NSError **)error;
- (void)LoginAsyncIsPost:(BOOL)isPost input: (IACADLogin *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADRegisterResponse *)RegisterIsPost:(BOOL)isPost input: (IACADRegister *)input error:(NSError **)error;
- (void)RegisterAsyncIsPost:(BOOL)isPost input: (IACADRegister *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetMobileContentResponse *)GetMobileContentIsPost:(BOOL)isPost input: (IACADGetMobileContent *)input error:(NSError **)error;
- (void)GetMobileContentAsyncIsPost:(BOOL)isPost input: (IACADGetMobileContent *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADGetEventsResponse *)GetEventsIsPost:(BOOL)isPost input: (IACADGetEvents *)input error:(NSError **)error;
- (void)GetEventsAsyncIsPost:(BOOL)isPost input: (IACADGetEvents *)input caller:(id<IACADServiceClientCaller>)caller;
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
- (IACADGetCatalogPersonDetailsResponse *)GetCatalogPersonDetailsIsPost:(BOOL)isPost input: (IACADGetCatalogPersonDetails *)input error:(NSError **)error;
- (void)GetCatalogPersonDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetCatalogPersonDetails *)input caller:(id<IACADServiceClientCaller>)caller;
- (IACADDonateToCatalogPersonResponse *)DonateToCatalogPersonIsPost:(BOOL)isPost input: (IACADDonateToCatalogPerson *)input error:(NSError **)error;
- (void)DonateToCatalogPersonAsyncIsPost:(BOOL)isPost input: (IACADDonateToCatalogPerson *)input caller:(id<IACADServiceClientCaller>)caller;

@end