


#import <Foundation/Foundation.h>




@interface IACADListSecretQuestionsResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* ListSecretQuestionsResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end