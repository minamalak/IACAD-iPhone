//
//  constructionViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/26/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADCatalogDonationItem.h"
#import "AppDelegate.h"
#import "confirmDonationView.h"
#import "IACADServiceClient.h"


@class confirmDonationView;
@class IACADCatalogDonationItem;
@class CustomizedACView;
@class AppDelegate;
@interface constructionViewController : UIViewController <IACADServiceClientCaller,UIWebViewDelegate>
{
    IACADCatalogDonationItem * itemDetails;
    confirmDonationView * confirmView;
    int totalAmount;
    CustomizedACView * AC;
    NSString * charityName;
    AppDelegate * appDelegate;
    BOOL isQant;
    int remainingStock;
}
-(id)init:(IACADCatalogDonationItem *) item :(BOOL)isQ;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *donateButton;
@property (weak, nonatomic) IBOutlet UIImageView *greenImgBG;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *orgLbl;
@property (weak, nonatomic) IBOutlet UILabel *countryLbl;
@property (weak, nonatomic) IBOutlet UILabel *orgString;
@property (weak, nonatomic) IBOutlet UILabel *countryString;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *typeLbl;
@property (weak, nonatomic) IBOutlet UILabel *spaceLbl;
@property (weak, nonatomic) IBOutlet UILabel *costLbl;
@property (weak, nonatomic) IBOutlet UILabel *sizeLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UILabel *fasLbl;
@property (weak, nonatomic) IBOutlet UILabel *typeString;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *spaceString;
@property (weak, nonatomic) IBOutlet UILabel *sizeString;
@property (weak, nonatomic) IBOutlet UILabel *costString;
@property (weak, nonatomic) IBOutlet UILabel *fasString;
@property (weak, nonatomic) IBOutlet UILabel *descString;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
- (IBAction)backMethod:(id)sender;
- (IBAction)donateMethod:(id)sender;
-(void)hidePopover;
-(void) getTotalAmount:(int)value :(NSString *)proName :(NSString *)proNote;
-(void)showConfrimPopover;

@end
