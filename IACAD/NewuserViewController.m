//
//  NewuserViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/13/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "NewuserViewController.h"
#import "ArabicConverter.h"
#import "BlockAlertView.h"
#import <QuartzCore/QuartzCore.h>
#import "cityListViewController.h"
#import "countrtyListViewController.h"
#import "IACADRegister.h"
#import "IACADRegisterResponse.h"
#import "IACADRegisterResult.h"
#import "CustomizedACView.h"
#import "IIViewDeckController.h"
#import "IACADUser.h"

@interface NewuserViewController ()

@end

@implementation NewuserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        countryIsSelected = 0;
        cityIsSelected = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    if(result.height == 480)
        [self.theScrollview setContentSize:CGSizeMake(320, 500)];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.countViews = appDelegate.countViews +1;
    
    NSString * required = NSLocalizedStringFromTable(@"required_lbl",appDelegate.culture, @"");

    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic: NSLocalizedStringFromTable(@"register_title_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        self.usernameLbl.text = [converter convertArabic: NSLocalizedStringFromTable(@"username_lbl",appDelegate.culture, @"")];
        self.usernameLbl.font = boldFont2;
        
        self.emailLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"email_lbl",appDelegate.culture, @"")];
        self.emailLbl.font = boldFont2;
        
        self.firstnameLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"firstname_lbl",appDelegate.culture, @"")];
        self.firstnameLbl.font = boldFont2;
        
        self.familynameLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"lastname_lbl",appDelegate.culture, @"")];
        self.familynameLbl.font = boldFont2;
        
        self.mobilenumberLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"mobile_lbl",appDelegate.culture, @"")];
        self.mobilenumberLbl.font = boldFont2;
        
        self.countryLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"")];
        self.countryLbl.font = boldFont2;
        
        self.cityLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"city_lbl",appDelegate.culture, @"")];
        self.cityLbl.font = boldFont2;
        
        self.passwordLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"password_lbl",appDelegate.culture, @"")];
        self.passwordLbl.font = boldFont2;
        
        self.questionLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"question_lbl",appDelegate.culture, @"")];
        self.questionLbl.font = boldFont2;
        
        self.answerLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"answer_lbl",appDelegate.culture, @"")];
        self.answerLbl.font = boldFont2;
        
        self.usernameTF.placeholder = [converter convertArabic:required];
        self.usernameTF.font = boldFont2;
        
        self.emailTF.placeholder = [converter convertArabic:required];
        self.emailTF.font = boldFont2;
        
        self.firstnameTF.placeholder = [converter convertArabic:required];
        self.firstnameTF.font = boldFont2;
        
        self.familynameTF.placeholder = [converter convertArabic:required];
        self.familynameTF.font = boldFont2;
        
        self.mobilenumberTF.placeholder = [converter convertArabic:required];
        self.mobilenumberTF.font = boldFont2;
        
        self.passwordTF.placeholder = [converter convertArabic:required];
        self.passwordTF.font = boldFont2;
        
        self.questionTF.placeholder = [converter convertArabic:required];
        self.questionTF.font = boldFont2;
        
        self.answerTF.placeholder = [converter convertArabic:required];
        self.answerTF.font = boldFont2;
    }
    else
    {
        
        self.titleLbl.text = NSLocalizedStringFromTable(@"register_title_lbl",appDelegate.culture, @"");
        
        self.usernameLbl.text = NSLocalizedStringFromTable(@"username_lbl",appDelegate.culture, @"");
        self.usernameLbl.frame = CGRectMake(60, self.usernameLbl.frame.origin.y, self.usernameLbl.frame.size.width, self.usernameLbl.frame.size.height);
        self.usernameLbl.textAlignment = NSTextAlignmentLeft;
        
        self.emailLbl.text = NSLocalizedStringFromTable(@"email_lbl",appDelegate.culture, @"");
        self.emailLbl.frame = CGRectMake(60, self.emailLbl.frame.origin.y, self.emailLbl.frame.size.width, self.emailLbl.frame.size.height);
        self.emailLbl.textAlignment = NSTextAlignmentLeft;
        
        self.firstnameLbl.text = NSLocalizedStringFromTable(@"firstname_lbl",appDelegate.culture, @"");
        self.firstnameLbl.frame = CGRectMake(60, self.firstnameLbl.frame.origin.y, self.firstnameLbl.frame.size.width, self.firstnameLbl.frame.size.height);
        self.firstnameLbl.textAlignment = NSTextAlignmentLeft;
        
        
        self.familynameLbl.text = NSLocalizedStringFromTable(@"lastname_lbl",appDelegate.culture, @"");
        self.familynameLbl.frame = CGRectMake(60, self.familynameLbl.frame.origin.y, self.familynameLbl.frame.size.width, self.familynameLbl.frame.size.height);
        self.familynameLbl.textAlignment = NSTextAlignmentLeft;
        
        self.mobilenumberLbl.text = NSLocalizedStringFromTable(@"mobile_lbl",appDelegate.culture, @"");
        self.mobilenumberLbl.frame = CGRectMake(60, self.mobilenumberLbl.frame.origin.y, self.mobilenumberLbl.frame.size.width, self.mobilenumberLbl.frame.size.height);
        self.mobilenumberLbl.textAlignment = NSTextAlignmentLeft;
        
        self.countryLbl.text = NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"");
        self.countryLbl.frame = CGRectMake(60, self.countryLbl.frame.origin.y, self.countryLbl.frame.size.width, self.countryLbl.frame.size.height);
        self.countryLbl.textAlignment = NSTextAlignmentLeft;
        
        self.cityLbl.text = NSLocalizedStringFromTable(@"city_lbl",appDelegate.culture, @"");
        self.cityLbl.frame = CGRectMake(60, self.cityLbl.frame.origin.y, self.cityLbl.frame.size.width, self.cityLbl.frame.size.height);
        self.cityLbl.textAlignment = NSTextAlignmentLeft;
        
        
        self.passwordLbl.text = NSLocalizedStringFromTable(@"password_lbl",appDelegate.culture, @"");
        self.passwordLbl.frame = CGRectMake(60, self.passwordLbl.frame.origin.y, self.passwordLbl.frame.size.width, self.passwordLbl.frame.size.height);
        self.passwordLbl.textAlignment = NSTextAlignmentLeft;
        
        
        self.questionLbl.text = NSLocalizedStringFromTable(@"question_lbl",appDelegate.culture, @"");
        self.questionLbl.frame = CGRectMake(60, self.questionLbl.frame.origin.y, self.questionLbl.frame.size.width, self.questionLbl.frame.size.height);
        self.questionLbl.textAlignment = NSTextAlignmentLeft;
        
        self.answerLbl.text = NSLocalizedStringFromTable(@"answer_lbl",appDelegate.culture, @"");
        self.answerLbl.frame = CGRectMake(60, self.answerLbl.frame.origin.y, self.answerLbl.frame.size.width, self.answerLbl.frame.size.height);
        self.answerLbl.textAlignment = NSTextAlignmentLeft;
        
        
        
        self.usernameTF.placeholder = required;
        self.usernameTF.frame = CGRectMake(181, self.usernameTF.frame.origin.y, self.usernameTF.frame.size.width, self.usernameTF.frame.size.height);
        self.usernameTF.textAlignment = NSTextAlignmentLeft;
        
        self.emailTF.placeholder = required;
        self.emailTF.frame = CGRectMake(181, self.emailTF.frame.origin.y, self.emailTF.frame.size.width, self.emailTF.frame.size.height);
        self.emailTF.textAlignment = NSTextAlignmentLeft;
        
        self.firstnameTF.placeholder = required;
        self.firstnameTF.frame = CGRectMake(181, self.firstnameTF.frame.origin.y, self.firstnameTF.frame.size.width, self.firstnameTF.frame.size.height);
        self.firstnameTF.textAlignment = NSTextAlignmentLeft;
        
        self.familynameTF.placeholder = required;
        self.familynameTF.frame = CGRectMake(181, self.familynameTF.frame.origin.y, self.familynameTF.frame.size.width, self.familynameTF.frame.size.height);
        self.familynameTF.textAlignment = NSTextAlignmentLeft;
        
        self.mobilenumberTF.placeholder = required;
        self.mobilenumberTF.frame = CGRectMake(181, self.mobilenumberTF.frame.origin.y, self.mobilenumberTF.frame.size.width, self.mobilenumberTF.frame.size.height);
        self.mobilenumberTF.textAlignment = NSTextAlignmentLeft;
        
        self.passwordTF.placeholder = required;
        self.passwordTF.frame = CGRectMake(181, self.passwordTF.frame.origin.y, self.passwordTF.frame.size.width, self.passwordTF.frame.size.height);
        self.passwordTF.textAlignment = NSTextAlignmentLeft;
        
        self.questionTF.placeholder = required;
        self.questionTF.frame = CGRectMake(181, self.questionTF.frame.origin.y, self.questionTF.frame.size.width, self.questionTF.frame.size.height);
        self.questionTF.textAlignment = NSTextAlignmentLeft;
        
        self.answerTF.placeholder = required;
        self.answerTF.frame = CGRectMake(181, self.answerTF.frame.origin.y, self.answerTF.frame.size.width, self.answerTF.frame.size.height);
        self.answerTF.textAlignment = NSTextAlignmentLeft;
        
        self.registerButton.frame = CGRectMake(258, self.registerButton.frame.origin.y, self.registerButton.frame.size.width, self.registerButton.frame.size.height);
        [self.registerButton setImage:[UIImage imageNamed:@"registerButton_en.png"] forState:UIControlStateNormal];
        
        self.closeButton.frame = CGRectMake(7, self.closeButton.frame.origin.y, self.closeButton.frame.size.width, self.closeButton.frame.size.height);
        [self.closeButton setImage:[UIImage imageNamed:@"closeButton_en.png"] forState:UIControlStateNormal];
        
        
        [self.listingBgImg setImage:[UIImage imageNamed:@"listing_two_en.png"]];
        
    }
   
    
    self.cityButton.enabled = FALSE;
    ////// Textfields
    
    self.usernameTF.delegate = self;
    self.usernameTF.text = @"";
    self.usernameTF.keyboardAppearance = UIBarStyleBlack;
   
    
    self.emailTF.delegate = self;
    self.emailTF.text = @"";
    self.emailTF.keyboardAppearance = UIBarStyleBlack;
    
    
    self.firstnameTF.delegate = self;
    self.firstnameTF.text = @"";
    self.firstnameTF.keyboardAppearance = UIBarStyleBlack;
    
    
    self.familynameTF.delegate = self;
    self.familynameTF.text = @"";
    self.familynameTF.keyboardAppearance = UIBarStyleBlack;
   
    
    self.mobilenumberTF.delegate = self;
    self.mobilenumberTF.text = @"";
    self.mobilenumberTF.keyboardAppearance = UIBarStyleBlack;
    
    
    
    self.passwordTF.delegate = self;
    self.passwordTF.text = @"";
    self.passwordTF.keyboardAppearance = UIBarStyleBlack;
    
    self.questionTF.delegate = self;
    self.questionTF.text = @"";
    self.questionTF.keyboardAppearance = UIBarStyleBlack;
    
    self.answerTF.delegate = self;
    self.answerTF.text = @"";
    self.answerTF.keyboardAppearance = UIBarStyleBlack;
    
    
    
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
    [self setTitleLbl:nil];
    [self setEmailLbl:nil];
    [self setFirstnameLbl:nil];
    [self setFamilynameLbl:nil];
    [self setMobilenumberLbl:nil];
    [self setCountryLbl:nil];
    [self setCityLbl:nil];
    [self setPasswordLbl:nil];
    [self setEmailTF:nil];
    [self setFirstnameTF:nil];
    [self setEmailTF:nil];
    [self setFamilynameTF:nil];
    [self setMobilenumberTF:nil];
    [self setPasswordTF:nil];
    [self setTheScrollview:nil];
    [self setUsernameTF:nil];
    [self setUsernameLbl:nil];
    [self setCityButton:nil];
    [super viewDidUnload];
}
- (IBAction)registerMethod:(id)sender {
    
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
        NSString * passwordRegEx = @"((?=.*\\d)(?=.*[a-zA-Z])(?=.*\\W).{7,})";
        NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegEx];
        if ([self.usernameTF.text isEqualToString:@""])
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"")  message:NSLocalizedStringFromTable(@"enter_username",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
       else if ([self.emailTF.text isEqualToString:@""])
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"")  message:NSLocalizedStringFromTable(@"enter_email",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if ([emailTest evaluateWithObject:self.emailTF.text] == NO)
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"")  message:NSLocalizedStringFromTable(@"enter_correct_email",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
            
            
        }
        else if ([self.firstnameTF.text isEqualToString:@""])
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_firstname",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if ([self.familynameTF.text isEqualToString:@""])
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_familyname",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if ([self.mobilenumberTF.text isEqualToString:@""])
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_mobile",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if (countryIsSelected == 0)
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"select_country",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if (cityIsSelected == 0)
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"select_city",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if ([self.passwordTF.text isEqualToString:@""])
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_password",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if ([passwordTest evaluateWithObject:self.passwordTF.text] == NO)
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"complex_password",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
            
            
        }
        else if (self.passwordTF.text.length < 7)
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"complex_password",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if ([self.questionTF.text isEqualToString:@""])
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_question",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else if ([self.answerTF.text isEqualToString:@""])
        {
            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"enter_answer",appDelegate.culture, @"")];
            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
            [alert show];
        }
        else
        {
            AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
            AC.center=self.view.center;
            AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
            [AC startLoading];
            [self.view addSubview:AC];
            
            IACADRegister * request = [[IACADRegister alloc]init];
            request.culture = appDelegate.culture;
            request.username = self.usernameTF.text;
            request.email = self.emailTF.text;
            request.firstName = self.firstnameTF.text;
            request.lastName = self.familynameTF.text;
            request.mobile = self.mobilenumberTF.text;
            request.cityId = cityID;
            request.password = self.passwordTF.text;
            request.passwordQuestion = self.questionTF.text;
            request.passwordAnswer = self.answerTF.text;
            
            IACADServiceClient * client = [[IACADServiceClient alloc]init];
            [client RegisterAsyncIsPost:YES input:request caller:self];
        }
    }
    
}

