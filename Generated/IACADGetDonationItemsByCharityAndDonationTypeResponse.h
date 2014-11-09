


#import <Foundation/Foundation.h>


@class IACADCatalogDonationItem;


@interface IACADGetDonationItemsByCharityAndDonationTypeResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetDonationItemsByCharityAndDonationTypeResult;
@property (nonatomic) int count;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end