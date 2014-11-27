


#import <Foundation/Foundation.h>




@interface IACADGetDonorProjects : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic, retain) NSNumber* pageIndex;
@property (nonatomic, retain) NSNumber* pageSize;
@property (nonatomic, retain) NSString* donorID;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end