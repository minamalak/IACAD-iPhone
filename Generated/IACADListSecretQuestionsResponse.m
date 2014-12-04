


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADListSecretQuestionsResponse.h"


@implementation IACADListSecretQuestionsResponse

@synthesize ListSecretQuestionsResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		ListSecretQuestionsResult = [[NSMutableArray alloc] init];
		NSObject *ListSecretQuestionsResultArrRef = nil;
			ListSecretQuestionsResultArrRef = [dictionary objectForKey:@"ListSecretQuestionsResult"];

		if([ListSecretQuestionsResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* ListSecretQuestionsResultArr = (NSArray *)ListSecretQuestionsResultArrRef;
			for(NSString* childObj in ListSecretQuestionsResultArr) {
				[ListSecretQuestionsResult addObject:childObj];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(NSString* childObj in ListSecretQuestionsResult) {
		[arr addObject:childObj];
	}
	[dictionary setValue:arr forKey:@"ListSecretQuestionsResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end