


#import <Foundation/Foundation.h>




@interface IACADSendMailForgotPassword : NSObject {
}

@property (nonatomic, retain) NSString* UserName;
@property (nonatomic, retain) NSString* language;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end