


#import <Foundation/Foundation.h>



@interface IACADReliefCharityDisasterOnSite : NSObject {
}

@property (nonatomic, retain) NSNumber* CharityId;
@property (nonatomic, retain) NSString* CharityName;
@property (nonatomic, retain) NSNumber* DisasterId;
@property (nonatomic, retain) NSString* DisasterName;
@property (nonatomic, retain) NSDate* DonationExpirationDate;
@property (nonatomic, retain) NSNumber* Id;
@property (nonatomic, retain) NSNumber* ShowOnSite;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
