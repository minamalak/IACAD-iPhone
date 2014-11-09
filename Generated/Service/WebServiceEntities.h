


#import <Foundation/Foundation.h>



@interface WebServiceEntities : NSObject {

}

+ (NSDate *)deserializeJsonDateString: (NSString *)jsonDateString;
+ (NSTimeInterval)deserializeJsonDurationString: (NSString *)jsonDurationString;
+ (NSString *)serializeToJsonDateString: (NSDate *)date;

@end
              




