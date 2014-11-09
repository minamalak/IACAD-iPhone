


#import <Foundation/Foundation.h>
#import "IACADUser.h"

@implementation IACADUser
@synthesize CityId;
@synthesize CityName;
@synthesize CountryId;
@synthesize CountryName;
@synthesize Email;
@synthesize FirstName;
@synthesize Id;
@synthesize LastName;
@synthesize Mobile;
@synthesize PasswordQuestion;
@synthesize UserName;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.CityId = [[dictionary objectForKey: @"CityId"] intValue];
						
		NSObject *CityNameRef = [dictionary objectForKey:@"CityName"];
		if([CityNameRef isKindOfClass:[NSNull class]]) {
			self.CityName = nil;
		}
		else {
			self.CityName = [[dictionary objectForKey: @"CityName"] copy];
		}
		self.CountryId = [[dictionary objectForKey: @"CountryId"] intValue];
						
		NSObject *CountryNameRef = [dictionary objectForKey:@"CountryName"];
		if([CountryNameRef isKindOfClass:[NSNull class]]) {
			self.CountryName = nil;
		}
		else {
			self.CountryName = [[dictionary objectForKey: @"CountryName"] copy];
		}
						
		NSObject *EmailRef = [dictionary objectForKey:@"Email"];
		if([EmailRef isKindOfClass:[NSNull class]]) {
			self.Email = nil;
		}
		else {
			self.Email = [[dictionary objectForKey: @"Email"] copy];
		}
						
		NSObject *FirstNameRef = [dictionary objectForKey:@"FirstName"];
		if([FirstNameRef isKindOfClass:[NSNull class]]) {
			self.FirstName = nil;
		}
		else {
			self.FirstName = [[dictionary objectForKey: @"FirstName"] copy];
		}
		self.Id = [dictionary objectForKey: @"Id"];
						
		NSObject *LastNameRef = [dictionary objectForKey:@"LastName"];
		if([LastNameRef isKindOfClass:[NSNull class]]) {
			self.LastName = nil;
		}
		else {
			self.LastName = [[dictionary objectForKey: @"LastName"] copy];
		}
						
		NSObject *MobileRef = [dictionary objectForKey:@"Mobile"];
		if([MobileRef isKindOfClass:[NSNull class]]) {
			self.Mobile = nil;
		}
		else {
			self.Mobile = [[dictionary objectForKey: @"Mobile"] copy];
		}
						
		NSObject *PasswordQuestionRef = [dictionary objectForKey:@"PasswordQuestion"];
		if([PasswordQuestionRef isKindOfClass:[NSNull class]]) {
			self.PasswordQuestion = nil;
		}
		else {
			self.PasswordQuestion = [[dictionary objectForKey: @"PasswordQuestion"] copy];
		}
						
		NSObject *UserNameRef = [dictionary objectForKey:@"UserName"];
		if([UserNameRef isKindOfClass:[NSNull class]]) {
			self.UserName = nil;
		}
		else {
			self.UserName = [[dictionary objectForKey: @"UserName"] copy];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt: self.CityId] forKey:@"CityId"];
	[dictionary setValue:self.CityName forKey:@"CityName"];
	[dictionary setValue:[NSNumber numberWithInt: self.CountryId] forKey:@"CountryId"];
	[dictionary setValue:self.CountryName forKey:@"CountryName"];
	[dictionary setValue:self.Email forKey:@"Email"];
	[dictionary setValue:self.FirstName forKey:@"FirstName"];
	[dictionary setValue:self.Id forKey:@"Id"];
	[dictionary setValue:self.LastName forKey:@"LastName"];
	[dictionary setValue:self.Mobile forKey:@"Mobile"];
	[dictionary setValue:self.PasswordQuestion forKey:@"PasswordQuestion"];
	[dictionary setValue:self.UserName forKey:@"UserName"];
	return dictionary;
}

@end
