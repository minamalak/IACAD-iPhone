


#import <Foundation/Foundation.h>


@class IACADCharity;


@interface IACADListCharitiesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* ListCharitiesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end