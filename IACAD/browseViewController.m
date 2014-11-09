//
//  browseViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/20/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "browseViewController.h"
#import "IIViewDeckController.h"
#import "ArabicConverter.h"
#import "statisticsViewController.h"
#import "charitiesListViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface browseViewController ()

@end

@implementation browseViewController

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
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"browse_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        self.charitiesLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"")];
        self.charitiesLbl.font = boldFont;
        
        self.statisticsLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"statistics_lbl",appDelegate.culture, @"")];
        self.statisticsLbl.font = boldFont;
    }
    else
    {
      self.titleLbl.text = NSLocalizedStringFromTable(@"browse_lbl",appDelegate.culture, @"");
        
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        self.charitiesLbl.text = NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"");
        self.charitiesLbl.textAlignment = NSTextAlignmentLeft;
        
        self.statisticsLbl.text = NSLocalizedStringFromTable(@"statistics_lbl",appDelegate.culture, @"");
        self.statisticsLbl.textAlignment = NSTextAlignmentLeft;
        
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
    [self setCharitiesLbl:nil];
    [self setStatisticsLbl:nil];
    [super viewDidUnload];
}
- (IBAction)charitiesMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    charitiesListViewController * charities = [[charitiesListViewController alloc]init:0];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:charities animated:NO];
    }
}

- (IBAction)statisticsMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    statisticsViewController * stat = [[statisticsViewController alloc]init];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:stat animated:NO];
    }
}

- (IBAction)backMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromRight;
        else
           transition.subtype = kCATransitionFromLeft;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController popViewControllerAnimated:NO];
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


- (IBAction)menuopenMethod:(id)sender {
   // [self.viewDeckController toggleRightView];
}
@end
