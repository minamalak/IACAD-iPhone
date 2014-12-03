//
//  SigningViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/7/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "SigningViewController.h"
#import "ArabicConverter.h"
#import "BlockAlertView.h"
#import <QuartzCore/QuartzCore.h>
#import "IACADLogin.h"
#import "IACADLoginResponse.h"
#import "CustomizedACView.h"
#import "IACADLoginResult.h"
#import "IACADUser.h"
#import "IIViewDeckController.h"
#import "IACADSendMailForgotPassword.h"
#import "IACADSendMailForgotPasswordResponse.h"
#import "IACADForgotPassword.h"


@interface SigningViewController ()

@end

@implementation SigningViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.countViews = appDelegate.countViews +1;
    
    NSString * required = NSLocalizedStringFromTable(@"required_lbl",appDelegate.culture, @"");
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        UIFont *boldFont3=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"login_title_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        self.emailLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"username_lbl",appDelegate.culture, @"")];
        self.emailLbl.font = boldFont2;
        
        
        self.passwordLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"password_lbl",appDelegate.culture, @"")];
        self.passwordLbl.font = boldFont2;
        
        
        
        
        self.forgetpassLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"forgot_password_lbl",appDelegate.culture, @"")];
        self.forgetpassLbl.font = boldFont2;
        
        self.emailTF.placeholder = [converter convertArabic:required];
        self.emailTF.font = boldFont2;
        
        self.passwordTF.font = boldFont2;
        self.passwordTF.placeholder = [converter convertArabic:required];
    }
    else
    {
        self.emailLbl.text = NSLocalizedStringFromTable(@"username_lbl",appDelegate.culture, @"");
        self.passwordLbl.text = NSLocalizedStringFromTable(@"password_lbl",appDelegate.culture, @"");
        
        
        self.forgetpassLbl.text = NSLocalizedStringFromTable(@"forgot_password_lbl",appDelegate.culture, @"");
        self.forgetpassLbl.textAlignment = NSTextAlignmentLeft;
        self.forgotPassButton.frame = CGRectMake(20, self.forgotPassButton.frame.origin.y, self.forgotPassButton.frame.size.width, self.forgotPassButton.frame.size.height);
        
        self.titleLbl.text = NSLocalizedStringFromTable(@"register_title_lbl",appDelegate.culture, @"");
        
        self.emailTF.placeholder = required;
        self.passwordTF.placeholder = required;
        
        self.emailLbl.frame = CGRectMake(18, self.emailLbl.frame.origin.y, self.emailLbl.frame.size.width, self.emailLbl.frame.size.height);
        self.emailLbl.textAlignment = NSTextAlignmentLeft;
        
        self.emailTF.frame = CGRectMake(132, self.emailTF.frame.origin.y, self.emailTF.frame.size.width, self.emailTF.frame.size.height);
        self.emailTF.textAlignment = NSTextAlignmentLeft;
        
        self.passwordLbl.frame = CGRectMake(18, self.passwordLbl.frame.origin.y, self.passwordLbl.frame.size.width, self.passwordLbl.frame.size.height);
        self.passwordLbl.textAlignment = NSTextAlignmentLeft;
        
        self.passwordTF.frame = CGRectMake(132, self.passwordTF.frame.origin.y, self.passwordTF.frame.size.width, self.emailTF.frame.size.height);
        self.passwordTF.textAlignment = NSTextAlignmentLeft;
        
        self.loginButton.frame = CGRectMake(258, self.loginButton.frame.origin.y, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
        [self.loginButton setImage:[UIImage imageNamed:@"loginButton2_en.png"] forState:UIControlStateNormal];
        
        self.closeButton.frame = CGRectMake(7, self.closeButton.frame.origin.y, self.closeButton.frame.size.width, self.closeButton.frame.size.height);
        [self.closeButton setImage:[UIImage imageNamed:@"closeButton_en.png"] forState:UIControlStateNormal];
        
        
    }
    
    
    
    self.emailTF.delegate = self;
    self.emailTF.text = @"";
    
    self.emailTF.keyboardAppearance = UIBarStyleBlack;
    self.passwordTF.delegate = self;
    self.passwordTF.text = @"";
    
    self.passwordTF.keyboardAppearance = UIBarStyleBlack;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLoginButton:nil];
    [self setCloseButton:nil];
    [self setTitleLbl:nil];
    [self setEmailLbl:nil];
    [self setPasswordLbl:nil];
    [self setEmailTF:nil];
    [self setPasswordTF:nil];
    [self setForgetpassLbl:nil];
    [super viewDidUnload];
}
- (IBAction)loginMethod:(id)sender {
    
    [self dismissKeyboard];
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        
        NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        
        
        if ([self.emailTF.text isEqualToString:@""])
        {
            //            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_username",appDelegate.culture, @"")];
            //            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            //            [alert show];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_username",appDelegate.culture, @"") delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
            [alert show];
        }
        /*  else if ([emailTest evaluateWithObject:self.emailTF.text] == NO)
         {
         BlockAlertView * alert = [BlockAlertView alertWithTitle:@"إمارات الخير" message:@"أدخل البريد الالكتروني بشكل صحيح"];
         [alert setCancelButtonWithTitle:@"تم" block:nil];
         [alert show];
         
         
         } */
        else if ([self.passwordTF.text isEqualToString:@""])
        {
            //            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_password",appDelegate.culture, @"")];
            //            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            //            [alert show];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_password",appDelegate.culture, @"") delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
            AC.center=self.view.center;
            AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
            [AC startLoading];
            [self.view addSubview:AC];
            
            IACADLogin * request = [[IACADLogin alloc]init];
            request.culture = appDelegate.culture;
            request.username = self.emailTF.text;
            request.password = self.passwordTF.text;
            
            IACADServiceClient * client = [[IACADServiceClient alloc]init];
            [client LoginAsyncIsPost:YES input:request caller:self];
        }
    }
}


