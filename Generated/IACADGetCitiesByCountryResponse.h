


#import <Foundation/Foundation.h>


@class IACADCity;


@interface IACADGetCitiesByCountryResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetCitiesByCountryResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end