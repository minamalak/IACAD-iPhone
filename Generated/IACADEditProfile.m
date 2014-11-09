


#import <Foundation/Foundation.h>
#import "IACADEditProfile.h"


@implementation IACADEditProfile

@synthesize username;
@synthesize password;
@synthesize newpassword;
@synthesize firstName;
@synthesize lastName;
@synthesize email;
@synthesize mobile;
@synthesize cityId;
@synthesize passwordQuestion;
@synthesize passwordAnswer;
@synthesize culture;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *usernameRef = [dictionary objectForKey:@"username"];
		if([usernameRef isKindOfClass:[NSNull class]]) {
			self.username = nil;
		}
		else {
			self.username = [[dictionary objectForKey: @"username"] copy];
		}
						
		NSObject *passwordRef = [dictionary objectForKey:@"password"];
		if([passwordRef isKindOfClass:[NSNull class]]) {
			self.password = nil;
		}
		else {
			self.password = [[dictionary objectForKey: @"password"] copy];
		}
						
		NSObject *newpasswordRef = [dictionary objectForKey:@"newpassword"];
		if([newpasswordRef isKindOfClass:[NSNull class]]) {
			self.newpassword = nil;
		}
		else {
			self.newpassword = [[dictionary objectForKey: @"newpassword"] copy];
		}
						
		NSObject *firstNameRef = [dictionary objectForKey:@"firstName"];
		if([firstNameRef isKindOfClass:[NSNull class]]) {
			self.firstName = nil;
		}
		else {
			self.firstName = [[dictionary objectForKey: @"firstName"] copy];
		}
						
		NSObject *lastNameRef = [dictionary objectForKey:@"lastName"];
		if([lastNameRef isKindOfClass:[NSNull class]]) {
			self.lastName = nil;
		}
		else {
			self.lastName = [[dictionary objectForKey: @"lastName"] copy];
		}
						
		NSObject *emailRef = [dictionary objectForKey:@"email"];
		if([emailRef isKindOfClass:[NSNull class]]) {
			self.email = nil;
		}
		else {
			self.email = [[dictionary objectForKey: @"email"] copy];
		}
						
		NSObject *mobileRef = [dictionary objectForKey:@"mobile"];
		if([mobileRef isKindOfClass:[NSNull class]]) {
			self.mobile = nil;
		}
		else {
			self.mobile = [[dictionary objectForKey: @"mobile"] copy];
		}
		self.cityId = [[dictionary objectForKey: @"cityId"] intValue];
						
		NSObject *passwordQuestionRef = [dictionary objectForKey:@"passwordQuestion"];
		if([passwordQuestionRef isKindOfClass:[NSNull class]]) {
			self.passwordQuestion = nil;
		}
		else {
			self.passwordQuestion = [[dictionary objectForKey: @"passwordQuestion"] copy];
		}
						
		NSObject *passwordAnswerRef = [dictionary objectForKey:@"passwordAnswer"];
		if([passwordAnswerRef isKindOfClass:[NSNull class]]) {
			self.passwordAnswer = nil;
		}
		else {
			self.passwordAnswer = [[dictionary objectForKey: @"passwordAnswer"] copy];
		}
						
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
	[dictionary setValue:self.username forKey:@"username"];
	[dictionary setValue:self.password forKey:@"password"];
	[dictionary setValue:self.newpassword forKey:@"newpassword"];
	[dictionary setValue:self.firstName forKey:@"firstName"];
	[dictionary setValue:self.lastName forKey:@"lastName"];
	[dictionary setValue:self.email forKey:@"email"];
	[dictionary setValue:self.mobile forKey:@"mobile"];
	[dictionary setValue:[NSNumber numberWithInt: self.cityId] forKey:@"cityId"];
	[dictionary setValue:self.passwordQuestion forKey:@"passwordQuestion"];
	[dictionary setValue:self.passwordAnswer forKey:@"passwordAnswer"];
	[dictionary setValue:self.culture forKey:@"culture"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?username=%@&password=%@&newpassword=%@&firstName=%@&lastName=%@&email=%@&mobile=%@&cityId=%d&passwordQuestion=%@&passwordAnswer=%@&culture=%@&", self.username, self.password, self.newpassword, self.firstName, self.lastName, self.email, self.mobile, self.cityId, self.passwordQuestion, self.passwordAnswer, self.culture];
}

@end