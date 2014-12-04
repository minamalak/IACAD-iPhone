//
//  DonationHistoryListingViewController.m
//  IACAD
//
//  Created by Mina Malak on 11/9/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import "DonationHistoryListingViewController.h"
#import "IIViewDeckController.h"
#import "IACADServiceClient.h"
#import "IACADGetDonationItemsByCharityAndDonationTypeResponse.h"
#import "IACADServiceClient.h"
#import "IACADDonationType.h"
#import "IACADGetDonationItemsByCharityAndDonationType.h"
#import "IACADCatalogDonationItem.h"
#import "CustomizedACView.h"
#import "AsyncImageView.h"
#import "ArabicConverter.h"
#import "constructionViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"

@interface DonationHistoryListingViewController ()

@end

@implementation DonationHistoryListingViewController

-(id)init:(int)did :(NSString *)dname :(BOOL)isQ{
	if(self = [super init])
	{
        donateID = did;
        isQuant = isQ;
        donationName = dname;
        charityID = 0;
        countryID = 0;
        charityName = @"";
        CountryName = @"";
	}
	return self;
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    if (appDelegate.login == 0) {
//        LoginViewController * loginUser = [[LoginViewController alloc]init:1 :self];
//        CATransition* transition = [CATransition animation];
//        transition.duration = 0.3;
//        transition.type = kCATransitionReveal;
//        transition.subtype = kCATransitionFromTop;
//        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
//        [self.navigationController pushViewController:loginUser animated:NO];
//    }
//    else {
//        [self getDonationItemsAPI];
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_history",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        self.nodataTitle.text = [converter convertArabic:NSLocalizedStringFromTable(@"no_info_lbl",appDelegate.culture, @"")];
        self.nodataTitle.font = boldFont;
    }
    else
    {
        self.titleLbl.text =NSLocalizedStringFromTable(@"side_history",appDelegate.culture, @"");;
        self.menuButton.frame = CGRectMake(0, self.menuButton.frame.origin.y, self.menuButton.frame.size.width, self.menuButton.frame.size.height);
        
        self.nodataTitle.text = NSLocalizedStringFromTable(@"no_info_lbl",appDelegate.culture, @"");
    }
    
    pagesize = 10;
    newdata = 1;
    itemsCount = 0;
    [self getDonationItemsAPI];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}

-(void) getDonationItemsAPI
{
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@", [prefs objectForKey:@"userID"]);
    
    IACADGetDonorProjects * request = [[IACADGetDonorProjects alloc]init];
    request.culture = appDelegate.culture;
    request.donorID = [prefs objectForKey:@"userID"];;
//    request.pageSize = [[NSNumber alloc]initWithInt:pagesize];
    request.pageSize = [[NSNumber alloc]initWithInt:200];
    request.pageIndex = 0;
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetDonorProjectsAsyncIsPost:YES input:request caller:self];
}

-(void)GetDonorProjectsCallback:(IACADGetDonorProjectsResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    [donationsList removeAllObjects];
    donationsList = nil;
    donationsList = [[NSMutableArray alloc]init];
    donationsList = response.GetDonorProjectsResult;
    
    if (itemsCount == [donationsList count])
        newdata = 0;
    
    if ([donationsList count]>0)
        [self fillTable];
    else
    {
        self.nodataTitle.alpha = 1;
    }
}

-(void) fillTable
{
    itemsCount = [donationsList count];
    self.donationslistTable.alpha = 1;
    self.donationslistTable.dataSource = self;
    self.donationslistTable.delegate = self;
    [self.donationslistTable reloadData];
    
}

