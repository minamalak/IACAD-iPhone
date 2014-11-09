


#import <Foundation/Foundation.h>


@class IACADCountry;


@interface IACADGetCatalogCountriesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetCatalogCountriesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end