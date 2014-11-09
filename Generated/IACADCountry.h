


#import <Foundation/Foundation.h>



@interface IACADCountry : NSObject {
}

@property (nonatomic) int Id;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* NameAr;
@property (nonatomic, retain) NSString* NameEn;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
