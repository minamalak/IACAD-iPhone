//
//  ReliefCharityDisasterOnSiteViewController.m
//  IACAD
//
//  Created by Mina Malak on 11/24/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import "ReliefCharityDisasterOnSiteViewController.h"
#import "ArabicConverter.h"
#import <QuartzCore/QuartzCore.h>

@interface ReliefCharityDisasterOnSiteViewController ()

@end

@implementation ReliefCharityDisasterOnSiteViewController
@synthesize item;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:item.NameAr];
        self.titleLbl.font = boldFont;
        
        self.nodataTitle.text = [converter convertArabic:NSLocalizedStringFromTable(@"no_info_lbl",appDelegate.culture, @"")];
        self.nodataTitle.font = boldFont;
    }
    else
    {
        self.titleLbl.text = item.NameEn;
        self.menuButton.frame = CGRectMake(0, self.menuButton.frame.origin.y, self.menuButton.frame.size.width, self.menuButton.frame.size.height);
        
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        self.nodataTitle.text = NSLocalizedStringFromTable(@"no_info_lbl",appDelegate.culture, @"");
    }
    
   
    [self getCharityDisasterList];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}

-(void) getCharityDisasterList
{
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@", [prefs objectForKey:@"userID"]);
    
    IACADGetReliefDisasterForCharity * request = [[IACADGetReliefDisasterForCharity alloc]init];
    request.culture = appDelegate.culture;
    request.charityId = [NSNumber numberWithInt:item.ID];
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetReliefDisasterForCharityAsyncIsPost:YES input:request caller:self];
}

-(void)GetReliefDisasterForCharityCallback:(IACADGetReliefDisasterForCharityResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    [donationsList removeAllObjects];
    donationsList = nil;
    donationsList = [[NSMutableArray alloc]init];
    donationsList = response.GetReliefDisasterForCharityResult;
    
    if ([donationsList count]>0)
        [self fillTable];
    else
    {
        self.nodataTitle.alpha = 1;
    }
}

-(void) fillTable
{
    self.reliefCharityTable.alpha = 1;
    self.reliefCharityTable.dataSource = self;
    self.reliefCharityTable.delegate = self;
    [self.reliefCharityTable reloadData];
    
}

#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    
    
    IACADReliefCharityDisasterOnSite * item = [donationsList objectAtIndex:indexPath.row];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
    
    
    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
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
//        donationDesc.lineBreakMode = UILineBreakModeWordWrap;
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
    lbl5.text = [converter convertArabic: item.DisasterName];
    
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
//        DonationHistoryItemDetailsViewController * donation;
//        if ([appDelegate.culture isEqualToString:@"ar"]) {
//            donation = [[DonationHistoryItemDetailsViewController alloc]initWithNibName:@"DonationHistoryItemDetailsViewController" bundle:nil];
//        }
//        else {
//            donation = [[DonationHistoryItemDetailsViewController alloc]initWithNibName:@"DonationHistoryDetailsEN" bundle:nil];
//        }
//        donation.item = [donationsList objectAtIndex:indexPath.row];;
//        CATransition* transition = [CATransition animation];
//        transition.duration = 0.3;
//        transition.type = kCATransitionPush;
//        if ([appDelegate.culture isEqualToString:@"ar"])
//            transition.subtype = kCATransitionFromLeft;
//        else
//            transition.subtype = kCATransitionFromRight;
//        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
//        [self.navigationController pushViewController:donation animated:NO];
        
        IACADReliefCharityDisasterOnSite * disasterItem = [donationsList objectAtIndex:indexPath.row];
        
        ReliefNeedsViewController * relief = [[ReliefNeedsViewController alloc]initWithNibName:@"ReliefNeedsViewController" bundle:nil];
        relief.item = disasterItem;
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:relief animated:NO];
    }
    
}


//- (void)scrollViewDidEndDragging:(UIScrollView *)aScrollView
//                  willDecelerate:(BOOL)decelerate{
//    
//    CGPoint offset = aScrollView.contentOffset;
//    CGRect bounds = aScrollView.bounds;
//    CGSize size = aScrollView.contentSize;
//    UIEdgeInsets inset = aScrollView.contentInset;
//    float y = offset.y + bounds.size.height - inset.bottom;
//    float h = size.height;
//    
//    float reload_distance = 30;
//    if(y > h + reload_distance) {
//        if (newdata == 1)
//        {
//            pagesize = pagesize +10;
//            [self getDonationItemsAPI];
//        }
//    }
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)viewDidUnload {
//    [self setReliefCharityTable:nil];
//    [self setTitleLbl:nil];
//    [super viewDidUnload];
//}


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

//-(void) reloadTableview: (int) charID :(int) counID :(NSString *)charindex :(NSString *)counindex
//{
//    //    filterView.alpha = 0;
//    //    [filterView removeFromSuperview];
//    //    filterView = nil;
//    
//    
//    charityID = charID;
//    countryID = counID;
//    charityName = charindex;
//    CountryName = counindex;
//    
//    pagesize = 10;
//    newdata = 1;
//    itemsCount = 0;
//    
//    self.donationslistTable.alpha = 0;
//    
//    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
//    AC.center=self.view.center;
//    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
//    [AC startLoading];
//    [self.view addSubview:AC];
//    
//    IACADGetDonationItemsByCharityAndDonationType * request = [[IACADGetDonationItemsByCharityAndDonationType alloc]init];
//    request.culture = appDelegate.culture;
//    request.donationTypeId = donateID;
//    request.charityId = charityID;
//    request.countryId = countryID;
//    request.pageSize = pagesize;
//    request.pageIndex = 0;
//    
//    IACADServiceClient *client = [[IACADServiceClient alloc] init];
//    [client GetDonationItemsByCharityAndDonationTypeAsyncIsPost:YES input:request caller:self];
//    
//}

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

@end
