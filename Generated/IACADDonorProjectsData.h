


#import <Foundation/Foundation.h>



@interface IACADDonorProjectsData : NSObject {
}

@property (nonatomic, retain) NSString* CharityName;
@property (nonatomic, retain) NSString* CountryName;
@property (nonatomic, retain) NSString* DonorId;
@property (nonatomic, retain) NSNumber* Id;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* ProjectID;
@property (nonatomic, retain) NSString* TotalCostString;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
