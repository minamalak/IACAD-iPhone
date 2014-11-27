


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "IACADReliefCharityDisasterOnSite.h"
	#import "IACADGetReliefDisasterForCharityResponse.h"


@implementation IACADGetReliefDisasterForCharityResponse

@synthesize GetReliefDisasterForCharityResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetReliefDisasterForCharityResult = [[NSMutableArray alloc] init];
		NSObject *GetReliefDisasterForCharityResultArrRef = nil;
			GetReliefDisasterForCharityResultArrRef = [dictionary objectForKey:@"GetReliefDisasterForCharityResult"];

		if([GetReliefDisasterForCharityResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetReliefDisasterForCharityResultArr = (NSArray *)GetReliefDisasterForCharityResultArrRef;
			for(NSDictionary * childObj in GetReliefDisasterForCharityResultArr) {
				[GetReliefDisasterForCharityResult addObject:[[IACADReliefCharityDisasterOnSite alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADReliefCharityDisasterOnSite* childObj in GetReliefDisasterForCharityResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetReliefDisasterForCharityResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end