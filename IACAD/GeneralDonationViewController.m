//
//  GeneralDonationViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 9/4/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "GeneralDonationViewController.h"
#import "ArabicConverter.h"
#import "CustomizedACView.h"
#import <QuartzCore/QuartzCore.h>
#import "IACADGetAnonymousDonationTypes.h"
#import "IACADGetAnonymousDonationTypesResponse.h"
#import "IACADGeneralDonationType.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "LoginViewController.h"
#import "BlockAlertView.h"
#import "IIViewDeckController.h"
#import "IACADAnonymiousDonationItem.h"
#import "IACADAddAnonymiousDonation.h"
#import "IACADAddAnonymiousDonationResponse.h"


@interface GeneralDonationViewController ()

@end

@implementation GeneralDonationViewController


-(id)init:(int) charID{
	if(self = [super init])
	{
        charityID = charID;
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
        UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"general_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        
        self.totalLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"total_donation_lbl",appDelegate.culture, @"")];
        self.totalLbl.font = boldFont2;
        
        int total = 0;
        NSString* myNewString = [NSString stringWithFormat:@"%i", total];
        NSString * temp = [myNewString stringByAppendingString:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
        self.totalCountLbl.text = [converter convertArabic:temp];
        self.totalCountLbl.font = boldFont2;
    }
    else
    {
        self.titleLbl.text = NSLocalizedStringFromTable(@"general_lbl",appDelegate.culture, @"");
        self.totalLbl.text = NSLocalizedStringFromTable(@"total_donation_lbl",appDelegate.culture, @"");
        
        int total = 0;
        NSString* myNewString = [NSString stringWithFormat:@"%i", total];
        NSString * temp = [myNewString stringByAppendingString:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
        self.totalCountLbl.text = temp;
        
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        self.donateButton.frame = CGRectMake(258, self.donateButton.frame.origin.y, self.donateButton.frame.size.width, self.donateButton.frame.size.height);
        [self.donateButton setImage:[UIImage imageNamed:@"donnateButton_en2.png"] forState:UIControlStateNormal];
        
        [self.greenbarImg setImage:[UIImage imageNamed:@"donnate_total_bar_en.png"]];
        
        self.totalCountLbl.frame = CGRectMake(208, self.totalCountLbl.frame.origin.y, self.totalCountLbl.frame.size.width, self.totalCountLbl.frame.size.height);
        
        self.totalLbl.frame = CGRectMake(27, self.totalLbl.frame.origin.y, self.totalLbl.frame.size.width, self.totalLbl.frame.size.height);
        
    }
    
    
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];

    
    IACADGetAnonymousDonationTypes * request = [[IACADGetAnonymousDonationTypes alloc]init];
    request.culture = appDelegate.culture;
    request.charityId = charityID;
    
    IACADServiceClient * client = [[IACADServiceClient alloc]init];
    [client GetAnonymousDonationTypesAsyncIsPost:YES input:request caller:self];
   
}

-(void)GetAnonymousDonationTypesCallback:(IACADGetAnonymousDonationTypesResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    donateList = [[NSMutableArray alloc]init];
    donateList = response.GetAnonymousDonationTypesResult;
    if ([donateList count]>0)
        [self fillScrollview];

}

