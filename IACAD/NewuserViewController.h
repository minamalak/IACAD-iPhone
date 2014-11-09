//
//  NewuserViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/13/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"
@class AppDelegate;
@class CustomizedACView;
@interface NewuserViewController : UIViewController <IACADServiceClientCaller,UITextFieldDelegate,UITextViewDelegate>
{
    int countryID;
    int countryIsSelected;
    int cityIsSelected;
    CustomizedACView * AC;
    int cityID;
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UITextField *answerTF;
@property (weak, nonatomic) IBOutlet UITextField *questionTF;
@property (weak, nonatomic) IBOutlet UILabel *answerLbl;
@property (weak, nonatomic) IBOutlet UILabel *questionLbl;
@property (weak, nonatomic) IBOutlet UIImageView *listingBgImg;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UIScrollView *theScrollview;
@property (weak, nonatomic) IBOutlet UITextField *firstnameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *familynameTF;
@property (weak, nonatomic) IBOutlet UITextField *mobilenumberTF;
- (IBAction)registerMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *cityButton;
@property (weak, nonatomic) IBOutlet UILabel *firstnameLbl;
- (IBAction)countryMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *familynameLbl;
@property (weak, nonatomic) IBOutlet UILabel *mobilenumberLbl;
@property (weak, nonatomic) IBOutlet UILabel *countryLbl;
@property (weak, nonatomic) IBOutlet UILabel *cityLbl;
@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;
@property (weak, nonatomic) IBOutlet UILabel *usernameLbl;
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;

@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
- (IBAction)backMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)cityMethod:(id)sender;
-(void)countrySelected: (NSString *)countryname :(int)counid;
-(void)citySelected: (NSString *)cityname :(int)cityid;
@end
