


#import <Foundation/Foundation.h>


@class IACADCatalogDonationItem;


@interface IACADGetDonationItemDetailsResponse : NSObject {
}

@property (nonatomic, retain) IACADCatalogDonationItem* GetDonationItemDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end