


#import <Foundation/Foundation.h>

@class IACADLocation;


@interface IACADIACADEvent : NSObject {
}

@property (nonatomic, retain) NSString* Description;
@property (nonatomic, retain) NSDate* EndDate;
@property (nonatomic, retain) IACADLocation* EventLocation;
@property (nonatomic) int Id;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSDate* StartDate;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