-(void) LoginCallback:(IACADLoginResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    IACADLoginResult * loginResult = response.LoginResult;
    if (loginResult.LoginStatus == TRUE)
    {
        IACADUser * user;
        user = loginResult.User;
        appDelegate.userName = self.emailTF.text;
        appDelegate.firstName = user.FirstName;
        appDelegate.userID = user.Id;
        appDelegate.lastName = user.LastName;
        appDelegate.login = 1;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:self.emailTF.text forKey:@"userName"];
        [prefs setObject:user.FirstName forKey:@"firstName"];
        [prefs setObject:user.LastName forKey:@"lastName"];
        [prefs setObject:user.Id forKey:@"userID"];
        [prefs synchronize];
        
        [appDelegate updateRightSideMenu];
        
        int x = appDelegate.countViews +1;
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionReveal;
        transition.subtype = kCATransitionFromBottom;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        int count = [self.navigationController.viewControllers count];
        appDelegate.countViews = 0;
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:count-x] animated:NO];
        
    }
    else
    {
        if (!loginResult.FailureMessage || [loginResult.FailureMessage isEqualToString:@""]) {
            loginResult.FailureMessage = NSLocalizedStringFromTable(@"unkown_error",appDelegate.culture, @"");
        }
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:loginResult.FailureMessage delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"message_ok",appDelegate.culture, @"") otherButtonTitles:nil, nil];
        [alert show];
        
        //        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:loginResult.FailureMessage];
        //        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
        //        [alert show];
    }
}

- (IBAction)closeMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
        [self.viewDeckController closeRightView];
    else
    {
        
        appDelegate.countViews = appDelegate.countViews -1;
        
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionReveal;
        transition.subtype = kCATransitionFromBottom;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController popViewControllerAnimated:NO];
    }
}

#pragma mark - Hide keyboard


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self dismissKeyboard];
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ! ([touch.view isKindOfClass:[UIControl class]]);
}

-(void)dismissKeyboard {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    
    if (self.emailTF.isFirstResponder) {
        [self.emailTF resignFirstResponder];
    }
    if (self.passwordTF.isFirstResponder) {
        [self.passwordTF resignFirstResponder];
    }
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    float currentVersion = 7.0;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion) {
        self.view.frame = CGRectMake(0, 20, 320, self.view.frame.size.height-40);
        self.tabbarImg.frame  =  CGRectMake(0, -20,320,66);
    }
}


- (IBAction)forgetpassMethod:(id)sender {
    
}
- (IBAction)forgotPassMethod:(id)sender {
    
    [self dismissKeyboard];
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        if ([self.emailTF.text isEqualToString:@""])
        {
            //            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_username",appDelegate.culture, @"")];
            //            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            //            [alert show];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_username",appDelegate.culture, @"") delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            [AC startLoading];
            IACADSendMailForgotPassword * request = [[IACADSendMailForgotPassword alloc]init];
            request.UserName = self.emailTF.text;
            request.language = appDelegate.culture;
            
            IACADServiceClient * client = [[IACADServiceClient alloc]init];
            [client SendMailForgotPasswordAsyncIsPost:YES input:request caller:self];
        }
        
    }
}

-(void) SendMailForgotPasswordCallback:(IACADSendMailForgotPasswordResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    IACADForgotPassword * forgotPassword = response.SendMailForgotPasswordResult;
    
    if (forgotPassword.Success == TRUE)
    {
        //        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:forgotPassword.FailureMessage];
        //        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
        //        [alert show];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:forgotPassword.FailureMessage delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        //        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:forgotPassword.FailureMessage];
        //        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
        //        [alert show];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:forgotPassword.FailureMessage delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
        [alert show];
    }
    
}


@end
