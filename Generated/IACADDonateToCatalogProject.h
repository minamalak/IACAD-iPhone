


#import <Foundation/Foundation.h>




@interface IACADDonateToCatalogProject : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic) int charityId;
@property (nonatomic, retain) NSString* donorId;
@property (nonatomic) int externalEntityDonationItemsAssociationPerCharityId;
@property (nonatomic, retain) NSString* projectName;
@property (nonatomic, retain) NSString* projectNotes;
@property (nonatomic) int noOfItems;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end