//
//  personalViewController.h
//  IACAD
//
//  Created by John Emil on 8/26/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "confirmPersonalDonationView.h"
#import "IACADServiceClient.h"


@class confirmDonationView;
@class IACADCatalogPerson;
@class IACADCatalogPersonDetail;
@class CustomizedACView;
@class AppDelegate;
@class donateGridListViewController;

@interface personalViewController : UIViewController <IACADServiceClientCaller,UIWebViewDelegate, UITableViewDataSource>
{
    IACADCatalogPerson *_item;
    IACADCatalogPersonDetail *_itemDetails;
    
    NSMutableArray *_detailsToDisplay;
    
    BOOL isPaymentScreenOpened;
    
    confirmPersonalDonationView * confirmView;
    int totalAmount;
    CustomizedACView * AC;
    NSString * charityName;
    AppDelegate * appDelegate;
}

-(id)init:(IACADCatalogPerson *)item :(donateGridListViewController *)donateListViewController;

@property (weak, nonatomic) donateGridListViewController *donateGridListViewController;
@property (weak, nonatomic) IBOutlet UITableView *detailsTable;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *donateButton;
@property (weak, nonatomic) IBOutlet UIImageView *greenImgBG;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *orgLbl;
@property (weak, nonatomic) IBOutlet UILabel *countryLbl;
@property (weak, nonatomic) IBOutlet UILabel *orgString;
@property (weak, nonatomic) IBOutlet UILabel *countryString;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
//@property (weak, nonatomic) IBOutlet UILabel *typeLbl;
//@property (weak, nonatomic) IBOutlet UILabel *spaceLbl;
//@property (weak, nonatomic) IBOutlet UILabel *costLbl;
//@property (weak, nonatomic) IBOutlet UILabel *sizeLbl;
//@property (weak, nonatomic) IBOutlet UILabel *descLbl;
//@property (weak, nonatomic) IBOutlet UILabel *fasLbl;
//@property (weak, nonatomic) IBOutlet UILabel *typeString;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (weak, nonatomic) IBOutlet UILabel *spaceString;
//@property (weak, nonatomic) IBOutlet UILabel *sizeString;
//@property (weak, nonatomic) IBOutlet UILabel *costString;
//@property (weak, nonatomic) IBOutlet UILabel *fasString;
//@property (weak, nonatomic) IBOutlet UILabel *descString;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;

- (IBAction)backMethod:(id)sender;
- (IBAction)donateMethod:(id)sender;
-(void)hidePopover;
-(void) getTotalAmount:(int)value :(NSString *)proName :(NSString *)proNote;

- (NSString *)constructAge:(int)pMonths years:(int)pYears;

- (void)showConfrimPopover;

@end
