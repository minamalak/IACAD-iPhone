


#import <Foundation/Foundation.h>


#import "IACADMobileContentType.h"


@interface IACADGetMobileContent : NSObject {
}

@property (nonatomic) IACADMobileContentType type;
@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end