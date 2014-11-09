


#import <Foundation/Foundation.h>


@class IACADCharity;


@interface IACADGetCharitiesByDonationTypeResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetCharitiesByDonationTypeResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end