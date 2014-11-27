


#import <Foundation/Foundation.h>


	@class IACADProjectsData;
	

@interface IACADGetProjectResponse : NSObject {
}

@property (nonatomic, retain) IACADProjectsData* GetProjectResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end