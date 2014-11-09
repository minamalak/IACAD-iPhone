


#import <Foundation/Foundation.h>




@interface IACADGetEvents : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic) int pageIndex;
@property (nonatomic) int pageSize;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end