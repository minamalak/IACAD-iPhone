


#import <Foundation/Foundation.h>



@interface IACADProjectsData : NSObject {
}

@property (nonatomic, retain) NSString* Area;
@property (nonatomic, retain) NSString* CountryName;
@property (nonatomic, retain) NSString* CharityName;
@property (nonatomic, retain) NSString* ContractDateString;
@property (nonatomic, retain) NSString* Description;
@property (nonatomic, retain) NSNumber* Id;
@property (nonatomic, retain) NSString* InitialDuration;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* PercentCompleted;
@property (nonatomic, retain) NSString* TotalCost;
@property (nonatomic, retain) NSString* Type;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
