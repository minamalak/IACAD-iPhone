


#import <Foundation/Foundation.h>



@interface IACADGeneralDonationType : NSObject {
}

@property (nonatomic, retain) NSString* AXCreditAccountID;
@property (nonatomic, retain) NSString* AXCreditAccountName;
@property (nonatomic, retain) NSString* AXDebitAccountID;
@property (nonatomic, retain) NSString* AXDebitAccountName;
@property (nonatomic) int CharityID;
@property (nonatomic, retain) NSString* CharityName;
@property (nonatomic) double CharityShare;
@property (nonatomic, retain) NSString* Description;
@property (nonatomic) int Id;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* NameAr;
@property (nonatomic, retain) NSString* NameEn;
@property (nonatomic) BOOL ShowInCatalog;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
