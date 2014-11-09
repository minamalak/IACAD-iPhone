


#import <Foundation/Foundation.h>
#import "IACADCountry.h"

@implementation IACADCountry
@synthesize Id;
@synthesize Name;
@synthesize NameAr;
@synthesize NameEn;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.Id = [[dictionary objectForKey: @"Id"] intValue];
						
		NSObject *NameRef = [dictionary objectForKey:@"Name"];
		if([NameRef isKindOfClass:[NSNull class]]) {
			self.Name = nil;
		}
		else {
			self.Name = [[dictionary objectForKey: @"Name"] copy];
		}
						
		NSObject *NameArRef = [dictionary objectForKey:@"NameAr"];
		if([NameArRef isKindOfClass:[NSNull class]]) {
			self.NameAr = nil;
		}
		else {
			self.NameAr = [[dictionary objectForKey: @"NameAr"] copy];
		}
						
		NSObject *NameEnRef = [dictionary objectForKey:@"NameEn"];
		if([NameEnRef isKindOfClass:[NSNull class]]) {
			self.NameEn = nil;
		}
		else {
			self.NameEn = [[dictionary objectForKey: @"NameEn"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt: self.Id] forKey:@"Id"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:self.NameAr forKey:@"NameAr"];
	[dictionary setValue:self.NameEn forKey:@"NameEn"];
	return dictionary;
}

@end
