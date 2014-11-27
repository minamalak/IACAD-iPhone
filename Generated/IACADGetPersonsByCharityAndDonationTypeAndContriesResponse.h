


#import <Foundation/Foundation.h>


	@class IACADCatalogPerson;
	

@interface IACADGetPersonsByCharityAndDonationTypeAndContriesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetPersonsByCharityAndDonationTypeAndContriesResult;
@property (nonatomic, retain) NSNumber* count;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end