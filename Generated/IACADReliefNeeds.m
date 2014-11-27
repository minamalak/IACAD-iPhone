


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "IACADReliefNeeds.h"

@implementation IACADReliefNeeds
@synthesize DisasterId;
@synthesize Id;
@synthesize NeedCause;
@synthesize NeedQuantity;
@synthesize NeedTypeId;
@synthesize StrNeedType;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *DisasterIdRef = [dictionary objectForKey:@"DisasterId"];
		if([DisasterIdRef isKindOfClass:[NSNull class]]) {
			self.DisasterId = nil;
		}
		else {
			self.DisasterId = [dictionary objectForKey: @"DisasterId"];
		}
		self.Id = [dictionary objectForKey: @"Id"];
						
		NSObject *NeedCauseRef = [dictionary objectForKey:@"NeedCause"];
		if([NeedCauseRef isKindOfClass:[NSNull class]]) {
			self.NeedCause = nil;
		}
		else {
			self.NeedCause = [dictionary objectForKey: @"NeedCause"];
		}
						
		NSObject *NeedQuantityRef = [dictionary objectForKey:@"NeedQuantity"];
		if([NeedQuantityRef isKindOfClass:[NSNull class]]) {
			self.NeedQuantity = nil;
		}
		else {
			self.NeedQuantity = [dictionary objectForKey: @"NeedQuantity"];
		}
		self.NeedTypeId = [dictionary objectForKey: @"NeedTypeId"];
						
		NSObject *StrNeedTypeRef = [dictionary objectForKey:@"StrNeedType"];
		if([StrNeedTypeRef isKindOfClass:[NSNull class]]) {
			self.StrNeedType = nil;
		}
		else {
			self.StrNeedType = [dictionary objectForKey: @"StrNeedType"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.DisasterId forKey:@"DisasterId"];
	[dictionary setValue:self.Id forKey:@"Id"];
	[dictionary setValue:self.NeedCause forKey:@"NeedCause"];
	[dictionary setValue:self.NeedQuantity forKey:@"NeedQuantity"];
	[dictionary setValue:self.NeedTypeId forKey:@"NeedTypeId"];
	[dictionary setValue:self.StrNeedType forKey:@"StrNeedType"];
	return dictionary;
}

@end
