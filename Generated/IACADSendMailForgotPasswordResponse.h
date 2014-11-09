


#import <Foundation/Foundation.h>


@class IACADForgotPassword;


@interface IACADSendMailForgotPasswordResponse : NSObject {
}

@property (nonatomic, retain) IACADForgotPassword* SendMailForgotPasswordResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end