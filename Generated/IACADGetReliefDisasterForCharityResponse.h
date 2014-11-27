


#import <Foundation/Foundation.h>


	@class IACADReliefCharityDisasterOnSite;
	

@interface IACADGetReliefDisasterForCharityResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetReliefDisasterForCharityResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end