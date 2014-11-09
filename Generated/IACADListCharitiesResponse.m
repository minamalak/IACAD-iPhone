


#import <Foundation/Foundation.h>
#import "IACADCharity.h"
#import "IACADListCharitiesResponse.h"


@implementation IACADListCharitiesResponse

@synthesize ListCharitiesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		ListCharitiesResult = [[NSMutableArray alloc] init];
		NSObject *ListCharitiesResultArrRef = [dictionary objectForKey:@"ListCharitiesResult"];
		if([ListCharitiesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* ListCharitiesResultArr = (NSArray *)ListCharitiesResultArrRef;
			for(NSDictionary* childObj in ListCharitiesResultArr) {
				[ListCharitiesResult addObject:[[IACADCharity alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCharity* childObj in ListCharitiesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"ListCharitiesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end