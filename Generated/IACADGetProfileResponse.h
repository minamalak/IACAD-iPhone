


#import <Foundation/Foundation.h>


@class IACADUser;


@interface IACADGetProfileResponse : NSObject {
}

@property (nonatomic, retain) IACADUser* GetProfileResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end