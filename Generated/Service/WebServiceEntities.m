


#import "WebServiceEntities.h"

@implementation WebServiceEntities

+ (NSDate *)deserializeJsonDateString: (NSString *)jsonDateString {
//    NSInteger offset = [[NSTimeZone defaultTimeZone] secondsFromGMT]; //get number of seconds to add or subtract according to the client default time zone 
    NSInteger startPosition = [jsonDateString rangeOfString:@"("].location + 1; //start of the date value
    NSTimeInterval unixTime = [[jsonDateString substringWithRange:NSMakeRange(startPosition, 13)] longLongValue] / 1000; //WCF will send 13 digit-long value for the time interval since 1970 (millisecond precision) whereas iOS works with 10 digit-long values (second precision), hence the divide by 1000
    
    
//    NSInteger serverOffset = 0;
//    NSString *timezoneSign = [jsonDateString substringWithRange:NSMakeRange(startPosition + 13, 1)];
//    if([timezoneSign isEqualToString:@"+"]) {
//        NSInteger serverOffsetHours = [[jsonDateString substringWithRange:NSMakeRange(startPosition + 14, 2)] intValue];
//        NSInteger serverOffsetMinutes = [[jsonDateString substringWithRange:NSMakeRange(startPosition + 16, 2)] intValue];
//        serverOffset -= (serverOffsetHours * 60 * 60);
//        serverOffset -= (serverOffsetMinutes * 60);
//    }
//    else if([timezoneSign isEqualToString:@"-"]) {
//        
//        NSInteger serverOffsetHours = [[jsonDateString substringWithRange:NSMakeRange(startPosition + 14, 2)] intValue];
//        NSInteger serverOffsetMinutes = [[jsonDateString substringWithRange:NSMakeRange(startPosition + 16, 2)] intValue];
//        serverOffset += (serverOffsetHours * 60 * 60);
//        serverOffset += (serverOffsetMinutes * 60);
//    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:unixTime];
    NSLog(@"%f", unixTime);
    NSLog(@"%@", date);
//                    dateByAddingTimeInterval:offset];
//                    dateByAddingTimeInterval:serverOffset];
    return date;
}

+ (NSTimeInterval)deserializeJsonDurationString: (NSString *)jsonDurationString {
	NSArray *chunks = [jsonDurationString componentsSeparatedByString: @":"];
	double hours = [[chunks objectAtIndex: 0] doubleValue] * 3600;
	double minutes = [[chunks objectAtIndex: 1] doubleValue] * 60;
	double seconds = [[chunks objectAtIndex: 2] doubleValue];
	NSTimeInterval interval = hours + minutes + seconds;
    return interval;
}

+ (NSString *)serializeToJsonDateString: (NSDate *)date {
	int timeInt = [date timeIntervalSince1970];
	return [NSString stringWithFormat: @"/Date(%d)/", timeInt];
}

@end




