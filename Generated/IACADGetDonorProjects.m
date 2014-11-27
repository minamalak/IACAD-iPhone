


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADGetDonorProjects.h"


@implementation IACADGetDonorProjects

@synthesize culture;
@synthesize pageIndex;
@synthesize pageSize;
@synthesize donorID;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {  
			self.culture = nil;
		}
		else {
			self.culture = [dictionary objectForKey: @"culture"];
		}
		self.pageIndex = [dictionary objectForKey: @"pageIndex"];
		self.pageSize = [dictionary objectForKey: @"pageSize"];
		NSObject *donorIDRef = [dictionary objectForKey:@"donorID"];
		if([donorIDRef isKindOfClass:[NSNull class]]) {  
			self.donorID = nil;
		}
		else {
			self.donorID = [dictionary objectForKey: @"donorID"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.culture forKey:@"culture"];
	[dictionary setValue:self.pageIndex forKey:@"pageIndex"];
	[dictionary setValue:self.pageSize forKey:@"pageSize"];
	[dictionary setValue:self.donorID forKey:@"donorID"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&pageIndex=%@&pageSize=%@&donorID=%@&", self.culture, self.pageIndex, self.pageSize, self.donorID];
}

@end