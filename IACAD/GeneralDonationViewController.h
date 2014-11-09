//
//  GeneralDonationViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 9/4/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"

@class AppDelegate;
@class TPKeyboardAvoidingScrollView;
@class CustomizedACView;
@interface GeneralDonationViewController : UIViewController <IACADServiceClientCaller,UIWebViewDelegate>
{
    int charityID;
    CustomizedACView * AC;
    AppDelegate * appDelegate;
    NSMutableArray * donateList;
    NSMutableArray * finalDonataionList;
    NSString * returnResponse;

}
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *donateButton;
@property (weak, nonatomic) IBOutlet UIImageView *greenbarImg;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)backMethod:(id)sender;
-(id)init:(int) charID;
@property (weak, nonatomic) IBOutlet UILabel *totalCountLbl;
- (IBAction)donateMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *totalLbl;
@end
