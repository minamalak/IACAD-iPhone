


#import <Foundation/Foundation.h>


@class IACADCatalogPerson;


@interface IACADGetPersonsByCharityAndDonationTypeResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetPersonsByCharityAndDonationTypeResult;
@property (nonatomic) int count;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end