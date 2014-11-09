


#import <Foundation/Foundation.h>


@class IACADDonateCatalogResult;


@interface IACADDonateToCatalogProjectResponse : NSObject {
}

@property (nonatomic, retain) IACADDonateCatalogResult* DonateToCatalogProjectResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end