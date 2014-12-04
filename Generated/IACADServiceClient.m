


#import <Foundation/Foundation.h>
#import "IACADServiceClient.h"
#import "WebServiceResponse.h"
#import "WebServiceRequest.h"
#import "WebService.h"

#import "IACADGetAllDonationTypes.h"
#import "IACADGetAllDonationTypesResponse.h"
#import "IACADGetAnonymousDonationTypes.h"
#import "IACADGetAnonymousDonationTypesResponse.h"
#import "IACADListCharities.h"
#import "IACADListCharitiesResponse.h"
#import "IACADListCharitiesForAnonymousDonation.h"
#import "IACADListCharitiesForAnonymousDonationResponse.h"
#import "IACADGetCharityDetails.h"
#import "IACADGetCharityDetailsResponse.h"
#import "IACADGetCharitiesByDonationType.h"
#import "IACADGetCharitiesByDonationTypeResponse.h"
#import "IACADGetDonationItemsByCharityAndDonationType.h"
#import "IACADGetDonationItemsByCharityAndDonationTypeResponse.h"
#import "IACADGetDonationItemsByCharityAndDonationTypeAndContries.h"
#import "IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse.h"
#import "IACADGetDonationItemDetails.h"
#import "IACADGetDonationItemDetailsResponse.h"
#import "IACADLogin.h"
#import "IACADLoginResponse.h"
#import "IACADRegister.h"
#import "IACADRegisterResponse.h"
#import "IACADGetMobileContent.h"
#import "IACADGetMobileContentResponse.h"
#import "IACADGetRegex.h"
#import "IACADGetRegexResponse.h"
#import "IACADGetEvents.h"
#import "IACADGetEventsResponse.h"
//#import "IACADGetIPADImages.h"
//#import "IACADGetIPADImagesResponse.h"
#import "IACADGetEventDetails.h"
#import "IACADGetEventDetailsResponse.h"
#import "IACADGetCountries.h"
#import "IACADGetCountriesResponse.h"
#import "IACADGetCitiesByCountry.h"
#import "IACADGetCitiesByCountryResponse.h"
#import "IACADAddAnonymiousDonation.h"
#import "IACADAddAnonymiousDonationResponse.h"
#import "IACADGetCharityName.h"
#import "IACADGetCharityNameResponse.h"
#import "IACADGetCatalogCountries.h"
#import "IACADGetCatalogCountriesResponse.h"
#import "IACADDonateToCatalogProject.h"
#import "IACADDonateToCatalogProjectResponse.h"
#import "IACADSendMailForgotPassword.h"
#import "IACADSendMailForgotPasswordResponse.h"
#import "IACADGetProfile.h"
#import "IACADGetProfileResponse.h"
#import "IACADEditProfile.h"
#import "IACADEditProfileResponse.h"
#import "IACADGetCatalogPersonCountries.h"
#import "IACADGetCatalogPersonCountriesResponse.h"
#import "IACADGetPersonsByCharityAndDonationType.h"
#import "IACADGetPersonsByCharityAndDonationTypeResponse.h"
#import "IACADGetPersonsByCharityAndDonationTypeAndContries.h"
#import "IACADGetPersonsByCharityAndDonationTypeAndContriesResponse.h"
#import "IACADGetCatalogPersonDetails.h"
#import "IACADGetCatalogPersonDetailsResponse.h"
#import "IACADDonateToCatalogPerson.h"
#import "IACADDonateToCatalogPersonResponse.h"
#import "IACADGetDonorProjects.h"
#import "IACADGetDonorProjectsResponse.h"
#import "IACADGetProject.h"
#import "IACADGetProjectResponse.h"
#import "IACADGetReliefCharities.h"
#import "IACADGetReliefCharitiesResponse.h"
#import "IACADGetReliefDisasterForCharity.h"
#import "IACADGetReliefDisasterForCharityResponse.h"
#import "IACADGetReliefNeedForDisaster.h"
#import "IACADGetReliefNeedForDisasterResponse.h"
#import "IACADAddReliefDonation.h"
#import "IACADAddReliefDonationResponse.h"
#import "IACADListSecretQuestions.h"
#import "IACADListSecretQuestionsResponse.h"

