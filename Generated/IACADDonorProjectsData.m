


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADDonorProjectsData.h"

@implementation IACADDonorProjectsData
@synthesize CharityName;
@synthesize CountryName;
@synthesize DonorId;
@synthesize Id;
@synthesize Name;
@synthesize ProjectID;
@synthesize TotalCostString;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
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
        
		NSObject *DonorIdRef = [dictionary objectForKey:@"DonorId"];
		if([DonorIdRef isKindOfClass:[NSNull class]]) {
			self.DonorId = nil;
		}
		else {
			self.DonorId = [dictionary objectForKey: @"DonorId"];
		}
		self.Id = [dictionary objectForKey: @"Id"];
						
		NSObject *NameRef = [dictionary objectForKey:@"Name"];
		if([NameRef isKindOfClass:[NSNull class]]) {
			self.Name = nil;
		}
		else {
			self.Name = [dictionary objectForKey: @"Name"];
		}
						
		NSObject *ProjectIDRef = [dictionary objectForKey:@"ProjectID"];
		if([ProjectIDRef isKindOfClass:[NSNull class]]) {
			self.ProjectID = nil;
		}
		else {
			self.ProjectID = [dictionary objectForKey: @"ProjectID"];
		}
						
		NSObject *TotalCostStringRef = [dictionary objectForKey:@"TotalCostString"];
		if([TotalCostStringRef isKindOfClass:[NSNull class]]) {
			self.TotalCostString = nil;
		}
		else {
			self.TotalCostString = [dictionary objectForKey: @"TotalCostString"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.CharityName forKey:@"CharityName"];
	[dictionary setValue:self.CharityName forKey:@"CountryName"];
	[dictionary setValue:self.DonorId forKey:@"DonorId"];
	[dictionary setValue:self.Id forKey:@"Id"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:self.ProjectID forKey:@"ProjectID"];
	[dictionary setValue:self.TotalCostString forKey:@"TotalCostString"];
	return dictionary;
}

@end
