


#import <Foundation/Foundation.h>


@class IACADEditProfileResult;


@interface IACADEditProfileResponse : NSObject {
}

@property (nonatomic, retain) IACADEditProfileResult* EditProfileResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end