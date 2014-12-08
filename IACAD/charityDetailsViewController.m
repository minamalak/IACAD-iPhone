//
//  charityDetailsViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/20/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "charityDetailsViewController.h"
#import "ArabicConverter.h"
#import "IACADCharity.h"
#import "AsyncImageView.h"
#import "IIViewDeckController.h"
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface charityDetailsViewController ()

@end

@implementation charityDetailsViewController

-(id)init: (IACADCharity *)item
{
	if(self = [super init])
	{
        itemDetails = item;
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
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        
        self.nameLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"asembly_lbl",appDelegate.culture, @"")];
        self.nameLbl.font = boldFont2;
        
        
        self.nameString.text = [converter convertArabic:itemDetails.Name];
        self.nameString.font = boldFont2;
        
        
        self.descLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"desc_lbl",appDelegate.culture, @"")];
        self.descLbl.font = boldFont2;
        
        self.descString.text = [converter convertArabic:itemDetails.Description];
        self.descString.font = boldFont2;
        
        NSString * text1 = @"";
        text1 = [converter convertArabic:itemDetails.DepartmentsCombined];
        self.activityString.text = text1;
        self.activityString.font = boldFont2;
        
        /*  if ([text1 isEqualToString:@""])
         self.activityLbl.alpha = 0;
         else
         self.activityLbl.alpha = 1; */
        self.activityLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"activites_lbl",appDelegate.culture, @"")];
        self.activityLbl.font = boldFont2;
        
        
        
        self.phoneLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"telephone_lbl",appDelegate.culture, @"")];
        self.phoneLbl.font = boldFont2;
        
        self.phoneString.text = [converter convertArabic:itemDetails.Phone];
        self.phoneString.font = boldFont2;
        
        
        self.faxLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"fax_lbl",appDelegate.culture, @"")];
        self.faxLbl.font = boldFont2;
        
        self.faxString.text = [converter convertArabic:itemDetails.Fax];
        self.faxString.font = boldFont2;
        
        
        self.websiteLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"website_lbl",appDelegate.culture, @"")];
        self.websiteLbl.font = boldFont2;
        
        self.websiteString.text = [converter convertArabic:itemDetails.WebSite];
        self.websiteString.font = boldFont2;
        
        self.emailLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"email_lbl",appDelegate.culture, @"")];
        self.emailLbl.font = boldFont2;
        
        //        self.emailLbl.frame = CGRectMake(self.emailLbl.frame.origin.x, self.websiteLbl.frame.origin.y+60, self.emailLbl.frame.size.width, self.emailLbl.frame.size.height);
        
        self.emailString.text = [converter convertArabic:itemDetails.Email];
        self.emailString.font = boldFont2;
        
        //        self.emailString.frame = CGRectMake(self.emailString.frame.origin.x, self.websiteString.frame.origin.y+60, self.emailString.frame.size.width, self.emailString.frame.size.height);
        
        
    }
    else
    {
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        self.titleLbl.text = NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"");
        
        
        self.nameLbl.text = NSLocalizedStringFromTable(@"asembly_lbl",appDelegate.culture, @"");
        self.nameLbl.textAlignment = NSTextAlignmentLeft;
        self.nameLbl.frame = CGRectMake(5, self.nameLbl.frame.origin.y, self.nameLbl.frame.size.width, self.nameLbl.frame.size.height);
        
        
        self.nameString.text = itemDetails.Name;
        self.nameString.textAlignment = NSTextAlignmentLeft;
        self.nameString.frame = CGRectMake(55, self.nameString.frame.origin.y, self.nameString.frame.size.width+35, self.nameString.frame.size.height);
        
        
        self.descLbl.text = NSLocalizedStringFromTable(@"desc_lbl",appDelegate.culture, @"");
        self.descLbl.textAlignment = NSTextAlignmentLeft;
        self.descLbl.frame = CGRectMake(5, self.descLbl.frame.origin.y, self.descLbl.frame.size.width + 30, self.descLbl.frame.size.height);
        
        self.descString.text = itemDetails.Description;
        self.descString.textAlignment = NSTextAlignmentLeft;
        self.descString.frame = CGRectMake(90, self.descString.frame.origin.y, self.descString.frame.size.width, self.descString.frame.size.height);
        
        NSString * text1 = @"";
        text1 = itemDetails.DepartmentsCombined;
        self.activityString.text = text1;
        self.activityString.textAlignment = NSTextAlignmentLeft;
        self.activityString.frame = CGRectMake(75, self.activityString.frame.origin.y, self.activityString.frame.size.width, self.activityString.frame.size.height);
        
        /*  if ([text1 isEqualToString:@""])
         self.activityLbl.alpha = 0;
         else
         self.activityLbl.alpha = 1; */
        self.activityLbl.text = NSLocalizedStringFromTable(@"activites_lbl",appDelegate.culture, @"");
        self.activityLbl.textAlignment = NSTextAlignmentLeft;
        self.activityLbl.frame = CGRectMake(5, self.activityLbl.frame.origin.y, self.activityLbl.frame.size.width, self.activityLbl.frame.size.height);
        
        
        
        self.phoneLbl.text = NSLocalizedStringFromTable(@"telephone_lbl",appDelegate.culture, @"");
        self.phoneLbl.textAlignment = NSTextAlignmentLeft;
        self.phoneLbl.frame = CGRectMake(5, self.phoneLbl.frame.origin.y, self.phoneLbl.frame.size.width + 30, self.phoneLbl.frame.size.height);
        
        self.phoneString.text = itemDetails.Phone;
        self.phoneString.textAlignment = NSTextAlignmentLeft;
        self.phoneString.frame = CGRectMake(80, self.phoneString.frame.origin.y, self.phoneString.frame.size.width, self.phoneString.frame.size.height);
        
        self.faxLbl.text = NSLocalizedStringFromTable(@"fax_lbl",appDelegate.culture, @"");
        self.faxLbl.textAlignment = NSTextAlignmentLeft;
        self.faxLbl.frame = CGRectMake(5, self.faxLbl.frame.origin.y, self.faxLbl.frame.size.width, self.faxLbl.frame.size.height);
        
        self.faxString.text = itemDetails.Fax;
        self.faxString.textAlignment = NSTextAlignmentLeft;
        self.faxString.frame = CGRectMake(35, self.faxString.frame.origin.y, self.faxString.frame.size.width, self.faxString.frame.size.height);
        
        
        self.websiteLbl.text = NSLocalizedStringFromTable(@"website_lbl",appDelegate.culture, @"");
        self.websiteLbl.textAlignment = NSTextAlignmentLeft;
        self.websiteLbl.frame = CGRectMake(5, self.websiteLbl.frame.origin.y, self.websiteLbl.frame.size.width, self.websiteLbl.frame.size.height);
        
        self.websiteString.text = itemDetails.WebSite;
        self.websiteString.textAlignment = NSTextAlignmentLeft;
        self.websiteString.frame = CGRectMake(65, self.websiteString.frame.origin.y, self.faxString.frame.size.width, self.websiteString.frame.size.height);
        
        
        self.emailLbl.text = NSLocalizedStringFromTable(@"email_lbl",appDelegate.culture, @"");
        self.emailLbl.textAlignment = NSTextAlignmentLeft;
        self.emailLbl.frame = CGRectMake(5, self.emailLbl.frame.origin.y, self.emailLbl.frame.size.width, self.emailLbl.frame.size.height);
        
        self.emailString.text = itemDetails.Email;
        self.emailString.textAlignment = NSTextAlignmentLeft;
        self.emailString.frame = CGRectMake(50, self.emailString.frame.origin.y, self.emailString.frame.size.width + 50, self.emailString.frame.size.height);
        
