


#import <Foundation/Foundation.h>




@interface IACADGetPersonsByCharityAndDonationTypeAndContries : NSObject {
}

@property (nonatomic, retain) NSNumber* charityId;
@property (nonatomic, retain) NSNumber* donationTypeId;
@property (nonatomic, retain) NSMutableArray* countryId;
@property (nonatomic, retain) NSString* culture;
@property (nonatomic, retain) NSNumber* pageIndex;
@property (nonatomic, retain) NSNumber* pageSize;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end