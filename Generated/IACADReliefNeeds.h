


#import <Foundation/Foundation.h>



@interface IACADReliefNeeds : NSObject {
}

@property (nonatomic, retain) NSNumber* DisasterId;
@property (nonatomic, retain) NSNumber* Id;
@property (nonatomic, retain) NSString* NeedCause;
@property (nonatomic, retain) NSString* NeedQuantity;
@property (nonatomic, retain) NSNumber* NeedTypeId;
@property (nonatomic, retain) NSString* StrNeedType;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
