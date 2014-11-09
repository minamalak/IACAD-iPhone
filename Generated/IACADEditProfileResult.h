


#import <Foundation/Foundation.h>

@class IACADUser;


@interface IACADEditProfileResult : NSObject {
}

@property (nonatomic) BOOL EditProfileStatus;
@property (nonatomic, retain) NSString* FailureMessage;
@property (nonatomic, retain) IACADUser* User;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
