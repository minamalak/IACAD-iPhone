


#import <Foundation/Foundation.h>



@interface IACADCity : NSObject {
}

@property (nonatomic) int CountryID;
@property (nonatomic, retain) NSString* CountryName;
@property (nonatomic) int ID;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* NameAr;
@property (nonatomic, retain) NSString* NameEn;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
