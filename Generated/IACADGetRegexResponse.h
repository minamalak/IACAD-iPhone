


#import <Foundation/Foundation.h>




@interface IACADGetRegexResponse : NSObject {
}

@property (nonatomic, retain) NSString* GetRegexResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end