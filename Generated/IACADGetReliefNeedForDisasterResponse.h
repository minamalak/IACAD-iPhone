


#import <Foundation/Foundation.h>


	@class IACADReliefNeeds;
	

@interface IACADGetReliefNeedForDisasterResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetReliefNeedForDisasterResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end