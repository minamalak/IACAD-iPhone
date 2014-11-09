


#import <Foundation/Foundation.h>




@interface IACADGetDonationItemsByCharityAndDonationType : NSObject {
}

@property (nonatomic) int charityId;
@property (nonatomic) int donationTypeId;
@property (nonatomic) int countryId;
@property (nonatomic, retain) NSString* culture;
@property (nonatomic) int pageIndex;
@property (nonatomic) int pageSize;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end