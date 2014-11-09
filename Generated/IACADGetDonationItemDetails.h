


#import <Foundation/Foundation.h>




@interface IACADGetDonationItemDetails : NSObject {
}

@property (nonatomic) int entityDonationItemsAssociationPerCharityId;
@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end