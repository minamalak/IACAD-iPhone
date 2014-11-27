


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "IACADProjectsData.h"
	#import "IACADGetProjectResponse.h"


@implementation IACADGetProjectResponse

@synthesize GetProjectResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *GetProjectResultRef = [dictionary objectForKey:@"GetProjectResult"];
		if([GetProjectResultRef isKindOfClass:[NSNull class]]) {  
			self.GetProjectResult = nil;
		}
		else {
			self.GetProjectResult = [[IACADProjectsData alloc] initWithData:[dictionary objectForKey: @"GetProjectResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.GetProjectResult JSONDictionary] forKey:@"GetProjectResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end