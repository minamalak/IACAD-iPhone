


#import <Foundation/Foundation.h>


@class IACADIACADEvent;


@interface IACADGetEventsResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetEventsResult;
@property (nonatomic) int count;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end