//        self.phoneButton.frame = CGRectMake(self.phoneString.frame.origin.x, self.phoneString.frame.origin.y, self.phoneString.frame.size.width, self.phoneString.frame.size.height);
        
//        self.websiteButton.frame = CGRectMake(self.websiteString.frame.origin.x, self.websiteString.frame.origin.y, self.websiteString.frame.size.width, self.websiteString.frame.size.height);
        
//        self.emailButton.frame = CGRectMake(self.emailString.frame.origin.x, self.emailString.frame.origin.y, self.emailString.frame.size.width, self.emailString.frame.size.height);
    }
    
    NSMutableAttributedString *mat = [self.phoneString.attributedText mutableCopy];
    [mat addAttributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)} range:NSMakeRange (0, mat.length)];
    self.phoneString.attributedText = mat;
    
    NSMutableAttributedString *mat2 = [self.websiteString.attributedText mutableCopy];
    [mat2 addAttributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)} range:NSMakeRange (0, mat2.length)];
    self.websiteString.attributedText = mat2;
    
    NSMutableAttributedString *mat3 = [self.emailString.attributedText mutableCopy];
    [mat3 addAttributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)} range:NSMakeRange (0, mat3.length)];
    self.emailString.attributedText = mat3;
    
    //    self.phoneButton.frame = CGRectMake(self.phoneString.frame.origin.x, self.phoneString.frame.origin.y, self.phoneString.frame.size.width, self.phoneString.frame.size.height);
    
    //    self.websiteButton.frame = CGRectMake(self.websiteString.frame.origin.x, self.websiteString.frame.origin.y, self.websiteString.frame.size.width, self.websiteString.frame.size.height);
    
    //    self.emailButton.frame = CGRectMake(self.emailString.frame.origin.x, self.emailString.frame.origin.y, self.emailString.frame.size.width, self.emailString.frame.size.height);
    
    
    
    
    /*   CGSize labelsize;
     labelsize=[itemDetails.DepartmentsCombined sizeWithFont:self.activityString.font constrainedToSize:CGSizeMake(206, 160) lineBreakMode:UILineBreakModeWordWrap];
     self.activityString.frame=CGRectMake(20,364, 206, labelsize.height);
     self.activityString.numberOfLines = 3;
     self.activityString.text = [converter convertArabic:itemDetails.DepartmentsCombined]; */
    
    
    AsyncImageView * asyncImageView = [[AsyncImageView alloc] init];
    asyncImageView.frame = CGRectMake(33,66,251,134);
    NSString *  imageURL = [NSString stringWithFormat:@"http://iacadcld.linkdev.com/Handlers/ShowImage.ashx?Guidid=%@&objectType=charity",itemDetails.ImageId];
    NSURL *url = [NSURL URLWithString:imageURL];
    asyncImageView.activityIndicatorStyle = UIActivityIndicatorViewStyleGray;
    asyncImageView.backgroundColor=[UIColor clearColor];
    [asyncImageView setImageURL:url];
    [self.view addSubview:asyncImageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    
//    [self.scrollView setContentSize:CGSizeMake(293,425)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLbl:nil];
    [self setNameLbl:nil];
    [self setDescLbl:nil];
    [self setActivityLbl:nil];
    [self setNameString:nil];
    [self setDescString:nil];
    [self setActivityString:nil];
    [super viewDidUnload];
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

-(void)detectTapGesture {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
}

- (IBAction)phoneMethod:(id)sender {
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        if (![itemDetails.Phone isEqualToString:@""])
        {
            NSString * tele;
            tele = [@"telprompt:" stringByAppendingString:itemDetails.Phone];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:tele]];
        }
    }
    
}
- (IBAction)websiteMethod:(id)sender {
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        if (![itemDetails.Phone isEqualToString:@""])
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:itemDetails.WebSite]];
        }
    }
}
- (IBAction)emailMethod:(id)sender {
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        if (![itemDetails.Phone isEqualToString:@""])
        {
            if([MFMailComposeViewController canSendMail]) {
                MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
                mailCont.mailComposeDelegate = self;
                [mailCont setSubject:@""];
                [mailCont setToRecipients:[NSArray arrayWithObject:itemDetails.Email]];
                [mailCont setMessageBody:@"" isHTML:YES];
                
                [self presentModalViewController:mailCont animated:YES];
                
            }
        }
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissModalViewControllerAnimated:YES];
}
@end
