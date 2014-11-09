//
//  languageViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 12/4/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "languageViewController.h"
#import "ArabicConverter.h"
#import "IIViewDeckController.h"

@interface languageViewController ()

@end

@implementation languageViewController

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
    
    UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_language",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
    }
    else
    {
        self.titleLbl.text = NSLocalizedStringFromTable(@"side_language",appDelegate.culture, @"");
        self.menuButton.frame = CGRectMake(0, self.menuButton.frame.origin.y, self.menuButton.frame.size.width, self.menuButton.frame.size.height);
        self.menuButtonImg.frame = CGRectMake(9, self.menuButtonImg.frame.origin.y, self.menuButtonImg.frame.size.width, self.menuButtonImg.frame.size.height);
    }
    
    
    self.englishLbl.text = @"English";
  //  self.englishLbl.font = boldFont;
    
    self.arabicLbl.text = [converter convertArabic: @"العربية"];
    self.arabicLbl.font = boldFont;
    
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

- (IBAction)englishMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    appDelegate.culture = @"en";
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"en" forKey:@"culture"];
    [prefs synchronize];
    
       [appDelegate.navControl popToRootViewControllerAnimated:NO];
    
    [appDelegate showSideMenu];
    }
    
}
- (IBAction)arabicMethod:(id)sender {
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    
    appDelegate.culture = @"ar";
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"ar" forKey:@"culture"];
    [prefs synchronize];
 
    [appDelegate.navControl popToRootViewControllerAnimated:NO];
    [appDelegate showSideMenu];
    }
   
}

- (IBAction)openmenuMethod:(id)sender {
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController toggleRightView];
    else
        [self.viewDeckController toggleLeftView];
}
@end
