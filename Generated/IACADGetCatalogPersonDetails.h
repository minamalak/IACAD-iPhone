


#import <Foundation/Foundation.h>




@interface IACADGetCatalogPersonDetails : NSObject {
}

@property (nonatomic) int charityId;
@property (nonatomic) int64_t personId;
@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end