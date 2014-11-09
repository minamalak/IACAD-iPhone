


#import <Foundation/Foundation.h>




@interface IACADGetCharityDetails : NSObject {
}

@property (nonatomic) int id;
@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end