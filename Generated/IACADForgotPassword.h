


#import <Foundation/Foundation.h>



@interface IACADForgotPassword : NSObject {
}

@property (nonatomic, retain) NSString* FailureMessage;
@property (nonatomic) BOOL Success;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
