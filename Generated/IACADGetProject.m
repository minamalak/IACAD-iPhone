


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADGetProject.h"


@implementation IACADGetProject

@synthesize culture;
@synthesize projectID;
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
		NSObject *projectIDRef = [dictionary objectForKey:@"projectID"];
		if([projectIDRef isKindOfClass:[NSNull class]]) {  
			self.projectID = nil;
		}
		else {
			self.projectID = [dictionary objectForKey: @"projectID"];
		}
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
	[dictionary setValue:self.projectID forKey:@"projectID"];
	[dictionary setValue:self.donorID forKey:@"donorID"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?culture=%@&projectID=%@&donorID=%@&", self.culture, self.projectID, self.donorID];
}

@end