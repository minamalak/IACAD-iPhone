


#import <Foundation/Foundation.h>




@interface IACADGetProfile : NSObject {
}

@property (nonatomic, retain) NSString* username;
@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end