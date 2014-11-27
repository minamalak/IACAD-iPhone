


#import <Foundation/Foundation.h>


	@class IACADReliefDonationItem;
	

@interface IACADAddReliefDonation : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic, retain) NSNumber* charityId;
@property (nonatomic, retain) NSMutableArray* items;
@property (nonatomic, retain) NSNumber* disasterId;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end