//
//  LoginViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/5/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "LoginViewController.h"
#import "SigningViewController.h"
#import "IIViewDeckController.h"
#import "ArabicConverter.h"
#import <QuartzCore/QuartzCore.h>
#import "NewuserViewController.h"
#import "editProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ChangePasswordViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(id)init :(int)ty
{
	if(self = [super init])
	{
        type = ty;
        /// type=0 -> Side menu
        /// type=1 -> Donate
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.countViews = 1;
	}
	return self;
}

-(id)init :(int)ty :(id) donateDelegate
{
    if(self = [super init])
    {
        type = ty;
        delegate = donateDelegate;
        /// type=0 -> Side menu
        /// type=1 -> Donate
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.countViews = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.view.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    
    if (type == 0)
    {
        self.menuButton.alpha = 1;
        self.menuButton.enabled = TRUE;
        self.menuImage.alpha = 1;
        self.closeButton.enabled = FALSE;
        self.closeButton.alpha = 0;
    }
    if (type == 1)
    {
        self.menuButton.alpha = 0;
        self.menuButton.enabled = FALSE;
        self.menuImage.alpha = 0;
        self.closeButton.enabled = TRUE;
        self.closeButton.alpha = 1;
    }
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"register_title_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        if (appDelegate.login == 1) {
            self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"registered_title_lbl",appDelegate.culture, @"")];
        }
        
        _labelLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"register_or_login_lbl",appDelegate.culture, @"")];
    }
    else
    {
        self.titleLbl.text = NSLocalizedStringFromTable(@"register_title_lbl",appDelegate.culture, @"");
        
        self.menuButton.frame = CGRectMake(0, self.menuButton.frame.origin.y, self.menuButton.frame.size.width, self.menuButton.frame.size.height);
        self.menuImage.frame = CGRectMake(9, self.menuImage.frame.origin.y, self.menuImage.frame.size.width, self.menuImage.frame.size.height);
        
        self.closeButton.frame = CGRectMake(7, self.closeButton.frame.origin.y, self.closeButton.frame.size.width, self.closeButton.frame.size.height);
        
        [self.closeButton setImage:[UIImage imageNamed:@"closeButton_en.png"] forState:UIControlStateNormal];
        
        if (appDelegate.login == 1) {
            self.titleLbl.text = NSLocalizedStringFromTable(@"registered_title_lbl",appDelegate.culture, @"");
        }
        _labelLbl.text = NSLocalizedStringFromTable(@"register_or_login_lbl",appDelegate.culture, @"");
    }
    
    
    /*  self.view.layer.shadowColor = [UIColor blackColor].CGColor;
     self.view.layer.shadowOffset = CGSizeMake(5.0f, 3.0f);
     self.view.layer.shadowOpacity = 30.0f;
     self.view.layer.shadowRadius = 10.0f; */
    
    int x = 1;
    
    if (x == 0)
    {
        self.loginButton.alpha = 0;
        self.logoutButton.alpha = 1;
    }
    else
    {
        self.logoutButton.alpha = 0;
        self.loginButton.alpha = 1;
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    [self updateView];
    
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
}


