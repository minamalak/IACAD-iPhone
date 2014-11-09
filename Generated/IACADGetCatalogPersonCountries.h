


#import <Foundation/Foundation.h>




@interface IACADGetCatalogPersonCountries : NSObject {
}

@property (nonatomic) int donationTypeId;
@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end