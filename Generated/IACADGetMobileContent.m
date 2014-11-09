


#import <Foundation/Foundation.h>
#import "IACADMobileContentType.h"
#import "IACADGetMobileContent.h"


@implementation IACADGetMobileContent

@synthesize type;
@synthesize culture;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.type = (IACADMobileContentType)[[dictionary objectForKey:@"type"] intValue];
						
		NSObject *cultureRef = [dictionary objectForKey:@"culture"];
		if([cultureRef isKindOfClass:[NSNull class]]) {
			self.culture = nil;
		}
		else {
			self.culture = [[dictionary objectForKey: @"culture"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt:(int)self.type] forKey:@"type"];
	[dictionary setValue:self.culture forKey:@"culture"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?type=%d&culture=%@&", self.type, self.culture];
}

@end