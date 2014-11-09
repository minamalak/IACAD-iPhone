


#import <Foundation/Foundation.h>


@class IACADCharity;


@interface IACADGetCharityDetailsResponse : NSObject {
}

@property (nonatomic, retain) IACADCharity* GetCharityDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end