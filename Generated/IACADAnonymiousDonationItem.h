


#import <Foundation/Foundation.h>



@interface IACADAnonymiousDonationItem : NSObject {
}

@property (nonatomic) double Amount;
@property (nonatomic) int DonationTypeID;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
