


#import <Foundation/Foundation.h>




@interface IACADGetCharityNameResponse : NSObject {
}

@property (nonatomic, retain) NSString* GetCharityNameResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end