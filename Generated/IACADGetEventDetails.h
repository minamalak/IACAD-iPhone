


#import <Foundation/Foundation.h>




@interface IACADGetEventDetails : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic) int eventId;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end