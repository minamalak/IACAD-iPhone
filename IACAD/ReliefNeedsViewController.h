//
//  ReliefNeedsViewController.h
//  IACAD
//
//  Created by Mina Malak on 11/24/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "IACADGetReliefNeedForDisaster.h"
#import "IACADGetReliefNeedForDisasterResponse.h"
#import "IACADReliefNeeds.h"
#import "IACADReliefCharityDisasterOnSite.h"
#import "IACADReliefDonationItem.h"
#import "IACADAddReliefDonation.h"
#import "IACADAddReliefDonationResponse.h"
#import "CustomizedACView.h"

@interface ReliefNeedsViewController : UIViewController <IACADServiceClientCaller, UITextFieldDelegate, UIGestureRecognizerDelegate>
{
    int charityID;
    CustomizedACView * AC;
    AppDelegate * appDelegate;
    NSMutableArray * donateList;
    NSMutableArray * finalDonataionList;
    NSString * returnResponse;
    
}
@property (nonatomic, retain) IACADReliefCharityDisasterOnSite *item;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *donateButton;
@property (weak, nonatomic) IBOutlet UIImageView *greenbarImg;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalCountLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalLbl;
- (IBAction)backMethod:(id)sender;
- (IBAction)donateMethod:(id)sender;

@end
