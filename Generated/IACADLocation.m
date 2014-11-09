


#import <Foundation/Foundation.h>
#import "IACADLocation.h"

@implementation IACADLocation
@synthesize Latitude;
@synthesize Longitude;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.Latitude = [[dictionary objectForKey: @"Latitude"] doubleValue];
		self.Longitude = [[dictionary objectForKey: @"Longitude"] doubleValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithDouble: self.Latitude] forKey:@"Latitude"];
	[dictionary setValue:[NSNumber numberWithDouble: self.Longitude] forKey:@"Longitude"];
	return dictionary;
}

@end
