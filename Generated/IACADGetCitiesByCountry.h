


#import <Foundation/Foundation.h>




@interface IACADGetCitiesByCountry : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic) int countryId;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end