-(void) fillScrollview
{
    self.scrollView.alpha = 1;
    self.greenbarImg.alpha = 1;
    self.totalLbl.alpha = 1;
    self.totalCountLbl.alpha = 1;
    self.donateButton.enabled = TRUE;
    self.donateButton.alpha = 1;
    self.webView.alpha = 0;
 
    
    int y = 5;
    
    for (int i=0;i<[donateList count];i++)
    {
        IACADGeneralDonationType * donationType = [donateList objectAtIndex:i];
        UIFont *boldFont;
        UIFont *boldFont2;
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        }
        else
        {
            boldFont=[UIFont systemFontOfSize:14];
            boldFont2=[UIFont systemFontOfSize:14];
        }
        
        
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        
       UIImageView * bgBarImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,y,312,61)];
       // bgBarImage.tag = i + 100000;
        if ([appDelegate.culture isEqualToString:@"ar"])
            [bgBarImage setImage:[UIImage imageNamed:@"general-listing_bg_gray.png"]];
        else
           [bgBarImage setImage:[UIImage imageNamed:@"general-listing_bg_gray_en.png"]];
        [self.scrollView addSubview:bgBarImage];
        
        UILabel * itemLbl = [[UILabel alloc]init];
        itemLbl.numberOfLines = 2;
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            // Mina
            itemLbl.frame = CGRectMake(120, y+0, 170, 60);
             itemLbl.textAlignment = NSTextAlignmentRight;
            itemLbl.text = [converter convertArabic: donationType.Name];
        }
        else
        {
            itemLbl.frame = CGRectMake(10, y+0, 170, 60);
            itemLbl.textAlignment = NSTextAlignmentLeft;
            itemLbl.text = donationType.Name;
        }
        
        itemLbl.font = boldFont;
        itemLbl.backgroundColor=[UIColor clearColor];
        itemLbl.textColor = [UIColor colorWithRed:137/255.f
                                                 green:137/255.f
                                                  blue:137/255.f
                                                 alpha:1.0];
        [self.scrollView addSubview:itemLbl];
        
        UILabel * drhmLbl = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            drhmLbl.frame = CGRectMake(8, y+23, 43, 20);
            drhmLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
            drhmLbl.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            drhmLbl.frame = CGRectMake(265, y+23, 43, 20);
            drhmLbl.text = NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"");
            drhmLbl.textAlignment = NSTextAlignmentLeft;
        }
        
        
        drhmLbl.font = boldFont;
        drhmLbl.backgroundColor=[UIColor clearColor];
        drhmLbl.textColor = [UIColor colorWithRed:137/255.f
                                            green:137/255.f
                                             blue:137/255.f
                                            alpha:1.0];
//        [self.scrollView addSubview:drhmLbl];
       
       UITextField * amoutTF = [[UITextField alloc] init];
        [amoutTF setTextAlignment:NSTextAlignmentCenter];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            amoutTF.text = [converter convertArabic: @""];
            amoutTF.placeholder=[converter convertArabic:@"0"];
            amoutTF.frame=CGRectMake(20,y+23,75,20);
        }
        else
        {
            amoutTF.text = @"";
            amoutTF.placeholder=@"0";
            amoutTF.frame=CGRectMake(180,y+23,75,20);
        }
        
        amoutTF.textAlignment = UITextAlignmentCenter;
        amoutTF.font = boldFont2;
        amoutTF.returnKeyType=UIReturnKeyDefault;
        amoutTF.borderStyle = UITextBorderStyleNone;
        amoutTF.textColor=[UIColor colorWithRed:137/255.f
                                          green:137/255.f
                                           blue:137/255.f
                                          alpha:1.0];
        amoutTF.keyboardType = UIKeyboardTypeNumberPad;
        amoutTF.autocorrectionType = UITextAutocorrectionTypeNo;
        amoutTF.backgroundColor=[UIColor clearColor];
        amoutTF.tag = i+1000000;
        amoutTF.delegate = self;
        [amoutTF addTarget:self action:@selector(updateLabelUsingContentsOfTextField:) forControlEvents:UIControlEventEditingChanged];
        amoutTF.keyboardAppearance = UIBarStyleBlack;
        [self.scrollView addSubview:amoutTF];
        
        
         bgBarImage.tag = amoutTF.tag + 100000;
        
        
        y = y+61;
    }
    
    [self.scrollView setContentSize:CGSizeMake(312, y+5)];
    
    
  
}

- (void)updateLabelUsingContentsOfTextField:(id)sender {
    
     
    
    int value = [((UITextField *)sender).text intValue];
    int tag = ((UITextField *)sender).tag;
    NSLog(@"tag %i",tag);
    
    if (value > 0)
    {
        UIImageView *imageView = (UIImageView *)[self.scrollView viewWithTag:tag+100000];
        if ([appDelegate.culture isEqualToString:@"ar"])
            imageView.image=[UIImage imageNamed:@"general-listing_bg_green.png"];
        else
            imageView.image=[UIImage imageNamed:@"general-listing_bg_green_en.png"];
        
    }
    else
    {
        UIImageView *imageView = (UIImageView *)[self.scrollView viewWithTag:tag+100000];
        if ([appDelegate.culture isEqualToString:@"ar"])
            imageView.image=[UIImage imageNamed:@"general-listing_bg_gray.png"];
        else
            imageView.image=[UIImage imageNamed:@"general-listing_bg_gray_en.png"];
    }
    
    
    
    long total = 0;
    for (int i=0;i<[donateList count];i++)
    {
        UITextField *textField = (UITextField *)[self.scrollView viewWithTag:i+1000000];
        NSLog(@"aaaaa %@",textField.text);
        int counttemp = [textField.text intValue];
        total = total + counttemp;
    }
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
          ArabicConverter *converter = [[ArabicConverter alloc] init];
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:16];
        NSString* myNewString = [NSString stringWithFormat:@"%li", total];
        NSString * temp = [myNewString stringByAppendingString:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
        self.totalCountLbl.text = [converter convertArabic:temp];
        self.totalCountLbl.font = boldFont;
    }
    else
    {
        NSString* myNewString = [NSString stringWithFormat:@"%li", total];
        NSString * temp = [myNewString stringByAppendingString:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
        self.totalCountLbl.text = temp;
    }
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)donateMethod:(id)sender {
    
    [self.view endEditing:YES];
    
   
        [self checkValue];

}



