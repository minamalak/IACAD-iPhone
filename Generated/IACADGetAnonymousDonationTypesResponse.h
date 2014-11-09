


#import <Foundation/Foundation.h>


@class IACADGeneralDonationType;


@interface IACADGetAnonymousDonationTypesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetAnonymousDonationTypesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end