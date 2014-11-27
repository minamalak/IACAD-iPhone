//
//  DonationHistoryItemDetailsViewController.m
//  IACAD
//
//  Created by Mina Malak on 11/9/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import "DonationHistoryItemDetailsViewController.h"
#import "ArabicConverter.h"
#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
#import "IIViewDeckController.h"
#import "CustomizedACView.h"
#import "BlockAlertView.h"

@interface DonationHistoryItemDetailsViewController ()

@end

@implementation DonationHistoryItemDetailsViewController

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
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:_item.Name];
        self.titleLbl.font = boldFont;
    }
    else
    {
        self.titleLbl.text = _item.Name;
    }
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    [self getProjectItemDetails];
}

-(void) getProjectItemDetails
{
    IACADGetProject * request = [[IACADGetProject alloc]init];
    request.culture = appDelegate.culture;
    request.donorID = _item.DonorId;
    request.projectID = _item.ProjectID;
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetProjectAsyncIsPost:YES input:request caller:self];
}

- (void)GetProjectCallback:(IACADGetProjectResponse *)response error:(NSError *)error
{
    IACADProjectsData *itemDetails = response.GetProjectResult;
    
    [self fillScrollView:itemDetails];
    [AC stopLoading];
}

-(void) fillScrollView :(IACADProjectsData *) itemDetails
{
    [_lblCharity setText:itemDetails.CharityName];
    [_lblCountryName setText:itemDetails.CountryName];
    [_lblDescription setText:itemDetails.Description];
    [_lblType setText:itemDetails.Type];
    [_lblArea setText:itemDetails.Area];
    [_lblContractDateString setText:itemDetails.ContractDateString];
    [_lblID setText:[NSString stringWithFormat:@"%@", itemDetails.Id]];
    [_lblInitialDuration setText:itemDetails.InitialDuration];
    [_lblPercentCompleted setText:itemDetails.PercentCompleted];
    [_lblTotalCost setText:itemDetails.TotalCost];
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont * boldFont = [UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        [_lblCharity setFont:boldFont];
        [_lblCountryName setFont:boldFont];
        [_lblDescription setFont:boldFont];
        [_lblType setFont:boldFont];
        [_lblArea setFont:boldFont];
        [_lblContractDateString setFont:boldFont];
        [_lblInitialDuration setFont:boldFont];
        [_lblID setFont:boldFont];
        [_lblPercentCompleted setFont:boldFont];
        [_lblTotalCost setFont:boldFont];
        
        [_lblCharityTitle setFont:boldFont];
        [_lblCountryNameTitle setFont:boldFont];
        [_lblDescriptionTitle setFont:boldFont];
        [_lblTypeTitle setFont:boldFont];
        [_lblAreaTitle setFont:boldFont];
        [_lblContractDateStringTitle setFont:boldFont];
        [_lblInitialDurationTitle setFont:boldFont];
        [_lblIDTitle setFont:boldFont];
        [_lblPercentCompletedTitle setFont:boldFont];
        [_lblTotalCostTitle setFont:boldFont];
    }
    [_scrollView setAlpha:1];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
