//
//  editProfileViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 12/29/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "IACADServiceClient.h"
#import "CustomizedACView.h"
@class AppDelegate;
@class CustomizedACView;
@interface editProfileViewController : UIViewController <IACADServiceClientCaller>
{
    AppDelegate * appDelegate;
     CustomizedACView * AC;
    int countryID;
    NSString * userID;
    int cityID;
    int countryIsSelected;
    int cityIsSelected;
    NSString * secretquestion;
}
@property (weak, nonatomic) IBOutlet UITextField *answerTF;
@property (weak, nonatomic) IBOutlet UILabel *answerLbl;
@property (weak, nonatomic) IBOutlet UITextField *questionTF;
@property (weak, nonatomic) IBOutlet UILabel *questionLbl;
@property (weak, nonatomic) IBOutlet UIScrollView *theScrollview;
@property (weak, nonatomic) IBOutlet UIImageView *listingBgImg;
@property (weak, nonatomic) IBOutlet UILabel *mobilenumberLbl;
@property (weak, nonatomic) IBOutlet UITextField *firstnameTF;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UILabel *familynameLbl;
@property (weak, nonatomic) IBOutlet UIButton *cityButton;
- (IBAction)countryMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *countryButton;
- (IBAction)cityMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UILabel *newpasswordLbl;
@property (weak, nonatomic) IBOutlet UITextField *newpasswordTF;


@property (weak, nonatomic) IBOutlet UITextField *mobilenumberTF;
@property (weak, nonatomic) IBOutlet UILabel *countryLbl;
@property (weak, nonatomic) IBOutlet UILabel *cityLbl;

@property (weak, nonatomic) IBOutlet UITextField *familynameTF;
@property (weak, nonatomic) IBOutlet UILabel *firstnameLbl;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UILabel *usernameLbl;
- (IBAction)saveMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
- (IBAction)closeMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *usernameTF;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@end