#define serviceURL @"http://iacadcld.linkdev.com/services/MobileService.svc/"


@implementation IACADServiceClient

- (void)webServiceCallback:(WebServiceResponse *)response {
	id<IACADServiceClientCaller> caller = (id<IACADServiceClientCaller>)response.caller;
	switch (response.call) {
		case IACADMethodCallGetAllDonationTypes:
			{
				IACADGetAllDonationTypesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetAllDonationTypesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetAllDonationTypesCallback:error:)]) {
					[caller GetAllDonationTypesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetAnonymousDonationTypes:
			{
				IACADGetAnonymousDonationTypesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetAnonymousDonationTypesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetAnonymousDonationTypesCallback:error:)]) {
					[caller GetAnonymousDonationTypesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallListCharities:
			{
				IACADListCharitiesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADListCharitiesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(ListCharitiesCallback:error:)]) {
					[caller ListCharitiesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallListCharitiesForAnonymousDonation:
			{
				IACADListCharitiesForAnonymousDonationResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADListCharitiesForAnonymousDonationResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(ListCharitiesForAnonymousDonationCallback:error:)]) {
					[caller ListCharitiesForAnonymousDonationCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetCharityDetails:
			{
				IACADGetCharityDetailsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetCharityDetailsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetCharityDetailsCallback:error:)]) {
					[caller GetCharityDetailsCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetCharitiesByDonationType:
			{
				IACADGetCharitiesByDonationTypeResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetCharitiesByDonationTypeResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetCharitiesByDonationTypeCallback:error:)]) {
					[caller GetCharitiesByDonationTypeCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetDonationItemsByCharityAndDonationType:
			{
				IACADGetDonationItemsByCharityAndDonationTypeResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetDonationItemsByCharityAndDonationTypeResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetDonationItemsByCharityAndDonationTypeCallback:error:)]) {
					[caller GetDonationItemsByCharityAndDonationTypeCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetDonationItemsByCharityAndDonationTypeAndContries:
			{
				IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetDonationItemsByCharityAndDonationTypeAndContriesCallback:error:)]) {
					[caller GetDonationItemsByCharityAndDonationTypeAndContriesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetDonationItemDetails:
			{
				IACADGetDonationItemDetailsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetDonationItemDetailsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetDonationItemDetailsCallback:error:)]) {
					[caller GetDonationItemDetailsCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallLogin:
			{
				IACADLoginResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADLoginResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(LoginCallback:error:)]) {
					[caller LoginCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallRegister:
			{
				IACADRegisterResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADRegisterResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(RegisterCallback:error:)]) {
					[caller RegisterCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetMobileContent:
			{
				IACADGetMobileContentResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetMobileContentResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetMobileContentCallback:error:)]) {
					[caller GetMobileContentCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetRegex:
			{
				IACADGetRegexResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetRegexResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetRegexCallback:error:)]) {
					[caller GetRegexCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetEvents:
			{
				IACADGetEventsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetEventsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetEventsCallback:error:)]) {
					[caller GetEventsCallback:output error:response.error];
				}
				break;
			}
//		case IACADMethodCallGetIPADImages:
//			{
//				IACADGetIPADImagesResponse *output = nil;
//				if(!response.error) {
//					NSError *jsonParsingError = nil;
//					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
//					//NSDictionary *deserializedData = [response.content objectFromJSONData];
//					output = [[IACADGetIPADImagesResponse alloc] initWithData:deserializedData];
//				}
//				if(caller && [caller respondsToSelector:@selector(GetIPADImagesCallback:error:)]) {
//					[caller GetIPADImagesCallback:output error:response.error];
//				}
//				break;
//			}
		case IACADMethodCallGetEventDetails:
			{
				IACADGetEventDetailsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetEventDetailsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetEventDetailsCallback:error:)]) {
					[caller GetEventDetailsCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetCountries:
			{
				IACADGetCountriesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetCountriesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetCountriesCallback:error:)]) {
					[caller GetCountriesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetCitiesByCountry:
			{
				IACADGetCitiesByCountryResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetCitiesByCountryResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetCitiesByCountryCallback:error:)]) {
					[caller GetCitiesByCountryCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallAddAnonymiousDonation:
			{
				IACADAddAnonymiousDonationResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADAddAnonymiousDonationResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(AddAnonymiousDonationCallback:error:)]) {
					[caller AddAnonymiousDonationCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetCharityName:
			{
				IACADGetCharityNameResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetCharityNameResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetCharityNameCallback:error:)]) {
					[caller GetCharityNameCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetCatalogCountries:
			{
				IACADGetCatalogCountriesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetCatalogCountriesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetCatalogCountriesCallback:error:)]) {
					[caller GetCatalogCountriesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallDonateToCatalogProject:
			{
				IACADDonateToCatalogProjectResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADDonateToCatalogProjectResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(DonateToCatalogProjectCallback:error:)]) {
					[caller DonateToCatalogProjectCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallSendMailForgotPassword:
			{
				IACADSendMailForgotPasswordResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADSendMailForgotPasswordResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(SendMailForgotPasswordCallback:error:)]) {
					[caller SendMailForgotPasswordCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetProfile:
			{
				IACADGetProfileResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetProfileResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetProfileCallback:error:)]) {
					[caller GetProfileCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallEditProfile:
			{
				IACADEditProfileResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADEditProfileResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(EditProfileCallback:error:)]) {
					[caller EditProfileCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetCatalogPersonCountries:
			{
				IACADGetCatalogPersonCountriesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetCatalogPersonCountriesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetCatalogPersonCountriesCallback:error:)]) {
					[caller GetCatalogPersonCountriesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetPersonsByCharityAndDonationType:
			{
				IACADGetPersonsByCharityAndDonationTypeResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetPersonsByCharityAndDonationTypeResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetPersonsByCharityAndDonationTypeCallback:error:)]) {
					[caller GetPersonsByCharityAndDonationTypeCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetPersonsByCharityAndDonationTypeAndContries:
			{
				IACADGetPersonsByCharityAndDonationTypeAndContriesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetPersonsByCharityAndDonationTypeAndContriesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetPersonsByCharityAndDonationTypeAndContriesCallback:error:)]) {
					[caller GetPersonsByCharityAndDonationTypeAndContriesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetCatalogPersonDetails:
			{
				IACADGetCatalogPersonDetailsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetCatalogPersonDetailsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetCatalogPersonDetailsCallback:error:)]) {
					[caller GetCatalogPersonDetailsCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallDonateToCatalogPerson:
			{
				IACADDonateToCatalogPersonResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADDonateToCatalogPersonResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(DonateToCatalogPersonCallback:error:)]) {
					[caller DonateToCatalogPersonCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetDonorProjects:
			{
				IACADGetDonorProjectsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetDonorProjectsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetDonorProjectsCallback:error:)]) {
					[caller GetDonorProjectsCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetProject:
			{
				IACADGetProjectResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetProjectResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetProjectCallback:error:)]) {
					[caller GetProjectCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetReliefCharities:
			{
				IACADGetReliefCharitiesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetReliefCharitiesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetReliefCharitiesCallback:error:)]) {
					[caller GetReliefCharitiesCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetReliefDisasterForCharity:
			{
				IACADGetReliefDisasterForCharityResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetReliefDisasterForCharityResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetReliefDisasterForCharityCallback:error:)]) {
					[caller GetReliefDisasterForCharityCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallGetReliefNeedForDisaster:
			{
				IACADGetReliefNeedForDisasterResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADGetReliefNeedForDisasterResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetReliefNeedForDisasterCallback:error:)]) {
					[caller GetReliefNeedForDisasterCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallAddReliefDonation:
			{
				IACADAddReliefDonationResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADAddReliefDonationResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(AddReliefDonationCallback:error:)]) {
					[caller AddReliefDonationCallback:output error:response.error];
				}
				break;
			}
		case IACADMethodCallListSecretQuestions:
			{
				IACADListSecretQuestionsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[IACADListSecretQuestionsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(ListSecretQuestionsCallback:error:)]) {
					[caller ListSecretQuestionsCallback:output error:response.error];
				}
				break;
			}
	}
}

- (IACADGetAllDonationTypesResponse *)GetAllDonationTypesIsPost:(BOOL)isPost input: (IACADGetAllDonationTypes *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetAllDonationTypes", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetAllDonationTypes%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetAllDonationTypesResponse *output = [[IACADGetAllDonationTypesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetAllDonationTypesAsyncIsPost:(BOOL)isPost input: (IACADGetAllDonationTypes *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetAllDonationTypes;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetAllDonationTypes", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetAllDonationTypes%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetAnonymousDonationTypesResponse *)GetAnonymousDonationTypesIsPost:(BOOL)isPost input: (IACADGetAnonymousDonationTypes *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetAnonymousDonationTypes", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetAnonymousDonationTypes%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetAnonymousDonationTypesResponse *output = [[IACADGetAnonymousDonationTypesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetAnonymousDonationTypesAsyncIsPost:(BOOL)isPost input: (IACADGetAnonymousDonationTypes *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetAnonymousDonationTypes;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetAnonymousDonationTypes", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetAnonymousDonationTypes%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADListCharitiesResponse *)ListCharitiesIsPost:(BOOL)isPost input: (IACADListCharities *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@ListCharities", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@ListCharities%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADListCharitiesResponse *output = [[IACADListCharitiesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)ListCharitiesAsyncIsPost:(BOOL)isPost input: (IACADListCharities *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallListCharities;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@ListCharities", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@ListCharities%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADListCharitiesForAnonymousDonationResponse *)ListCharitiesForAnonymousDonationIsPost:(BOOL)isPost input: (IACADListCharitiesForAnonymousDonation *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@ListCharitiesForAnonymousDonation", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@ListCharitiesForAnonymousDonation%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADListCharitiesForAnonymousDonationResponse *output = [[IACADListCharitiesForAnonymousDonationResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)ListCharitiesForAnonymousDonationAsyncIsPost:(BOOL)isPost input: (IACADListCharitiesForAnonymousDonation *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallListCharitiesForAnonymousDonation;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@ListCharitiesForAnonymousDonation", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@ListCharitiesForAnonymousDonation%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetCharityDetailsResponse *)GetCharityDetailsIsPost:(BOOL)isPost input: (IACADGetCharityDetails *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCharityDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCharityDetails%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetCharityDetailsResponse *output = [[IACADGetCharityDetailsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetCharityDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetCharityDetails *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetCharityDetails;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCharityDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCharityDetails%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetCharitiesByDonationTypeResponse *)GetCharitiesByDonationTypeIsPost:(BOOL)isPost input: (IACADGetCharitiesByDonationType *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCharitiesByDonationType", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCharitiesByDonationType%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetCharitiesByDonationTypeResponse *output = [[IACADGetCharitiesByDonationTypeResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetCharitiesByDonationTypeAsyncIsPost:(BOOL)isPost input: (IACADGetCharitiesByDonationType *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetCharitiesByDonationType;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCharitiesByDonationType", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCharitiesByDonationType%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetDonationItemsByCharityAndDonationTypeResponse *)GetDonationItemsByCharityAndDonationTypeIsPost:(BOOL)isPost input: (IACADGetDonationItemsByCharityAndDonationType *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemsByCharityAndDonationType", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemsByCharityAndDonationType%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetDonationItemsByCharityAndDonationTypeResponse *output = [[IACADGetDonationItemsByCharityAndDonationTypeResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetDonationItemsByCharityAndDonationTypeAsyncIsPost:(BOOL)isPost input: (IACADGetDonationItemsByCharityAndDonationType *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetDonationItemsByCharityAndDonationType;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemsByCharityAndDonationType", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemsByCharityAndDonationType%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse *)GetDonationItemsByCharityAndDonationTypeAndContriesIsPost:(BOOL)isPost input: (IACADGetDonationItemsByCharityAndDonationTypeAndContries *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemsByCharityAndDonationTypeAndContries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemsByCharityAndDonationTypeAndContries%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse *output = [[IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetDonationItemsByCharityAndDonationTypeAndContriesAsyncIsPost:(BOOL)isPost input: (IACADGetDonationItemsByCharityAndDonationTypeAndContries *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetDonationItemsByCharityAndDonationTypeAndContries;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemsByCharityAndDonationTypeAndContries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemsByCharityAndDonationTypeAndContries%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetDonationItemDetailsResponse *)GetDonationItemDetailsIsPost:(BOOL)isPost input: (IACADGetDonationItemDetails *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemDetails%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetDonationItemDetailsResponse *output = [[IACADGetDonationItemDetailsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetDonationItemDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetDonationItemDetails *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetDonationItemDetails;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetDonationItemDetails%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADLoginResponse *)LoginIsPost:(BOOL)isPost input: (IACADLogin *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@Login", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@Login%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADLoginResponse *output = [[IACADLoginResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)LoginAsyncIsPost:(BOOL)isPost input: (IACADLogin *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallLogin;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@Login", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@Login%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADRegisterResponse *)RegisterIsPost:(BOOL)isPost input: (IACADRegister *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@Register", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@Register%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADRegisterResponse *output = [[IACADRegisterResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)RegisterAsyncIsPost:(BOOL)isPost input: (IACADRegister *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallRegister;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@Register", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@Register%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetMobileContentResponse *)GetMobileContentIsPost:(BOOL)isPost input: (IACADGetMobileContent *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetMobileContent", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetMobileContent%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetMobileContentResponse *output = [[IACADGetMobileContentResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetMobileContentAsyncIsPost:(BOOL)isPost input: (IACADGetMobileContent *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetMobileContent;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetMobileContent", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetMobileContent%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetRegexResponse *)GetRegexIsPost:(BOOL)isPost input: (IACADGetRegex *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetRegex", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetRegex%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetRegexResponse *output = [[IACADGetRegexResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetRegexAsyncIsPost:(BOOL)isPost input: (IACADGetRegex *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetRegex;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetRegex", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetRegex%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetEventsResponse *)GetEventsIsPost:(BOOL)isPost input: (IACADGetEvents *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetEvents", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetEvents%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetEventsResponse *output = [[IACADGetEventsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetEventsAsyncIsPost:(BOOL)isPost input: (IACADGetEvents *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetEvents;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetEvents", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetEvents%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

//- (IACADGetIPADImagesResponse *)GetIPADImagesIsPost:(BOOL)isPost input: (IACADGetIPADImages *)input error:(NSError **)error {
//	WebServiceRequest *request = [[WebServiceRequest alloc] init];
//	if (isPost) {
//		request.url = [[NSString alloc] initWithFormat:@"%@GetIPADImages", serviceURL];
//		//request.body = [[input JSONDictionary] JSONData];
//		NSError *writeError = nil; 
//		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
//    }
//    else {
//        request.url = [[NSString alloc] initWithFormat:@"%@GetIPADImages%@", serviceURL, [input requestGETParams]];
//    }
//	
//	WebService *service = [[WebService alloc] initWithRequest:request];
//	NSURLResponse *response = nil;
//	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
//	//NSDictionary *deserializedData = [data objectFromJSONData];
//	NSError *jsonParsingError = nil;
//	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
//	IACADGetIPADImagesResponse *output = [[IACADGetIPADImagesResponse alloc] initWithData:deserializedData];
//	return output;
//}
//- (void)GetIPADImagesAsyncIsPost:(BOOL)isPost input: (IACADGetIPADImages *)input caller:(id<IACADServiceClientCaller>)caller {
//	WebServiceRequest *request = [[WebServiceRequest alloc] init];
//	request.caller = caller;
//	request.call = IACADMethodCallGetIPADImages;
//	if (isPost) {
//		request.url = [[NSString alloc] initWithFormat:@"%@GetIPADImages", serviceURL];
//		//request.body = [[input JSONDictionary] JSONData];
//		NSError *writeError = nil; 
//		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
//    }
//    else {
//        request.url = [[NSString alloc] initWithFormat:@"%@GetIPADImages%@", serviceURL, [input requestGETParams]];
//    }
//
//	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
//	[service dataWithContentAsyncIsPost:isPost];
//}

- (IACADGetEventDetailsResponse *)GetEventDetailsIsPost:(BOOL)isPost input: (IACADGetEventDetails *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetEventDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetEventDetails%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetEventDetailsResponse *output = [[IACADGetEventDetailsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetEventDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetEventDetails *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetEventDetails;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetEventDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetEventDetails%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetCountriesResponse *)GetCountriesIsPost:(BOOL)isPost input: (IACADGetCountries *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCountries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCountries%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetCountriesResponse *output = [[IACADGetCountriesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetCountriesAsyncIsPost:(BOOL)isPost input: (IACADGetCountries *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetCountries;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCountries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCountries%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetCitiesByCountryResponse *)GetCitiesByCountryIsPost:(BOOL)isPost input: (IACADGetCitiesByCountry *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCitiesByCountry", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCitiesByCountry%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetCitiesByCountryResponse *output = [[IACADGetCitiesByCountryResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetCitiesByCountryAsyncIsPost:(BOOL)isPost input: (IACADGetCitiesByCountry *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetCitiesByCountry;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCitiesByCountry", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCitiesByCountry%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADAddAnonymiousDonationResponse *)AddAnonymiousDonationIsPost:(BOOL)isPost input: (IACADAddAnonymiousDonation *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@AddAnonymiousDonation", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@AddAnonymiousDonation%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADAddAnonymiousDonationResponse *output = [[IACADAddAnonymiousDonationResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)AddAnonymiousDonationAsyncIsPost:(BOOL)isPost input: (IACADAddAnonymiousDonation *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallAddAnonymiousDonation;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@AddAnonymiousDonation", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@AddAnonymiousDonation%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetCharityNameResponse *)GetCharityNameIsPost:(BOOL)isPost input: (IACADGetCharityName *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCharityName", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCharityName%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetCharityNameResponse *output = [[IACADGetCharityNameResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetCharityNameAsyncIsPost:(BOOL)isPost input: (IACADGetCharityName *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetCharityName;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCharityName", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCharityName%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetCatalogCountriesResponse *)GetCatalogCountriesIsPost:(BOOL)isPost input: (IACADGetCatalogCountries *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogCountries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogCountries%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetCatalogCountriesResponse *output = [[IACADGetCatalogCountriesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetCatalogCountriesAsyncIsPost:(BOOL)isPost input: (IACADGetCatalogCountries *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetCatalogCountries;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogCountries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogCountries%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADDonateToCatalogProjectResponse *)DonateToCatalogProjectIsPost:(BOOL)isPost input: (IACADDonateToCatalogProject *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@DonateToCatalogProject", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@DonateToCatalogProject%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADDonateToCatalogProjectResponse *output = [[IACADDonateToCatalogProjectResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)DonateToCatalogProjectAsyncIsPost:(BOOL)isPost input: (IACADDonateToCatalogProject *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallDonateToCatalogProject;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@DonateToCatalogProject", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@DonateToCatalogProject%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADSendMailForgotPasswordResponse *)SendMailForgotPasswordIsPost:(BOOL)isPost input: (IACADSendMailForgotPassword *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@SendMailForgotPassword", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@SendMailForgotPassword%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADSendMailForgotPasswordResponse *output = [[IACADSendMailForgotPasswordResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)SendMailForgotPasswordAsyncIsPost:(BOOL)isPost input: (IACADSendMailForgotPassword *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallSendMailForgotPassword;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@SendMailForgotPassword", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@SendMailForgotPassword%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetProfileResponse *)GetProfileIsPost:(BOOL)isPost input: (IACADGetProfile *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetProfile", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetProfile%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetProfileResponse *output = [[IACADGetProfileResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetProfileAsyncIsPost:(BOOL)isPost input: (IACADGetProfile *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetProfile;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetProfile", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetProfile%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADEditProfileResponse *)EditProfileIsPost:(BOOL)isPost input: (IACADEditProfile *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@EditProfile", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@EditProfile%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADEditProfileResponse *output = [[IACADEditProfileResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)EditProfileAsyncIsPost:(BOOL)isPost input: (IACADEditProfile *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallEditProfile;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@EditProfile", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@EditProfile%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetCatalogPersonCountriesResponse *)GetCatalogPersonCountriesIsPost:(BOOL)isPost input: (IACADGetCatalogPersonCountries *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogPersonCountries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogPersonCountries%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetCatalogPersonCountriesResponse *output = [[IACADGetCatalogPersonCountriesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetCatalogPersonCountriesAsyncIsPost:(BOOL)isPost input: (IACADGetCatalogPersonCountries *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetCatalogPersonCountries;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogPersonCountries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogPersonCountries%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetPersonsByCharityAndDonationTypeResponse *)GetPersonsByCharityAndDonationTypeIsPost:(BOOL)isPost input: (IACADGetPersonsByCharityAndDonationType *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetPersonsByCharityAndDonationType", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetPersonsByCharityAndDonationType%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetPersonsByCharityAndDonationTypeResponse *output = [[IACADGetPersonsByCharityAndDonationTypeResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetPersonsByCharityAndDonationTypeAsyncIsPost:(BOOL)isPost input: (IACADGetPersonsByCharityAndDonationType *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetPersonsByCharityAndDonationType;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetPersonsByCharityAndDonationType", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetPersonsByCharityAndDonationType%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetPersonsByCharityAndDonationTypeAndContriesResponse *)GetPersonsByCharityAndDonationTypeAndContriesIsPost:(BOOL)isPost input: (IACADGetPersonsByCharityAndDonationTypeAndContries *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetPersonsByCharityAndDonationTypeAndContries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetPersonsByCharityAndDonationTypeAndContries%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetPersonsByCharityAndDonationTypeAndContriesResponse *output = [[IACADGetPersonsByCharityAndDonationTypeAndContriesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetPersonsByCharityAndDonationTypeAndContriesAsyncIsPost:(BOOL)isPost input: (IACADGetPersonsByCharityAndDonationTypeAndContries *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetPersonsByCharityAndDonationTypeAndContries;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetPersonsByCharityAndDonationTypeAndContries", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetPersonsByCharityAndDonationTypeAndContries%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetCatalogPersonDetailsResponse *)GetCatalogPersonDetailsIsPost:(BOOL)isPost input: (IACADGetCatalogPersonDetails *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogPersonDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogPersonDetails%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetCatalogPersonDetailsResponse *output = [[IACADGetCatalogPersonDetailsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetCatalogPersonDetailsAsyncIsPost:(BOOL)isPost input: (IACADGetCatalogPersonDetails *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetCatalogPersonDetails;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogPersonDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetCatalogPersonDetails%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADDonateToCatalogPersonResponse *)DonateToCatalogPersonIsPost:(BOOL)isPost input: (IACADDonateToCatalogPerson *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@DonateToCatalogPerson", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@DonateToCatalogPerson%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADDonateToCatalogPersonResponse *output = [[IACADDonateToCatalogPersonResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)DonateToCatalogPersonAsyncIsPost:(BOOL)isPost input: (IACADDonateToCatalogPerson *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallDonateToCatalogPerson;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@DonateToCatalogPerson", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@DonateToCatalogPerson%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetDonorProjectsResponse *)GetDonorProjectsIsPost:(BOOL)isPost input: (IACADGetDonorProjects *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetDonorProjects", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetDonorProjects%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetDonorProjectsResponse *output = [[IACADGetDonorProjectsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetDonorProjectsAsyncIsPost:(BOOL)isPost input: (IACADGetDonorProjects *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetDonorProjects;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetDonorProjects", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetDonorProjects%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetProjectResponse *)GetProjectIsPost:(BOOL)isPost input: (IACADGetProject *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetProject", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetProject%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetProjectResponse *output = [[IACADGetProjectResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetProjectAsyncIsPost:(BOOL)isPost input: (IACADGetProject *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetProject;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetProject", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetProject%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetReliefCharitiesResponse *)GetReliefCharitiesIsPost:(BOOL)isPost input: (IACADGetReliefCharities *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetReliefCharities", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetReliefCharities%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetReliefCharitiesResponse *output = [[IACADGetReliefCharitiesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetReliefCharitiesAsyncIsPost:(BOOL)isPost input: (IACADGetReliefCharities *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetReliefCharities;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetReliefCharities", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetReliefCharities%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetReliefDisasterForCharityResponse *)GetReliefDisasterForCharityIsPost:(BOOL)isPost input: (IACADGetReliefDisasterForCharity *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetReliefDisasterForCharity", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetReliefDisasterForCharity%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetReliefDisasterForCharityResponse *output = [[IACADGetReliefDisasterForCharityResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetReliefDisasterForCharityAsyncIsPost:(BOOL)isPost input: (IACADGetReliefDisasterForCharity *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetReliefDisasterForCharity;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetReliefDisasterForCharity", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetReliefDisasterForCharity%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADGetReliefNeedForDisasterResponse *)GetReliefNeedForDisasterIsPost:(BOOL)isPost input: (IACADGetReliefNeedForDisaster *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetReliefNeedForDisaster", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetReliefNeedForDisaster%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADGetReliefNeedForDisasterResponse *output = [[IACADGetReliefNeedForDisasterResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetReliefNeedForDisasterAsyncIsPost:(BOOL)isPost input: (IACADGetReliefNeedForDisaster *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallGetReliefNeedForDisaster;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetReliefNeedForDisaster", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetReliefNeedForDisaster%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADAddReliefDonationResponse *)AddReliefDonationIsPost:(BOOL)isPost input: (IACADAddReliefDonation *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@AddReliefDonation", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@AddReliefDonation%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADAddReliefDonationResponse *output = [[IACADAddReliefDonationResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)AddReliefDonationAsyncIsPost:(BOOL)isPost input: (IACADAddReliefDonation *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallAddReliefDonation;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@AddReliefDonation", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@AddReliefDonation%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (IACADListSecretQuestionsResponse *)ListSecretQuestionsIsPost:(BOOL)isPost input: (IACADListSecretQuestions *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@ListSecretQuestions", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@ListSecretQuestions%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	IACADListSecretQuestionsResponse *output = [[IACADListSecretQuestionsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)ListSecretQuestionsAsyncIsPost:(BOOL)isPost input: (IACADListSecretQuestions *)input caller:(id<IACADServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = IACADMethodCallListSecretQuestions;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@ListSecretQuestions", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@ListSecretQuestions%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

@end

