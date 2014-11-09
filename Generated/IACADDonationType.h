


#import <Foundation/Foundation.h>



@interface IACADDonationType : NSObject {
}

@property (nonatomic, retain) NSString* BriefName;
@property (nonatomic) int CategoryId;
@property (nonatomic) int DepartmentId;
@property (nonatomic) int DepartmentModuleId;
@property (nonatomic, retain) NSString* Descrioption;
@property (nonatomic, retain) NSString* DescrioptionAr;
@property (nonatomic, retain) NSString* DescrioptionEn;
@property (nonatomic) int Id;
@property (nonatomic, retain) NSString* Image1ID;
@property (nonatomic, retain) NSString* Image2ID;
@property (nonatomic) BOOL IsActive;
@property (nonatomic) BOOL IsQuantitative;
@property (nonatomic) BOOL IsSystemType;
@property (nonatomic) int MaxInterestPercentage;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* NameAr;
@property (nonatomic, retain) NSString* NameEn;
@property (nonatomic) BOOL ShowInMobile;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
