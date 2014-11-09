


#import <Foundation/Foundation.h>


@class IACADCountry;


@interface IACADGetCountriesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetCountriesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end