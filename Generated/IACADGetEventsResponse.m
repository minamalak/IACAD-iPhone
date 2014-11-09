


#import <Foundation/Foundation.h>
#import "IACADIACADEvent.h"
#import "IACADGetEventsResponse.h"


@implementation IACADGetEventsResponse

@synthesize GetEventsResult;
@synthesize count;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetEventsResult = [[NSMutableArray alloc] init];
		NSObject *GetEventsResultArrRef = [dictionary objectForKey:@"GetEventsResult"];
		if([GetEventsResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetEventsResultArr = (NSArray *)GetEventsResultArrRef;
			for(NSDictionary* childObj in GetEventsResultArr) {
				[GetEventsResult addObject:[[IACADIACADEvent alloc] initWithData:childObj]];
			}
		}
		self.count = [[dictionary objectForKey: @"count"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADIACADEvent* childObj in GetEventsResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetEventsResult"];
	[dictionary setValue:[NSNumber numberWithInt: self.count] forKey:@"count"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?count=%d&", self.count];
}

@end