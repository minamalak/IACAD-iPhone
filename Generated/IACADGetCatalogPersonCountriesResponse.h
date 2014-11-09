


#import <Foundation/Foundation.h>


@class IACADCountry;


@interface IACADGetCatalogPersonCountriesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetCatalogPersonCountriesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end