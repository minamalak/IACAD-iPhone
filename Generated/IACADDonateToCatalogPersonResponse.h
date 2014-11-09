


#import <Foundation/Foundation.h>


@class IACADDonateCatalogResult;


@interface IACADDonateToCatalogPersonResponse : NSObject {
}

@property (nonatomic, retain) IACADDonateCatalogResult* DonateToCatalogPersonResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end