#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    
    
    IACADDonorProjectsData * item = [donationsList objectAtIndex:indexPath.row];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
        
        UIImageView * bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,312,61)];
        if ([appDelegate.culture isEqualToString:@"ar"])
            [bgImage setImage:[UIImage imageNamed:@"listtablecellWithoutImage.png"]];
        else
            [bgImage setImage:[UIImage imageNamed:@"listtablecellWithoutImage_en.png"]];
        [cell.contentView addSubview:bgImage];
        
        UILabel *donationDesc = [[UILabel alloc] init];
        UIFont *boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            donationDesc.frame=CGRectMake(30, 1.5, 270,58);
            donationDesc.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            boldFont =  [UIFont systemFontOfSize:14];
            donationDesc.frame=CGRectMake(12, 1.5, 270,58);
            donationDesc.textAlignment = NSTextAlignmentLeft;
        }
        
        donationDesc.font = boldFont;
        donationDesc.backgroundColor = [UIColor clearColor];
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
  
    }
    
    UILabel *lbl5 = (UILabel *)[cell.contentView viewWithTag:30];
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    lbl5.text = [converter convertArabic: item.Name];
    
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
        DonationHistoryItemDetailsViewController * donation;
        if ([appDelegate.culture isEqualToString:@"ar"]) {
            donation = [[DonationHistoryItemDetailsViewController alloc]initWithNibName:@"DonationHistoryItemDetailsViewController" bundle:nil];
        }
        else {
            donation = [[DonationHistoryItemDetailsViewController alloc]initWithNibName:@"DonationHistoryDetailsEN" bundle:nil];
        }
        donation.item = [donationsList objectAtIndex:indexPath.row];;
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:donation animated:NO];
    }
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)aScrollView
                  willDecelerate:(BOOL)decelerate{
    
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    float reload_distance = 30;
    if(y > h + reload_distance) {
        if (newdata == 1)
        {
            pagesize = pagesize +10;
            [self getDonationItemsAPI];
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


//- (IBAction)filterMethod:(id)sender {
//    
//    if (filterView == nil)
//    {
//        if (charityID == 0)
//            charityName = NSLocalizedStringFromTable(@"all_charities",appDelegate.culture, @"");
//        if (countryID == 0)
//            CountryName = NSLocalizedStringFromTable(@"all_Countries",appDelegate.culture, @"");
//        
//        filterView = [[FilterView alloc] initWithFrame:CGRectMake(7,40,304,self.view.frame.size.height-70) :self:charityID:countryID:donateID:charityName:CountryName];
//        [self.view addSubview:filterView];
//        
//    }
//    else
//    {
//        filterView.alpha = 0;
//        [filterView removeFromSuperview];
//        filterView = nil;
//    }
//    
//    
//    
//}
//
//-(void) hideFilterView
//{
//    filterView.alpha = 0;
//    [filterView removeFromSuperview];
//    filterView = nil;
//}

-(void) reloadTableview: (int) charID :(int) counID :(NSString *)charindex :(NSString *)counindex
{
//    filterView.alpha = 0;
//    [filterView removeFromSuperview];
//    filterView = nil;
    
    
    charityID = charID;
    countryID = counID;
    charityName = charindex;
    CountryName = counindex;
    
    pagesize = 10;
    newdata = 1;
    itemsCount = 0;
    
    self.donationslistTable.alpha = 0;
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    IACADGetDonationItemsByCharityAndDonationType * request = [[IACADGetDonationItemsByCharityAndDonationType alloc]init];
    request.culture = appDelegate.culture;
    request.donationTypeId = donateID;
    request.charityId = charityID;
    request.countryId = countryID;
    request.pageSize = pagesize;
    request.pageIndex = 0;
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetDonationItemsByCharityAndDonationTypeAsyncIsPost:YES input:request caller:self];
    
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
    return ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];
    
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
    
//    float currentVersion = 7.0;
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion) {
//        self.view.frame = CGRectMake(0, 20, 320, self.view.frame.size.height-40);
//        self.tabbarImg.frame  =  CGRectMake(0, -20,320,66);
//    }
}

- (IBAction)openmenuMethod:(id)sender {
    [self.viewDeckController toggleRightView];
    [self.viewDeckController toggleLeftView];
}


@end
