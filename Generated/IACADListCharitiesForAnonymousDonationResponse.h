


#import <Foundation/Foundation.h>


@class IACADCharity;


@interface IACADListCharitiesForAnonymousDonationResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* ListCharitiesForAnonymousDonationResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end