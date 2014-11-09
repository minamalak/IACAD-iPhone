


#import <Foundation/Foundation.h>




@interface IACADDonateToCatalogPerson : NSObject {
}

@property (nonatomic, retain) NSString* culture;
@property (nonatomic) int charityId;
@property (nonatomic, retain) NSString* donorId;
@property (nonatomic) int64_t personId;
@property (nonatomic) double monthlyCost;
@property (nonatomic) int noOfMonths;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end