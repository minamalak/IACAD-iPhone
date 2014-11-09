


#import <Foundation/Foundation.h>


@class IACADLoginResult;


@interface IACADLoginResponse : NSObject {
}

@property (nonatomic, retain) IACADLoginResult* LoginResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end