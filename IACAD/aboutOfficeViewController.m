//
//  aboutOfficeViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/22/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "aboutOfficeViewController.h"
#import "IIViewDeckController.h"
#import "ArabicConverter.h"
#import "IACADGetMobileContent.h"
#import "IACADGetMobileContentResponse.h"
#import "IACADMobileContentType.h"
#import "CustomizedACView.h"
#import <QuartzCore/QuartzCore.h>

@interface aboutOfficeViewController ()

@end

@implementation aboutOfficeViewController

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
    self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"zakat_lbl",appDelegate.culture, @"")];
    self.titleLbl.font = boldFont;
    }
    else
    {
        self.titleLbl.text = NSLocalizedStringFromTable(@"zakat_lbl",appDelegate.culture, @"");
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
    }
    [self makeBodyBackgoundTransparent];
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    IACADGetMobileContent * request = [[IACADGetMobileContent alloc]init];
    request.culture = appDelegate.culture;
    request.type = MobileContentTypeAboutZakahOffice;
    
    IACADServiceClient * client = [[IACADServiceClient alloc]init];
    [client GetMobileContentAsyncIsPost:YES input:request caller:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
}

-(void) GetMobileContentCallback:(IACADGetMobileContentResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    
    NSString * htmlString = response.GetMobileContentResult;
    
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
    UIFont *boldFont;
    ArabicConverter *converter;
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
    boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
    converter = [[ArabicConverter alloc] init];
    }
    else
    {
       boldFont =  [UIFont systemFontOfSize:12];
    }
    NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"%@\";}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   "</html>", boldFont.familyName,htmlString];
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        myDescriptionHTML = [converter convertArabic: myDescriptionHTML];
    
    [self.webView loadHTMLString:myDescriptionHTML baseURL:nil];
    
}

- (void)makeBodyBackgoundTransparent {
    for (UIView *subview in [self.webView subviews]) {
        [subview setOpaque:NO];
        [subview setBackgroundColor:[UIColor clearColor]];
    }
    [self.webView setOpaque:NO];
    [self.webView setBackgroundColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLbl:nil];
    [self setWebView:nil];
    [super viewDidUnload];
}
- (IBAction)openmenuMethod:(id)sender {
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController toggleRightView];
    else
        [self.viewDeckController toggleLeftView];
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
@end
