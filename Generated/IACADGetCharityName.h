


#import <Foundation/Foundation.h>




@interface IACADGetCharityName : NSObject {
}

@property (nonatomic) int charityId;
@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end