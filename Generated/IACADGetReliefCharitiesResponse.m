


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "IACADCharity.h"
	#import "IACADGetReliefCharitiesResponse.h"


@implementation IACADGetReliefCharitiesResponse

@synthesize GetReliefCharitiesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetReliefCharitiesResult = [[NSMutableArray alloc] init];
		NSObject *GetReliefCharitiesResultArrRef = nil;
			GetReliefCharitiesResultArrRef = [dictionary objectForKey:@"GetReliefCharitiesResult"];

		if([GetReliefCharitiesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetReliefCharitiesResultArr = (NSArray *)GetReliefCharitiesResultArrRef;
			for(NSDictionary * childObj in GetReliefCharitiesResultArr) {
				[GetReliefCharitiesResult addObject:[[IACADCharity alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCharity* childObj in GetReliefCharitiesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetReliefCharitiesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end