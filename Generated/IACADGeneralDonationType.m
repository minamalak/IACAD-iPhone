


#import <Foundation/Foundation.h>
#import "IACADGeneralDonationType.h"

@implementation IACADGeneralDonationType
@synthesize AXCreditAccountID;
@synthesize AXCreditAccountName;
@synthesize AXDebitAccountID;
@synthesize AXDebitAccountName;
@synthesize CharityID;
@synthesize CharityName;
@synthesize CharityShare;
@synthesize Description;
@synthesize Id;
@synthesize Name;
@synthesize NameAr;
@synthesize NameEn;
@synthesize ShowInCatalog;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *AXCreditAccountIDRef = [dictionary objectForKey:@"AXCreditAccountID"];
		if([AXCreditAccountIDRef isKindOfClass:[NSNull class]]) {
			self.AXCreditAccountID = nil;
		}
		else {
			self.AXCreditAccountID = [[dictionary objectForKey: @"AXCreditAccountID"] copy];
		}
						
		NSObject *AXCreditAccountNameRef = [dictionary objectForKey:@"AXCreditAccountName"];
		if([AXCreditAccountNameRef isKindOfClass:[NSNull class]]) {
			self.AXCreditAccountName = nil;
		}
		else {
			self.AXCreditAccountName = [[dictionary objectForKey: @"AXCreditAccountName"] copy];
		}
						
		NSObject *AXDebitAccountIDRef = [dictionary objectForKey:@"AXDebitAccountID"];
		if([AXDebitAccountIDRef isKindOfClass:[NSNull class]]) {
			self.AXDebitAccountID = nil;
		}
		else {
			self.AXDebitAccountID = [[dictionary objectForKey: @"AXDebitAccountID"] copy];
		}
						
		NSObject *AXDebitAccountNameRef = [dictionary objectForKey:@"AXDebitAccountName"];
		if([AXDebitAccountNameRef isKindOfClass:[NSNull class]]) {
			self.AXDebitAccountName = nil;
		}
		else {
			self.AXDebitAccountName = [[dictionary objectForKey: @"AXDebitAccountName"] copy];
		}
		self.CharityID = [[dictionary objectForKey: @"CharityID"] intValue];
						
		NSObject *CharityNameRef = [dictionary objectForKey:@"CharityName"];
		if([CharityNameRef isKindOfClass:[NSNull class]]) {
			self.CharityName = nil;
		}
		else {
			self.CharityName = [[dictionary objectForKey: @"CharityName"] copy];
		}
						
		NSObject *CharityShareRef = [dictionary objectForKey:@"CharityShare"];
		if([CharityShareRef isKindOfClass:[NSNull class]]) {
			self.CharityShare = 0;
		}
		else {
			self.CharityShare = [[dictionary objectForKey: @"CharityShare"] doubleValue];
		}
						
		NSObject *DescriptionRef = [dictionary objectForKey:@"Description"];
		if([DescriptionRef isKindOfClass:[NSNull class]]) {
			self.Description = nil;
		}
		else {
			self.Description = [[dictionary objectForKey: @"Description"] copy];
		}
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
		self.ShowInCatalog = [[dictionary objectForKey: @"ShowInCatalog"] boolValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.AXCreditAccountID forKey:@"AXCreditAccountID"];
	[dictionary setValue:self.AXCreditAccountName forKey:@"AXCreditAccountName"];
	[dictionary setValue:self.AXDebitAccountID forKey:@"AXDebitAccountID"];
	[dictionary setValue:self.AXDebitAccountName forKey:@"AXDebitAccountName"];
	[dictionary setValue:[NSNumber numberWithInt: self.CharityID] forKey:@"CharityID"];
	[dictionary setValue:self.CharityName forKey:@"CharityName"];
	[dictionary setValue:[NSNumber numberWithDouble: self.CharityShare] forKey:@"CharityShare"];
	[dictionary setValue:self.Description forKey:@"Description"];
	[dictionary setValue:[NSNumber numberWithInt: self.Id] forKey:@"Id"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:self.NameAr forKey:@"NameAr"];
	[dictionary setValue:self.NameEn forKey:@"NameEn"];
	[dictionary setValue:[NSNumber numberWithBool: self.ShowInCatalog] forKey:@"ShowInCatalog"];
	return dictionary;
}

@end
