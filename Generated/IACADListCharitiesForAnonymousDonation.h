


#import <Foundation/Foundation.h>




@interface IACADListCharitiesForAnonymousDonation : NSObject {
}

@property (nonatomic, retain) NSString* culture;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end