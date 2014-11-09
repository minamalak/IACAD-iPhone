


#import <Foundation/Foundation.h>
#import "IACADLocation.h"
#import "IACADIACADEvent.h"
#import "WebServiceEntities.h"

@implementation IACADIACADEvent
@synthesize Description;
@synthesize EndDate;
@synthesize EventLocation;
@synthesize Id;
@synthesize Name;
@synthesize StartDate;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *DescriptionRef = [dictionary objectForKey:@"Description"];
		if([DescriptionRef isKindOfClass:[NSNull class]]) {
			self.Description = nil;
		}
		else {
			self.Description = [[dictionary objectForKey: @"Description"] copy];
		}
		self.EndDate = [WebServiceEntities deserializeJsonDateString:[dictionary objectForKey: @"EndDate"]];
						
		NSObject *EventLocationRef = [dictionary objectForKey:@"EventLocation"];
		if([EventLocationRef isKindOfClass:[NSNull class]]) {
			self.EventLocation = nil;
		}
		else {
			self.EventLocation = [[IACADLocation alloc] initWithData:[dictionary objectForKey: @"EventLocation"]];
		}
		self.Id = [[dictionary objectForKey: @"Id"] intValue];
						
		NSObject *NameRef = [dictionary objectForKey:@"Name"];
		if([NameRef isKindOfClass:[NSNull class]]) {
			self.Name = nil;
		}
		else {
			self.Name = [[dictionary objectForKey: @"Name"] copy];
		}
		self.StartDate = [WebServiceEntities deserializeJsonDateString:[dictionary objectForKey: @"StartDate"]];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.Description forKey:@"Description"];
	[dictionary setValue:[WebServiceEntities serializeToJsonDateString: self.EndDate] forKey:@"EndDate"];
	[dictionary setValue:[self.EventLocation JSONDictionary] forKey:@"EventLocation"];
	[dictionary setValue:[NSNumber numberWithInt: self.Id] forKey:@"Id"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:[WebServiceEntities serializeToJsonDateString: self.StartDate] forKey:@"StartDate"];
	return dictionary;
}

@end
