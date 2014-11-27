


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADProjectsData.h"

@implementation IACADProjectsData
@synthesize Area;
@synthesize CharityName;
@synthesize CountryName;
@synthesize ContractDateString;
@synthesize Description;
@synthesize Id;
@synthesize InitialDuration;
@synthesize Name;
@synthesize PercentCompleted;
@synthesize TotalCost;
@synthesize Type;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *AreaRef = [dictionary objectForKey:@"Area"];
		if([AreaRef isKindOfClass:[NSNull class]]) {
			self.Area = nil;
		}
		else {
			self.Area = [dictionary objectForKey: @"Area"];
		}
						
		NSObject *CharityNameRef = [dictionary objectForKey:@"CharityName"];
		if([CharityNameRef isKindOfClass:[NSNull class]]) {
			self.CharityName = nil;
		}
		else {
			self.CharityName = [dictionary objectForKey: @"CharityName"];
		}
        
		NSObject *CountryNameRef = [dictionary objectForKey:@"CountryName"];
		if([CountryNameRef isKindOfClass:[NSNull class]]) {
			self.CountryName = nil;
		}
		else {
			self.CountryName = [dictionary objectForKey: @"CountryName"];
		}
    
		NSObject *ContractDateStringRef = [dictionary objectForKey:@"ContractDateString"];
		if([ContractDateStringRef isKindOfClass:[NSNull class]]) {
			self.ContractDateString = nil;
		}
		else {
			self.ContractDateString = [dictionary objectForKey: @"ContractDateString"];
		}
						
		NSObject *DescriptionRef = [dictionary objectForKey:@"Description"];
		if([DescriptionRef isKindOfClass:[NSNull class]]) {
			self.Description = nil;
		}
		else {
			self.Description = [dictionary objectForKey: @"Description"];
		}
		self.Id = [dictionary objectForKey: @"Id"];
						
		NSObject *InitialDurationRef = [dictionary objectForKey:@"InitialDuration"];
		if([InitialDurationRef isKindOfClass:[NSNull class]]) {
			self.InitialDuration = nil;
		}
		else {
			self.InitialDuration = [dictionary objectForKey: @"InitialDuration"];
		}
						
		NSObject *NameRef = [dictionary objectForKey:@"Name"];
		if([NameRef isKindOfClass:[NSNull class]]) {
			self.Name = nil;
		}
		else {
			self.Name = [dictionary objectForKey: @"Name"];
		}
						
		NSObject *PercentCompletedRef = [dictionary objectForKey:@"PercentCompleted"];
		if([PercentCompletedRef isKindOfClass:[NSNull class]]) {
			self.PercentCompleted = nil;
		}
		else {
			self.PercentCompleted = [dictionary objectForKey: @"PercentCompleted"];
		}
						
		NSObject *TotalCostRef = [dictionary objectForKey:@"TotalCost"];
		if([TotalCostRef isKindOfClass:[NSNull class]]) {
			self.TotalCost = nil;
		}
		else {
			self.TotalCost = [dictionary objectForKey: @"TotalCost"];
		}
						
		NSObject *TypeRef = [dictionary objectForKey:@"Type"];
		if([TypeRef isKindOfClass:[NSNull class]]) {
			self.Type = nil;
		}
		else {
			self.Type = [dictionary objectForKey: @"Type"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.Area forKey:@"Area"];
	[dictionary setValue:self.CharityName forKey:@"CharityName"];
	[dictionary setValue:self.CharityName forKey:@"CountryName"];
	[dictionary setValue:self.ContractDateString forKey:@"ContractDateString"];
	[dictionary setValue:self.Description forKey:@"Description"];
	[dictionary setValue:self.Id forKey:@"Id"];
	[dictionary setValue:self.InitialDuration forKey:@"InitialDuration"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:self.PercentCompleted forKey:@"PercentCompleted"];
	[dictionary setValue:self.TotalCost forKey:@"TotalCost"];
	[dictionary setValue:self.Type forKey:@"Type"];
	return dictionary;
}

@end
