//
//  charitiesListViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/20/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "charitiesListViewController.h"
#import "CustomizedACView.h"
#import "IIViewDeckController.h"
#import "AsyncImageView.h"
#import "ArabicConverter.h"
#import "IACADListCharities.h"
#import "IACADListCharitiesResponse.h"
#import "IACADCharity.h"
#import "charityDetailsViewController.h"
#import "GeneralDonationViewController.h"
#import "IACADListCharitiesForAnonymousDonation.h"
#import "IACADListCharitiesForAnonymousDonationResponse.h"

#import <QuartzCore/QuartzCore.h>

@interface charitiesListViewController ()

@end

@implementation charitiesListViewController

-(id)init :(int) thetype{
	if(self = [super init])
	{
        type = thetype;
        ///type = 0 -> Browse
        ///type = 1 -> General Donation
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
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
    }
   else
   {
       self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
       UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
       [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
       
       self.titleLbl.text = NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"");
   }
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    if (type == 0)
    {
        IACADListCharities * request = [[IACADListCharities alloc]init];
        request.culture = appDelegate.culture;
        IACADServiceClient * client = [[IACADServiceClient alloc]init];
        [client ListCharitiesAsyncIsPost:YES input:request caller:self];
    }
    if (type == 1)
    {
        IACADListCharitiesForAnonymousDonation * request = [[IACADListCharitiesForAnonymousDonation alloc]init];
        request.culture = appDelegate.culture;
        IACADServiceClient * client = [[IACADServiceClient alloc]init];
        [client ListCharitiesForAnonymousDonationAsyncIsPost:YES input:request caller:self];
    }
    
   

}

-(void) ListCharitiesCallback:(IACADListCharitiesResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    [donationsList removeAllObjects];
    donationsList = nil;
//    donationsList = [[NSMutableArray alloc]init];
    donationsList = response.ListCharitiesResult;
    if ([donationsList count]>0)
        [self fillTable];
}

-(void) ListCharitiesForAnonymousDonationCallback:(IACADListCharitiesForAnonymousDonationResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    [donationsList removeAllObjects];
    donationsList = nil;
    donationsList = [[NSMutableArray alloc]init];
    donationsList = response.ListCharitiesForAnonymousDonationResult;
    if ([donationsList count]>0)
        [self fillTable];
}

-(void) fillTable
{
    self.donationslistTable.alpha = 1;
    self.donationslistTable.dataSource = self;
    self.donationslistTable.delegate = self;
    [self.donationslistTable reloadData];
    
}

#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    
    
    IACADCharity * item = [donationsList objectAtIndex:indexPath.row];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
        
        UIImageView * bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,312,61)];
        if ([appDelegate.culture isEqualToString:@"ar"])
        [bgImage setImage:[UIImage imageNamed:@"listtablecell.png"]];
        else
          [bgImage setImage:[UIImage imageNamed:@"listtablecell_en.png"]];
        [cell.contentView addSubview:bgImage];
       
        [cell setNeedsDisplay];
        
        UILabel *donationDesc = [[UILabel alloc] init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            donationDesc.font = boldFont;
            donationDesc.textAlignment = NSTextAlignmentRight;
            donationDesc.frame=CGRectMake(30, 5, 180,58);
        }
       else
       {
           UIFont * boldFont =  [UIFont systemFontOfSize:14];
           donationDesc.font = boldFont;
           donationDesc.textAlignment = NSTextAlignmentLeft;
           donationDesc.frame=CGRectMake(94, 5, 180,58);
       }
        donationDesc.backgroundColor = [UIColor clearColor];
        donationDesc.numberOfLines = 2;
        donationDesc.lineBreakMode = UILineBreakModeWordWrap;
        donationDesc.textColor = [UIColor colorWithRed:137/255.f
                                                 green:137/255.f
                                                  blue:137/255.f
                                                 alpha:1.0];
        donationDesc.tag = 30;
        [cell.contentView addSubview:donationDesc];
        
        
        
    }
    else
    {
        AsyncImageView* oldImage = (AsyncImageView*)
        [cell.contentView viewWithTag:123456];
        [oldImage removeFromSuperview];
    }
    
    UILabel *lbl5 = (UILabel *)[cell.contentView viewWithTag:30];
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    lbl5.text = [converter convertArabic: item.Name];
    
    
    NSString *  imageURL = [NSString stringWithFormat:@"http://iacadcld.linkdev.com/Handlers/ShowImage.ashx?Guidid=%@&objectType=charity",item.ImageId];
    
    NSURL *url = [NSURL URLWithString:imageURL];
    
    CGRect frame;
	frame.size.width=82.5; frame.size.height=58; frame.origin.y=1.5;
    if ([appDelegate.culture isEqualToString:@"ar"])
        frame.origin.x=228;
    else
        frame.origin.x=0;
	AsyncImageView* asyncImage = [[AsyncImageView alloc]
                                   initWithFrame:frame];
	asyncImage.tag = 123456;
	[asyncImage setImageURL:url];
     asyncImage.backgroundColor=[UIColor clearColor];
	[cell.contentView addSubview:asyncImage];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
	return cell;
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [donationsList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath {
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    IACADCharity * item = [donationsList objectAtIndex:indexPath.row];
    
    if (type == 0)
    {
        charityDetailsViewController * details = [[charityDetailsViewController alloc]init:item];
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:details animated:NO];
    }
    if (type == 1)
    {
        GeneralDonationViewController * generalDonate = [[GeneralDonationViewController alloc]init:item.ID];
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:generalDonate animated:NO];
    }
    }
  
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDonationslistTable:nil];
    [self setTitleLbl:nil];
    [super viewDidUnload];
}
- (IBAction)openmenuMethod:(id)sender {
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController toggleRightView];
    else
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

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];

}
-(void)detectTapGesture {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    
}
@end