-(void)checkValue
{
    int tot = [self.totalCountLbl.text intValue];
    if (tot > 0)
    {
         [self startDonation];
    }
    else
    {
        NSString * textString = NSLocalizedStringFromTable(@"enter_donation",appDelegate.culture, @"");
//        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"")  message:textString];
//        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
//        [alert show];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:textString delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
        [alert show];
        
    }
}

-(void) startDonation
{
    self.donateButton.enabled = FALSE;
    [finalDonataionList removeAllObjects];
    finalDonataionList = nil;
    finalDonataionList = [[NSMutableArray alloc]init];
    for (int i=0;i<[donateList count];i++)
    {
        UITextField *textField = (UITextField *)[self.scrollView viewWithTag:i+1000000];
        int counttemp = [textField.text intValue];
        if (counttemp > 0)
        {
            IACADGeneralDonationType * donationType = [donateList objectAtIndex:i];
            NSLog(@"donate id %i",donationType.Id);
            IACADAnonymiousDonationItem * item = [[IACADAnonymiousDonationItem alloc]init];
            item.DonationTypeID = donationType.Id;
            item.Amount = counttemp;
            [finalDonataionList addObject:item];
        }
    }
   /* AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC]; */
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    IACADAddAnonymiousDonation * request = [[IACADAddAnonymiousDonation alloc]init];
    request.culture = appDelegate.culture;
    request.charityId = charityID;
    request.items = finalDonataionList;
    
    IACADServiceClient * client = [[IACADServiceClient alloc]init];
    [client AddAnonymiousDonationAsyncIsPost:YES input:request caller:self];
}


-(void) AddAnonymiousDonationCallback:(IACADAddAnonymiousDonationResponse *)response error:(NSError *)error
{
    //[AC stopLoading];
    returnResponse = response.AddAnonymiousDonationResult;
    NSLog(@"return URL %@",returnResponse);
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:returnResponse]];
//    [self viewWebview:returnResponse];
}


-(void) viewWebview: (NSString *)htmlString
{
    self.scrollView.alpha = 0;
    self.greenbarImg.alpha = 0;
    self.totalLbl.alpha = 0;
    self.totalCountLbl.alpha = 0;
    self.donateButton.enabled = FALSE;
    self.donateButton.alpha = 0;
    self.webView.alpha = 1;
    self.webView.delegate = self;
    
    [self makeBodyBackgoundTransparent];
    for (UIView* subView in [self.webView subviews])
    {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            for (UIView* shadowView in [subView subviews])
            {
                if ([shadowView isKindOfClass:[UIImageView class]]) {
                    [shadowView setHidden:YES];
                }
            }
        }
    }
  //  [self.webView loadHTMLString:htmlString baseURL:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:htmlString]]];
    
}

- (void)makeBodyBackgoundTransparent {
    for (UIView *subview in [self.webView subviews]) {
        [subview setOpaque:NO];
        [subview setBackgroundColor:[UIColor clearColor]];
    }
    [self.webView setOpaque:NO];
    [self.webView setBackgroundColor:[UIColor clearColor]];
}


-(void) webViewDidFinishLoad:(UIWebView *)webView
{
  //  [AC stopLoading];
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


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
        if (range.location>4)
        {
            return NO;
        }
        else
            return YES;
}

- (void)viewDidUnload {
    [self setTitleLbl:nil];
    [self setTotalLbl:nil];
    [self setTotalCountLbl:nil];
    [self setScrollView:nil];
    [self setGreenbarImg:nil];
    [self setDonateButton:nil];
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
