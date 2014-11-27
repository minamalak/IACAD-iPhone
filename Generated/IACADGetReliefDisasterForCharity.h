


#import <Foundation/Foundation.h>




@interface IACADGetReliefDisasterForCharity : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic, retain) NSNumber* charityId;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end