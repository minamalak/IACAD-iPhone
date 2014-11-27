


#import <Foundation/Foundation.h>


	@class IACADCatalogDonationItem;
	

@interface IACADGetDonationItemsByCharityAndDonationTypeAndContriesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetDonationItemsByCharityAndDonationTypeAndContriesResult;
@property (nonatomic, retain) NSNumber* count;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end