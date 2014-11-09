


#import <Foundation/Foundation.h>
#import "IACADGetEvents.h"


@implementation IACADGetEvents

@synthesize culture;
@synthesize pageIndex;
@synthesize pageSize;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
		self.pageIndex = [[dictionary objectForKey: @"pageIndex"] intValue];
		self.pageSize = [[dictionary objectForKey: @"pageSize"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:[NSNumber numberWithInt: self.pageIndex] forKey:@"pageIndex"];
	[dictionary setValue:[NSNumber numberWithInt: self.pageSize] forKey:@"pageSize"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&pageIndex=%d&pageSize=%d&", self.culture, self.pageIndex, self.pageSize];
}

@end