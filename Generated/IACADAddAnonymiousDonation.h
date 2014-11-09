


#import <Foundation/Foundation.h>


@class IACADAnonymiousDonationItem;


@interface IACADAddAnonymiousDonation : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic) int charityId;
@property (nonatomic, retain) NSMutableArray* items;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end 