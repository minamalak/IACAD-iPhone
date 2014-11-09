//
//  langSplashViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 12/5/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "langSplashViewController.h"
#import "AppDelegate.h"
#import "ArabicConverter.h"

@interface langSplashViewController ()

@end

@implementation langSplashViewController

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
    if([UIScreen mainScreen].bounds.size.height == 480.0)
        [self.bgImg setImage:[UIImage imageNamed:@"Default.png"]];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:16];
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    self.arabicButton.titleLabel.font = boldFont;
    NSString * arabictext = [converter convertArabic:@"العربية"];
    [self.arabicButton setTitle:arabictext forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)englishMethod:(id)sender {
    
    appDelegate.culture = @"en";
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"en" forKey:@"culture"];
    [prefs synchronize];
    
    [delegate backFromLangView];
}

- (IBAction)arabicMethod:(id)sender {
    
    appDelegate.culture = @"ar";
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"ar" forKey:@"culture"];
    [prefs synchronize];
    
    [delegate backFromLangView];
}
@end
