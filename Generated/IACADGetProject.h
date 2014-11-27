


#import <Foundation/Foundation.h>




@interface IACADGetProject : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic, retain) NSString* projectID;
@property (nonatomic, retain) NSString* donorID;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end