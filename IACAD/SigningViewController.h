//
//  SigningViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/7/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "IACADServiceClient.h"
#import "AppDelegate.h"
@class AppDelegate;
@class CustomizedACView;
@interface SigningViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate,IACADServiceClientCaller>
{
    AppDelegate * appDelegate;
    CustomizedACView * AC;
    
    id delegate;
}
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
- (IBAction)forgotPassMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *forgotPassButton;

@property (weak, nonatomic) IBOutlet UILabel *forgetpassLbl;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;

- (IBAction)forgetpassMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)closeMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
- (IBAction)loginMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

-(id)init :(id) donateDelegate;
@end
