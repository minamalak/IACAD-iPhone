


#import <Foundation/Foundation.h>

@class IACADUser;


@interface IACADRegisterResult : NSObject {
}

@property (nonatomic, retain) NSString* FailureMessage;
@property (nonatomic) BOOL RegisterStatus;
@property (nonatomic, retain) IACADUser* User;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
