


#import <Foundation/Foundation.h>




@interface IACADGetReliefNeedForDisaster : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic, retain) NSNumber* disasterId;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end