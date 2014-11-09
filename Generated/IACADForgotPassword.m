


#import <Foundation/Foundation.h>
#import "IACADForgotPassword.h"

@implementation IACADForgotPassword
@synthesize FailureMessage;
@synthesize Success;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *FailureMessageRef = [dictionary objectForKey:@"FailureMessage"];
		if([FailureMessageRef isKindOfClass:[NSNull class]]) {
			self.FailureMessage = nil;
		}
		else {
			self.FailureMessage = [[dictionary objectForKey: @"FailureMessage"] copy];
		}
		self.Success = [[dictionary objectForKey: @"Success"] boolValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.FailureMessage forKey:@"FailureMessage"];
	[dictionary setValue:[NSNumber numberWithBool: self.Success] forKey:@"Success"];
	return dictionary;
}

@end
