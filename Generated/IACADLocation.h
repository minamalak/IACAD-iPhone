


#import <Foundation/Foundation.h>



@interface IACADLocation : NSObject {
}

@property (nonatomic) double Latitude;
@property (nonatomic) double Longitude;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
