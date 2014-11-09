


#import <Foundation/Foundation.h>



@interface IACADDonateCatalogResult : NSObject {
}

@property (nonatomic, retain) NSString* ErrorMessage;
@property (nonatomic) BOOL IsValid;
@property (nonatomic, retain) NSString* RedirectUrl;
@property (nonatomic) int64_t RemainingStock;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
