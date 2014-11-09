//
//  aboutViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/22/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "aboutViewController.h"
#import "IIViewDeckController.h"
#import "ArabicConverter.h"
#import "aboutGateViewController.h"
#import "aboutOfficeViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface aboutViewController ()

@end

@implementation aboutViewController

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
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_about",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        self.officeLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"zakat_lbl",appDelegate.culture, @"")];
        self.officeLbl.font = boldFont;
        
        self.gateLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"gate_lbl",appDelegate.culture, @"")];
        self.gateLbl.font = boldFont;
    }
    else
    {
        self.menuButton.frame = CGRectMake(0, self.menuButton.frame.origin.y, self.menuButton.frame.size.width, self.menuButton.frame.size.height);
        self.menuButtonImg.frame = CGRectMake(9, self.menuButtonImg.frame.origin.y, self.menuButtonImg.frame.size.width, self.menuButtonImg.frame.size.height);
        
        self.titleLbl.text = NSLocalizedStringFromTable(@"side_about",appDelegate.culture, @"");
        self.officeLbl.text = NSLocalizedStringFromTable(@"zakat_lbl",appDelegate.culture, @"");
        self.officeLbl.textAlignment = NSTextAlignmentLeft;
        
        self.gateLbl.text = NSLocalizedStringFromTable(@"gate_lbl",appDelegate.culture, @"");
        self.gateLbl.textAlignment = NSTextAlignmentLeft;
        
        self.arrow1Img.frame = CGRectMake(291, self.arrow1Img.frame.origin.y, self.arrow1Img.frame.size.width, self.arrow1Img.frame.size.height);
        [self.arrow1Img setImage:[UIImage imageNamed:@"greenarrow_en.png"]];
        
        self.arrow2Img.frame = CGRectMake(291, self.arrow2Img.frame.origin.y, self.arrow2Img.frame.size.width, self.arrow2Img.frame.size.height);
        [self.arrow2Img setImage:[UIImage imageNamed:@"greenarrow_en.png"]];
    }
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
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
    [self setOfficeLbl:nil];
    [self setGateLbl:nil];
    [super viewDidUnload];
}
- (IBAction)aboutOfficeMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    aboutOfficeViewController * aboutOffice = [[aboutOfficeViewController alloc]init];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:aboutOffice animated:NO];
    }
}

- (IBAction)aboutGateMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    aboutGateViewController * aboutGate = [[aboutGateViewController alloc]init];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:aboutGate animated:NO];
    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ! ([touch.view isKindOfClass:[UIControl class]]);
}

-(void)detectTapGesture {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
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

- (IBAction)openmenuMethod:(id)sender {
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController toggleRightView];
    else
        [self.viewDeckController toggleLeftView];
}
@end
