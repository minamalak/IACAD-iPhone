


#import <Foundation/Foundation.h>
#import "IACADCharity.h"
#import "IACADListCharitiesForAnonymousDonationResponse.h"


@implementation IACADListCharitiesForAnonymousDonationResponse

@synthesize ListCharitiesForAnonymousDonationResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		ListCharitiesForAnonymousDonationResult = [[NSMutableArray alloc] init];
		NSObject *ListCharitiesForAnonymousDonationResultArrRef = [dictionary objectForKey:@"ListCharitiesForAnonymousDonationResult"];
		if([ListCharitiesForAnonymousDonationResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* ListCharitiesForAnonymousDonationResultArr = (NSArray *)ListCharitiesForAnonymousDonationResultArrRef;
			for(NSDictionary* childObj in ListCharitiesForAnonymousDonationResultArr) {
				[ListCharitiesForAnonymousDonationResult addObject:[[IACADCharity alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(IACADCharity* childObj in ListCharitiesForAnonymousDonationResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"ListCharitiesForAnonymousDonationResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end