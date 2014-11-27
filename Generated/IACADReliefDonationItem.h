


#import <Foundation/Foundation.h>



@interface IACADReliefDonationItem : NSObject {
}

@property (nonatomic, retain) NSNumber* Amount;
@property (nonatomic, retain) NSNumber* ReliefNeedId;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
