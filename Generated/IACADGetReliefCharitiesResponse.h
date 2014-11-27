


#import <Foundation/Foundation.h>


	@class IACADCharity;
	

@interface IACADGetReliefCharitiesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetReliefCharitiesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end