-(void) RegisterCallback:(IACADRegisterResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    IACADRegisterResult * registerResult = response.RegisterResult;
    if (registerResult.RegisterStatus == YES)
    {
        IACADUser * user;
        user = registerResult.User;
        appDelegate.userName = self.usernameTF.text;
        appDelegate.firstName = self.firstnameTF.text;
        appDelegate.lastName = self.familynameTF.text;
        appDelegate.login = 1;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:self.usernameTF.text forKey:@"userName"];
        [prefs setObject:self.firstnameTF.text forKey:@"firstName"];
        [prefs setObject:self.familynameTF.text forKey:@"lastName"];
        [prefs setObject:user.Id forKey:@"userID"];
        [prefs synchronize];
        
        [appDelegate updateRightSideMenu];
        
        ////registrationdone_msg
        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"registrationdone_msg",appDelegate.culture, @"")];
        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:^{
            [self messageAlertAction];
        }];
        
        
        [alert show];
        
   
    }
    else
    {
        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:registerResult.FailureMessage];
        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
        [alert show];


    }
}

-(void) messageAlertAction
{
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

- (IBAction)backMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
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

#pragma mark - Scrollview

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    [self.theScrollview setContentSize:CGSizeMake(320, 730)];
    if (textField.tag==1)
    {
        //[theScrollView setContentOffset:CGPointMake(0, 100) animated:YES];
    }
    else if (textField.tag==2)
        [self.theScrollview setContentOffset:CGPointMake(0, 50) animated:YES];
        
    else if (textField.tag==3)
        [self.theScrollview setContentOffset:CGPointMake(0, 100) animated:YES];
        
    else if (textField.tag==4)
        [self.theScrollview setContentOffset:CGPointMake(0, 130) animated:YES];
        
    else if (textField.tag==5)
        [self.theScrollview setContentOffset:CGPointMake(0, 200) animated:YES];
    
    
    else if (textField.tag==6)
    { CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        [self.theScrollview setContentOffset:CGPointMake(0, 280) animated:YES];
        else
           [self.theScrollview setContentOffset:CGPointMake(0, 240) animated:YES];
    }
    
    else if (textField.tag==7)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
            [self.theScrollview setContentOffset:CGPointMake(0, 300) animated:YES];
        else
            [self.theScrollview setContentOffset:CGPointMake(0, 280) animated:YES];
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
     CGSize result = [[UIScreen mainScreen] bounds].size;
    if(result.height == 480)
        [self.theScrollview setContentSize:CGSizeMake(320, 500)];
    else
        [self.theScrollview setContentSize:CGSizeMake(320, 500)];
    
    if (self.usernameTF.isFirstResponder)
        [self.usernameTF resignFirstResponder];
    
    if (self.emailTF.isFirstResponder)
        [self.emailTF resignFirstResponder];
    
    if (self.firstnameTF.isFirstResponder)
        [self.firstnameTF resignFirstResponder];
    
    if (self.familynameTF.isFirstResponder)
        [self.familynameTF resignFirstResponder];
    
    if (self.mobilenumberTF.isFirstResponder)
        [self.mobilenumberTF resignFirstResponder];
    
    if (self.passwordTF.isFirstResponder)
        [self.passwordTF resignFirstResponder];
    
    if (self.questionTF.isFirstResponder)
        [self.questionTF resignFirstResponder];
    
    if (self.answerTF.isFirstResponder)
        [self.answerTF resignFirstResponder];
    
    [self.theScrollview setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

-(void)countrySelected: (NSString *)countryname :(int)counid
{
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    self.cityButton.enabled = TRUE;
    self.cityLbl.textColor = [UIColor blackColor];
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.countryLbl.text = [converter convertArabic:countryname];
        self.cityLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"city_lbl",appDelegate.culture, @"")];
    }
    else
    {
        self.countryLbl.text = countryname;
        self.cityLbl.text = NSLocalizedStringFromTable(@"city_lbl",appDelegate.culture, @"");
    }
    countryID = counid;
    countryIsSelected = 1;
    cityIsSelected = 0;
    
}

-(void)citySelected: (NSString *)cityname :(int)cityid
{
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    self.cityLbl.textColor = [UIColor blackColor];
    if ([appDelegate.culture isEqualToString:@"ar"])
    self.cityLbl.text = [converter convertArabic:cityname];
    else
        self.cityLbl.text = cityname;
    cityIsSelected = 1;
    cityID = cityid;
    
}

- (IBAction)cityMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    cityListViewController * cityList = [[cityListViewController alloc]init:self:countryID];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:cityList animated:NO];
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
- (IBAction)countryMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    countrtyListViewController * countryList = [[countrtyListViewController alloc]init:self];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:countryList animated:NO];
    }
}
@end
