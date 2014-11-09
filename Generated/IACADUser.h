


#import <Foundation/Foundation.h>



@interface IACADUser : NSObject {
}

@property (nonatomic) int CityId;
@property (nonatomic, retain) NSString* CityName;
@property (nonatomic) int CountryId;
@property (nonatomic, retain) NSString* CountryName;
@property (nonatomic, retain) NSString* Email;
@property (nonatomic, retain) NSString* FirstName;
@property (nonatomic, retain) NSString* Id;
@property (nonatomic, retain) NSString* LastName;
@property (nonatomic, retain) NSString* Mobile;
@property (nonatomic, retain) NSString* PasswordQuestion;
@property (nonatomic, retain) NSString* UserName;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
