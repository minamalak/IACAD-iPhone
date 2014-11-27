


#import <Foundation/Foundation.h>


	@class IACADDonorProjectsData;
	

@interface IACADGetDonorProjectsResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetDonorProjectsResult;
@property (nonatomic, retain) NSNumber* count;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end