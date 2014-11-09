


#import <Foundation/Foundation.h>
#import "IACADDonateCatalogResult.h"

@implementation IACADDonateCatalogResult
@synthesize ErrorMessage;
@synthesize IsValid;
@synthesize RedirectUrl;
@synthesize RemainingStock;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *ErrorMessageRef = [dictionary objectForKey:@"ErrorMessage"];
		if([ErrorMessageRef isKindOfClass:[NSNull class]]) {
			self.ErrorMessage = nil;
		}
		else {
			self.ErrorMessage = [[dictionary objectForKey: @"ErrorMessage"] copy];
		}
		self.IsValid = [[dictionary objectForKey: @"IsValid"] boolValue];
						
		NSObject *RedirectUrlRef = [dictionary objectForKey:@"RedirectUrl"];
		if([RedirectUrlRef isKindOfClass:[NSNull class]]) {
			self.RedirectUrl = nil;
		}
		else {
			self.RedirectUrl = [[dictionary objectForKey: @"RedirectUrl"] copy];
		}
		self.RemainingStock = [[dictionary objectForKey: @"RemainingStock"] longValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.ErrorMessage forKey:@"ErrorMessage"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsValid] forKey:@"IsValid"];
	[dictionary setValue:self.RedirectUrl forKey:@"RedirectUrl"];
	[dictionary setValue:[NSNumber numberWithLong: self.RemainingStock] forKey:@"RemainingStock"];
	return dictionary;
}

@end
