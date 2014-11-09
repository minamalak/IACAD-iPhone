


#import <Foundation/Foundation.h>


@class IACADCatalogPersonDetail;


@interface IACADGetCatalogPersonDetailsResponse : NSObject {
}

@property (nonatomic, retain) IACADCatalogPersonDetail* GetCatalogPersonDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end