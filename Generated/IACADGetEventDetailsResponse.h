


#import <Foundation/Foundation.h>


@class IACADIACADEvent;


@interface IACADGetEventDetailsResponse : NSObject {
}

@property (nonatomic, retain) IACADIACADEvent* GetEventDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end