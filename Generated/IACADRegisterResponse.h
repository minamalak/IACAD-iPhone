


#import <Foundation/Foundation.h>


@class IACADRegisterResult;


@interface IACADRegisterResponse : NSObject {
}

@property (nonatomic, retain) IACADRegisterResult* RegisterResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end