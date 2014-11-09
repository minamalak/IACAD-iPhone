//
//  FirstViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 7/18/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "FirstViewController.h"
#import "IACADServiceClient.h"
#import "IACADGetAllDonationTypesResponse.h"
#import "IACADGetAllDonationTypes.h"
#import "IACADServiceClient.h"
#import "IIViewDeckController.h"

@interface FirstViewController ()

@end


@implementation FirstViewController
@synthesize navControl;
-(id)init{
	if(self = [super init])
	{
        
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // [self.navigationController.navigationBar setHidden:YES];
    
    UIButton *askButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    askButton.frame = CGRectMake(5, 5, 100, 20);
    [askButton setTitle:@"open menu" forState:(UIControlState)UIControlStateNormal];
    [askButton addTarget:self action:@selector(openRightMenu) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    [self.view addSubview:askButton];
    
  
    if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItems)]) {
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:
                                                   [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)],
                                                   nil];
    }
    else {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)];
    }
    
    // Do any additional setup after loading the view from its nib.
   /* IACADGetAllDonationTypes *request = [[IACADGetAllDonationTypes alloc] init];
    request.culture = @"en";
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetAllDonationTypesAsyncIsPost:YES input:request caller:self]; */
    
    
}

-(void) openRightMenu
{
    [self.viewDeckController toggleRightView];
}

- (void)GetAllDonationTypesCallback:(IACADGetAllDonationTypesResponse *)response error:(NSError *)error {
    NSMutableArray * temp = [[NSMutableArray alloc]init];
 temp = response.GetAllDonationTypesResult;
     NSLog(@"temp %@",temp);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
