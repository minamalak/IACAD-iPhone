//
//  cityListViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 9/1/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "cityListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ArabicConverter.h"
#import "CustomizedACView.h"
#import "IIViewDeckController.h"
#import "IACADCity.h"
#import "IACADGetCitiesByCountry.h"
#import "IACADGetCitiesByCountryResponse.h"
#import "NewuserViewController.h"

@interface cityListViewController ()

@end

@implementation cityListViewController

-(id)init :(id)del :(int)counid{
	if(self = [super init])
	{
        countryID = counid;
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
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"select_city",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
    }
    else
    {
        self.titleLbl.text = NSLocalizedStringFromTable(@"select_city",appDelegate.culture, @"");
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    }
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    IACADGetCitiesByCountry * request = [[IACADGetCitiesByCountry alloc]init];
    request.culture = appDelegate.culture;
    request.countryId = countryID;
    
    IACADServiceClient * client = [[IACADServiceClient alloc]init];
    [client GetCitiesByCountryAsyncIsPost:YES input:request caller:self];
}

-(void) GetCitiesByCountryCallback:(IACADGetCitiesByCountryResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    [citiesList removeAllObjects];
    citiesList = nil;
    citiesList = [[NSMutableArray alloc]init];
    citiesList = response.GetCitiesByCountryResult;
    if ([citiesList count]>0)
        [self fillTable];
}
-(void) fillTable
{
    self.citiesListTable.alpha = 1;
    self.citiesListTable.dataSource = self;
    self.citiesListTable.delegate = self;
    [self.citiesListTable reloadData];
}

#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    
    
    IACADCity * item = [citiesList objectAtIndex:indexPath.row];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier];
        
        UIImageView * bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,312,50)];
        [bgImage setImage:[UIImage imageNamed:@"browse_listbg.png"]];
        [cell.contentView addSubview:bgImage];
        
        
        
        UILabel *donationDesc = [[UILabel alloc] init];
        UIFont *boldFont=[UIFont systemFontOfSize:14];
        donationDesc.font = boldFont;
        donationDesc.frame=CGRectMake(15, 0, 280,50);
        donationDesc.backgroundColor = [UIColor clearColor];
        donationDesc.lineBreakMode = UILineBreakModeWordWrap;
        donationDesc.textColor = [UIColor colorWithRed:137/255.f
                                                 green:137/255.f
                                                  blue:137/255.f
                                                 alpha:1.0];
        donationDesc.tag = 30;
        if ([appDelegate.culture isEqualToString:@"ar"])
            donationDesc.textAlignment = NSTextAlignmentRight;
        else
            donationDesc.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:donationDesc];
        
        
        
    }
    
    UILabel *lbl5 = (UILabel *)[cell.contentView viewWithTag:30];
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        lbl5.text = [converter convertArabic: item.Name];
    }
    else
        lbl5.text = item.Name;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
	return cell;
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [citiesList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
    IACADCity * item  = [citiesList objectAtIndex:indexPath.row];
    [delegate citySelected:item.Name:item.ID];
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLbl:nil];
    [self setCitiesListTable:nil];
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
    return ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];
    
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
@end
