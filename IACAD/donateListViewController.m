//
//  donateListViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/14/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "donateListViewController.h"
#import "ArabicConverter.h"
#import "IIViewDeckController.h"
#import "IACADServiceClient.h"
#import "IACADGetAllDonationTypesResponse.h"
#import "IACADGetAllDonationTypes.h"
#import "IACADServiceClient.h"
#import "IACADDonationType.h"
#import "AsyncImageView.h"
#import "donateDetailsListViewController.h"
#import "donateGridListViewController.h"
#import "CustomizedACView.h"
#import <QuartzCore/QuartzCore.h>

@interface donateListViewController ()

@end

@implementation donateListViewController

-(id)init:(id)del{
	if(self = [super init])
	{
        delegate = del;
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
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"donate_title",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
    }
    else
    {
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        self.titleLbl.text = NSLocalizedStringFromTable(@"donate_title",appDelegate.culture, @"");
    }
    
    
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    IACADGetAllDonationTypes *request = [[IACADGetAllDonationTypes alloc] init];
    request.culture = appDelegate.culture;
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetAllDonationTypesAsyncIsPost:YES input:request caller:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
}

- (void)GetAllDonationTypesCallback:(IACADGetAllDonationTypesResponse *)response error:(NSError *)error {
    [AC stopLoading];
    donateList = [[NSMutableArray alloc]init];
    donateList = response.GetAllDonationTypesResult;
    if ([donateList count]>0)
        [self fillScrollview];
    
    
}

-(void) fillScrollview
{
    
    self.theScrollview.alpha = 1;
    int yy1 = 10;
    int yy2 = 10;
    
    for (int i=0;i<[donateList count];i++)
    {
        IACADDonationType * donationType = [donateList objectAtIndex:i];
        UIFont *boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
            boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
        else
            boldFont=[UIFont systemFontOfSize:12];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        
        int y;
        int x;
        
        if (i%2 == 0)
        {
            y = yy1;
            x = 163;
        }
        else
        {
            y = yy2;
            x = 10;
        }
        UIView *itemBG = [[UIView alloc] init];
        [itemBG setBackgroundColor:[UIColor whiteColor]];
        [itemBG setFrame:CGRectMake(x,y,147,175)];
        [self.theScrollview addSubview:itemBG];
        
        UILabel * itemLbl = [[UILabel alloc] initWithFrame:CGRectMake(x,y+150,147,20)];
        
        if ([appDelegate.culture isEqualToString:@"ar"]) {
            [itemLbl setLineBreakMode:NSLineBreakByTruncatingHead];
            itemLbl.text = [converter convertArabic: donationType.Name];
        }
        else {
            [itemLbl setLineBreakMode:NSLineBreakByTruncatingTail];
            itemLbl.text = donationType.Name;
        }
        itemLbl.font = boldFont;
        itemLbl.textAlignment = UITextAlignmentCenter;
        itemLbl.backgroundColor=[UIColor clearColor];
        itemLbl.textColor=[UIColor blackColor];
        [self.theScrollview addSubview:itemLbl];
        
        AsyncImageView * asyncImageView = [[AsyncImageView alloc] init];
        asyncImageView.frame = CGRectMake(x+2,y+2, 143, 143);
        NSString * imageURL;
        imageURL = [@"http://iacadcld.linkdev.com/Handlers/ShowImage.ashx?Guidid=" stringByAppendingString:donationType.Image1ID];
        NSURL *url = [NSURL URLWithString:imageURL];
        asyncImageView.activityIndicatorStyle = UIActivityIndicatorViewStyleGray;
        [asyncImageView setImageURL:url];
        asyncImageView.backgroundColor=[UIColor clearColor];
        [self.theScrollview addSubview:asyncImageView];
        
        UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
        UIButton * donateButton =[[UIButton alloc]initWithFrame:CGRectMake(x,y,147,175)];
        donateButton.tag = i;
        [donateButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [donateButton addTarget:self action:@selector(donationDetailsMethod:) forControlEvents:UIControlEventTouchUpInside];
        [self.theScrollview addSubview:donateButton];
        
        
        if (i%2 == 0)
            yy1 = yy1 + 180;
        else
            yy2 = yy2 + 180;
        
    }
    
    [self.theScrollview setContentSize:CGSizeMake(320, yy1+5)];
}

-(void) donationDetailsMethod:(id)sender
{
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        
        
        UIButton *b = (UIButton *)sender;
        IACADDonationType * donationType = [donateList objectAtIndex:b.tag];
        
        if (donationType.CategoryId != 2) {
            donateDetailsListViewController * donateListDetails = [[donateDetailsListViewController alloc]init:donationType.Id:donationType.Name:donationType.IsQuantitative];
            CATransition* transition = [CATransition animation];
            transition.duration = 0.3;
            transition.type = kCATransitionPush;
            if ([appDelegate.culture isEqualToString:@"ar"])
                transition.subtype = kCATransitionFromLeft;
            else
                transition.subtype = kCATransitionFromRight;
            [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
            [self.navigationController pushViewController:donateListDetails animated:NO];
        }
        else {
            donateGridListViewController * donateListDetails = [[donateGridListViewController alloc] init:donationType.Id :donationType.Name];
            CATransition* transition = [CATransition animation];
            transition.duration = 0.3;
            transition.type = kCATransitionPush;
            if ([appDelegate.culture isEqualToString:@"ar"])
                transition.subtype = kCATransitionFromLeft;
            else
                transition.subtype = kCATransitionFromRight;
            [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
            [self.navigationController pushViewController:donateListDetails animated:NO];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuMethod:(id)sender {
    [self.viewDeckController toggleRightView];
    [self.viewDeckController toggleLeftView];
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

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    float currentVersion = 7.0;
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion) {
//        self.view.frame = CGRectMake(0, 20, 320, self.view.frame.size.height-40);
//        self.tabbarImg.frame  =  CGRectMake(0, -20,320,66);
//    }
//}

- (void)viewDidUnload {
    [self setTitleLbl:nil];
    [self setTheScrollview:nil];
    [super viewDidUnload];
}
@end
