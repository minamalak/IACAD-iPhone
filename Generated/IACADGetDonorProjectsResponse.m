


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "IACADDonorProjectsData.h"
	#import "IACADGetDonorProjectsResponse.h"


@implementation IACADGetDonorProjectsResponse

@synthesize GetDonorProjectsResult;
@synthesize count;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetDonorProjectsResult = [[NSMutableArray alloc] init];
		NSObject *GetDonorProjectsResultArrRef = nil;
			GetDonorProjectsResultArrRef = [dictionary objectForKey:@"GetDonorProjectsResult"];

		if([GetDonorProjectsResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetDonorProjectsResultArr = (NSArray *)GetDonorProjectsResultArrRef;
			for(NSDictionary * childObj in GetDonorProjectsResultArr) {
				[GetDonorProjectsResult addObject:[[IACADDonorProjectsData alloc] initWithData:childObj]];
			}
		}
		self.count = [dictionary objectForKey: @"count"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADDonorProjectsData* childObj in GetDonorProjectsResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetDonorProjectsResult"];
	[dictionary setValue:self.count forKey:@"count"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?count=%@&", self.count];
}

@end