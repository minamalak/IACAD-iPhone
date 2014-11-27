


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "IACADReliefNeeds.h"
	#import "IACADGetReliefNeedForDisasterResponse.h"


@implementation IACADGetReliefNeedForDisasterResponse

@synthesize GetReliefNeedForDisasterResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetReliefNeedForDisasterResult = [[NSMutableArray alloc] init];
		NSObject *GetReliefNeedForDisasterResultArrRef = nil;
			GetReliefNeedForDisasterResultArrRef = [dictionary objectForKey:@"GetReliefNeedForDisasterResult"];

		if([GetReliefNeedForDisasterResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetReliefNeedForDisasterResultArr = (NSArray *)GetReliefNeedForDisasterResultArrRef;
			for(NSDictionary * childObj in GetReliefNeedForDisasterResultArr) {
				[GetReliefNeedForDisasterResult addObject:[[IACADReliefNeeds alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADReliefNeeds* childObj in GetReliefNeedForDisasterResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetReliefNeedForDisasterResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end