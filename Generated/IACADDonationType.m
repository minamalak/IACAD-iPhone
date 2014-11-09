


#import <Foundation/Foundation.h>
#import "IACADDonationType.h"

@implementation IACADDonationType
@synthesize BriefName;
@synthesize CategoryId;
@synthesize DepartmentId;
@synthesize DepartmentModuleId;
@synthesize Descrioption;
@synthesize DescrioptionAr;
@synthesize DescrioptionEn;
@synthesize Id;
@synthesize Image1ID;
@synthesize Image2ID;
@synthesize IsActive;
@synthesize IsQuantitative;
@synthesize IsSystemType;
@synthesize MaxInterestPercentage;
@synthesize Name;
@synthesize NameAr;
@synthesize NameEn;
@synthesize ShowInMobile;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *BriefNameRef = [dictionary objectForKey:@"BriefName"];
		if([BriefNameRef isKindOfClass:[NSNull class]]) {
			self.BriefName = nil;
		}
		else {
			self.BriefName = [[dictionary objectForKey: @"BriefName"] copy];
		}
		self.CategoryId = [[dictionary objectForKey: @"CategoryId"] intValue];
		self.DepartmentId = [[dictionary objectForKey: @"DepartmentId"] intValue];
						
		NSObject *DepartmentModuleIdRef = [dictionary objectForKey:@"DepartmentModuleId"];
		if([DepartmentModuleIdRef isKindOfClass:[NSNull class]]) {
			self.DepartmentModuleId = nil;
		}
		else {
			self.DepartmentModuleId = [[dictionary objectForKey: @"DepartmentModuleId"] intValue];
		}
						
		NSObject *DescrioptionRef = [dictionary objectForKey:@"Descrioption"];
		if([DescrioptionRef isKindOfClass:[NSNull class]]) {
			self.Descrioption = nil;
		}
		else {
			self.Descrioption = [[dictionary objectForKey: @"Descrioption"] copy];
		}
						
		NSObject *DescrioptionArRef = [dictionary objectForKey:@"DescrioptionAr"];
		if([DescrioptionArRef isKindOfClass:[NSNull class]]) {
			self.DescrioptionAr = nil;
		}
		else {
			self.DescrioptionAr = [[dictionary objectForKey: @"DescrioptionAr"] copy];
		}
						
		NSObject *DescrioptionEnRef = [dictionary objectForKey:@"DescrioptionEn"];
		if([DescrioptionEnRef isKindOfClass:[NSNull class]]) {
			self.DescrioptionEn = nil;
		}
		else {
			self.DescrioptionEn = [[dictionary objectForKey: @"DescrioptionEn"] copy];
		}
		self.Id = [[dictionary objectForKey: @"Id"] intValue];
						
		NSObject *Image1IDRef = [dictionary objectForKey:@"Image1ID"];
		if([Image1IDRef isKindOfClass:[NSNull class]]) {
			self.Image1ID = nil;
		}
		else {
			self.Image1ID = [dictionary objectForKey: @"Image1ID"];
		}
						
		NSObject *Image2IDRef = [dictionary objectForKey:@"Image2ID"];
		if([Image2IDRef isKindOfClass:[NSNull class]]) {
			self.Image2ID = nil;
		}
		else {
			self.Image2ID = [dictionary objectForKey: @"Image2ID"];
		}
		self.IsActive = [[dictionary objectForKey: @"IsActive"] boolValue];
		self.IsQuantitative = [[dictionary objectForKey: @"IsQuantitative"] boolValue];
		self.IsSystemType = [[dictionary objectForKey: @"IsSystemType"] boolValue];
		self.MaxInterestPercentage = [[dictionary objectForKey: @"MaxInterestPercentage"] intValue];
						
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
		self.ShowInMobile = [[dictionary objectForKey: @"ShowInMobile"] boolValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.BriefName forKey:@"BriefName"];
	[dictionary setValue:[NSNumber numberWithInt: self.CategoryId] forKey:@"CategoryId"];
	[dictionary setValue:[NSNumber numberWithInt: self.DepartmentId] forKey:@"DepartmentId"];
	[dictionary setValue:[NSNumber numberWithInt: self.DepartmentModuleId] forKey:@"DepartmentModuleId"];
	[dictionary setValue:self.Descrioption forKey:@"Descrioption"];
	[dictionary setValue:self.DescrioptionAr forKey:@"DescrioptionAr"];
	[dictionary setValue:self.DescrioptionEn forKey:@"DescrioptionEn"];
	[dictionary setValue:[NSNumber numberWithInt: self.Id] forKey:@"Id"];
	[dictionary setValue:self.Image1ID forKey:@"Image1ID"];
	[dictionary setValue:self.Image2ID forKey:@"Image2ID"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsActive] forKey:@"IsActive"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsQuantitative] forKey:@"IsQuantitative"];
	[dictionary setValue:[NSNumber numberWithBool: self.IsSystemType] forKey:@"IsSystemType"];
	[dictionary setValue:[NSNumber numberWithInt: self.MaxInterestPercentage] forKey:@"MaxInterestPercentage"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:self.NameAr forKey:@"NameAr"];
	[dictionary setValue:self.NameEn forKey:@"NameEn"];
	[dictionary setValue:[NSNumber numberWithBool: self.ShowInMobile] forKey:@"ShowInMobile"];
	return dictionary;
}

@end