-(void) updateView
{
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:20];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.labelLbl.font = boldFont;
        self.newuserLbl.font = boldFont2;
        _lblChangePassword.font = boldFont2;
        
        if (appDelegate.login == 0)
        {
            self.labelLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"register_or_login_lbl",appDelegate.culture, @"")];
            
            
            [self.loginButton setImage:[UIImage imageNamed:@"loginbutton.png"] forState:UIControlStateNormal];
            
            self.newuserLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"register_new_user_lbl",appDelegate.culture, @"")];
            
            [_lblChangePassword setAlpha:0];
            [_btnChangePassword setAlpha:0];
            [_labelLbl setAlpha:1];
            
        }
        else
        {
            NSString * welcome;
            welcome = [NSString stringWithFormat:@"مرحبا، %@ %@", appDelegate.firstName, appDelegate.lastName];
            _titleLbl.text = [converter convertArabic:welcome];
            
            [self.loginButton setImage:[UIImage imageNamed:@"logoutbutton.png"] forState:UIControlStateNormal];
            
            self.newuserLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"edit_lbl",appDelegate.culture, @"")];
            
            _lblChangePassword.text = [converter convertArabic:NSLocalizedStringFromTable(@"change_password", appDelegate.culture, @"")];
            [_lblChangePassword setAlpha:1];
            [_btnChangePassword setAlpha:1];
            [_labelLbl setAlpha:0];
        }
        
    }
    else
    {
        if (appDelegate.login == 0)
        {
            self.labelLbl.text = NSLocalizedStringFromTable(@"register_or_login_lbl",appDelegate.culture, @"");
            
            self.newuserLbl.text = NSLocalizedStringFromTable(@"register_new_user_lbl",appDelegate.culture, @"");
            
            [self.loginButton setImage:[UIImage imageNamed:@"loginbutton_en.png"] forState:UIControlStateNormal];
            
            [_lblChangePassword setAlpha:0];
            [_btnChangePassword setAlpha:0];
             [_labelLbl setAlpha:1];
        }
        else
        {
            NSString * welcome = [appDelegate.firstName stringByAppendingString:@" "];
            welcome = [welcome stringByAppendingString:appDelegate.lastName];
            welcome = [@"Welcome, " stringByAppendingString:welcome];
            _titleLbl.text = welcome;
            
            [self.loginButton setImage:[UIImage imageNamed:@"logoutbutton_en.png"] forState:UIControlStateNormal];
            
            self.newuserLbl.text = NSLocalizedStringFromTable(@"edit_lbl",appDelegate.culture, @"");
            
            _lblChangePassword.text = NSLocalizedStringFromTable(@"change_password", appDelegate.culture, @"");
            [_lblChangePassword setAlpha:1];
            [_btnChangePassword setAlpha:1];
             [_labelLbl setAlpha:0];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMenuButton:nil];
    [self setLoginButton:nil];
    [self setLogoutButton:nil];
    [self setTitleLbl:nil];
    [self setLabelLbl:nil];
    [self setNewuserButton:nil];
    [self setNewuserLbl:nil];
    [self setMenuImage:nil];
    [self setCloseButton:nil];
    [super viewDidUnload];
}
- (IBAction)openmenuMethod:(id)sender {
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController toggleRightView];
    else
        [self.viewDeckController toggleLeftView];
}
- (IBAction)loginMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        if (appDelegate.login == 0)
        {
            SigningViewController * signView = [[SigningViewController alloc]init:delegate];
            CATransition* transition = [CATransition animation];
            transition.duration = 0.3;
            transition.type = kCATransitionReveal;
            transition.subtype = kCATransitionFromTop;
            [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
            [self.navigationController pushViewController:signView animated:NO];
        }
        else
        {
            appDelegate.userName = @"";
            appDelegate.firstName = @"";
            appDelegate.lastName = @"";
            appDelegate.login = 0;
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setObject:@"" forKey:@"userName"];
            [prefs setObject:@"" forKey:@"firstName"];
            [prefs setObject:@"" forKey:@"lastName"];
            [prefs synchronize];
            
            
            // Mina
            [appDelegate.navControl popToRootViewControllerAnimated:NO];
            if ([appDelegate.culture isEqualToString:@"ar"])
                [self.viewDeckController closeRightViewAnimated:YES];
            else
                [self.viewDeckController closeLeftViewAnimated:YES];
            
            [self updateView];
        }
    }
}

-(IBAction)changePasswordAction
{
    ChangePasswordViewController * changePassword = [[ChangePasswordViewController alloc]init];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromTop;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:changePassword animated:NO];
}

- (IBAction)logoutMethod:(id)sender {
    
    NSLog(@"logout");
}
- (IBAction)newuserMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        if (appDelegate.login == 0)
        {
            NewuserViewController * newuser = [[NewuserViewController alloc]init];
            CATransition* transition = [CATransition animation];
            transition.duration = 0.3;
            transition.type = kCATransitionReveal;
            transition.subtype = kCATransitionFromTop;
            [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
            [self.navigationController pushViewController:newuser animated:NO];
        }
        else
        {
            editProfileViewController * editprofile = [[editProfileViewController alloc]init];
            CATransition* transition = [CATransition animation];
            transition.duration = 0.3;
            transition.type = kCATransitionReveal;
            transition.subtype = kCATransitionFromTop;
            [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
            [self.navigationController pushViewController:editprofile animated:NO];
        }
        
        
    }
}

- (IBAction)closeMethod:(id)sender {
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

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ! ([touch.view isKindOfClass:[UIControl class]]);
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

-(void)detectTapGesture {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    
}

@end
