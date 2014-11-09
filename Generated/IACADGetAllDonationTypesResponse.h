


#import <Foundation/Foundation.h>


@class IACADDonationType;


@interface IACADGetAllDonationTypesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetAllDonationTypesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end