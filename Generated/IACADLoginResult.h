


#import <Foundation/Foundation.h>

@class IACADUser;


@interface IACADLoginResult : NSObject {
}

@property (nonatomic, retain) NSString* FailureMessage;
@property (nonatomic) BOOL LoginStatus;
@property (nonatomic, retain) IACADUser* User;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
