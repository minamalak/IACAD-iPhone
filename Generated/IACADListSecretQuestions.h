


#import <Foundation/Foundation.h>




@interface IACADListSecretQuestions : NSObject {
}

@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end