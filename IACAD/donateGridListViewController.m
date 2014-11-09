//
//  donateListViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/14/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "donateGridListViewController.h"
#import "ArabicConverter.h"
#import "IIViewDeckController.h"
#import "IACADServiceClient.h"
#import "IACADGetPersonsByCharityAndDonationType.h"
#import "IACADGetPersonsByCharityAndDonationTypeResponse.h"
#import "IACADCatalogPerson.h"
#import "IACADDonationType.h"
#import "AsyncImageView.h"
#import "donateDetailsListViewController.h"
#import "CustomizedACView.h"
#import "personalViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PersonalFilterView.h"



@interface donateGridListViewController ()

@end

@implementation donateGridListViewController

-(id)init:(int)did :(NSString *)dname{
	if(self = [super init])
	{
        donationTypeId = did;
        donationName = dname;
        charityID = 0;
        charityName = @"";
        CountryName = @"";
        pagesize = 10;
        pageIndex = 0;
        
        isLoading = false;
        
        self.theScrollview.delegate = self;
        projectsList = [[NSMutableArray alloc]init];
        scrollViewControls = [[NSMutableArray alloc] init];
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
        self.titleLbl.text = [converter convertArabic:donationName];
        self.titleLbl.font = boldFont;
        
        
        self.nodataTitle.text = [converter convertArabic:NSLocalizedStringFromTable(@"no_info_lbl",appDelegate.culture, @"")];
        self.nodataTitle.font = boldFont;
    }
    else
    {
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        self.titleLbl.text = donationName;
        
        self.nodataTitle.text = NSLocalizedStringFromTable(@"no_info_lbl",appDelegate.culture, @"");
        
        self.filterButton.frame = CGRectMake(275, self.filterButton.frame.origin.y, self.filterButton.frame.size.width, self.filterButton.frame.size.height);
        self.filterImg.frame = CGRectMake(283, self.filterImg.frame.origin.y, self.filterImg.frame.size.width, self.filterImg.frame.size.height);
    }
    
    
    //    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    //    AC.center=self.view.center;
    //    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    //    [AC startLoading];
    //    [self.view addSubview:AC];
    //
    //    IACADGetPersonsByCharityAndDonationType *request = [[IACADGetPersonsByCharityAndDonationType alloc] init];
    
    //    IACADGetPersonsByCharityAndDonationType *request = [[IACADGetPersonsByCharityAndDonationType alloc]init];
    //    request.culture = appDelegate.culture;
    //    request.donationTypeId = donationTypeId;
    //    request.charityId = charityID;
    //    request.countryId = countryID;
    //    request.pageSize = pagesize;
    //    request.pageIndex = 0;
    //
    //    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    //    [client GetPersonsByCharityAndDonationTypeAsyncIsPost:YES input:request caller:self];
    
    [self loadTableview];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:tap];
    
    self.theScrollview.delegate = self;
}

- (void)GetPersonsByCharityAndDonationTypeCallback:(IACADGetPersonsByCharityAndDonationTypeResponse *)response error:(NSError *)error {
    
    isLoading = false;
    
    [AC stopLoading];
    [projectsList addObjectsFromArray:response.GetPersonsByCharityAndDonationTypeResult];
    
    [self fillScrollview];
    
    itemsCount = response.count;
}

-(void) fillScrollview
{
    for (int i=0;i<[scrollViewControls count];i++) {
        UIView *control = [scrollViewControls objectAtIndex:i];
        [control removeFromSuperview];
    }
    [scrollViewControls removeAllObjects];
    
    self.theScrollview.alpha = 1;
    int yy1 = 10;
    int yy2 = 10;
    
    if (projectsList.count > 0) {
        self.nodataTitle.alpha = 0;
        
        for (int i=0;i<[projectsList count];i++)
        {
            IACADCatalogPerson *catalogProject = [projectsList objectAtIndex:i];
            UIFont *boldFont;
            if ([appDelegate.culture isEqualToString:@"ar"])
                boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
            else
                boldFont=[UIFont systemFontOfSize:12];
            ArabicConverter *converter = [[ArabicConverter alloc] init];
            
            int y;
            int x;
            
            if (i%2 == 0)
            {
                y = yy1;
                x = 163;
            }
            else
            {
                y = yy2;
                x = 10;
            }
            UIView *itemBG = [[UIView alloc] init];
            [itemBG setBackgroundColor:[UIColor whiteColor]];
            [itemBG setFrame:CGRectMake(x,y,147,175)];
            [scrollViewControls addObject:itemBG];
            [self.theScrollview addSubview:itemBG];
            
            UILabel * itemLbl = [[UILabel alloc] initWithFrame:CGRectMake(x,y+150,147,20)];
            
            if ([appDelegate.culture isEqualToString:@"ar"]) {
                [itemLbl setLineBreakMode:NSLineBreakByTruncatingHead];
                itemLbl.text = [converter convertArabic: catalogProject.FullName];
            }
            else {
                [itemLbl setLineBreakMode:NSLineBreakByTruncatingTail];
                itemLbl.text = catalogProject.FullName;
            }
            itemLbl.font = boldFont;
            itemLbl.textAlignment = UITextAlignmentCenter;
            itemLbl.backgroundColor=[UIColor clearColor];
            itemLbl.textColor=[UIColor blackColor];
            [scrollViewControls addObject:itemLbl];
            [self.theScrollview addSubview:itemLbl];
            
            AsyncImageView * asyncImageView = [[AsyncImageView alloc] init];
            asyncImageView.frame = CGRectMake(x+2,y+2, 143, 143);
            NSString * imageURL;
            imageURL = [@"http://www.ecp.ae/Handlers/ShowImage.ashx?objectType=generalpersonfile&Guidid=" stringByAppendingString:catalogProject.GenrealPersonsPhotoFileID];
            NSURL *url = [NSURL URLWithString:imageURL];
            asyncImageView.activityIndicatorStyle = UIActivityIndicatorViewStyleGray;
            [asyncImageView setImageURL:url];
            asyncImageView.backgroundColor=[UIColor clearColor];
            [scrollViewControls addObject:asyncImageView];
            [self.theScrollview addSubview:asyncImageView];
            
            UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
            UIButton * donateButton =[[UIButton alloc]initWithFrame:CGRectMake(x,y,147,175)];
            donateButton.tag = i;
            [donateButton setBackgroundImage:transImage forState:UIControlStateNormal];
            [donateButton addTarget:self action:@selector(donationDetailsMethod:) forControlEvents:UIControlEventTouchUpInside];
            [scrollViewControls addObject:donateButton];
            [self.theScrollview addSubview:donateButton];
            
            
            if (i%2 == 0)
                yy1 = yy1 + 180;
            else
                yy2 = yy2 + 180;
            
        }
        
        [self.theScrollview setContentSize:CGSizeMake(320, yy1+5)];
    }
    else {
        self.nodataTitle.alpha = 1;
    }
}

- (IBAction)filterMethod:(id)sender {
    
    if (filterView == nil)
    {
        if (charityID == 0)
            charityName = NSLocalizedStringFromTable(@"all_charities",appDelegate.culture, @"");
        if (countryID == 0)
            CountryName = NSLocalizedStringFromTable(@"all_Countries",appDelegate.culture, @"");
        
        filterView = [[PersonalFilterView alloc] initWithFrame:CGRectMake(7,40,304,self.view.frame.size.height-70) :self:charityID:countryID:donationTypeId:charityName:CountryName];
        [self.view addSubview:filterView];
        
    }
    else
    {
        filterView.alpha = 0;
        [filterView removeFromSuperview];
        filterView = nil;
    }
    
    
    
}

-(void)hideFilterView
{
    filterView.alpha = 0;
    [filterView removeFromSuperview];
    filterView = nil;
}


-(void)reloadTableview {
    filterView.alpha = 0;
    [filterView removeFromSuperview];
    filterView = nil;
    
    pagesize = 10;
    newdata = 1;
    itemsCount = 0;
    pageIndex = 0;
    
    self.theScrollview.alpha = 0;
    
    [self loadTableview];
    
    [projectsList removeAllObjects];
}

-(void)reloadTableview: (int) charID :(int) counID :(NSString *)charindex :(NSString *)counindex
{
    charityID = charID;
    countryID = counID;
    charityName = charindex;
    CountryName = counindex;
    
    [self reloadTableview];
}

- (void) loadTableview {
    
    isLoading = true;
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    IACADGetPersonsByCharityAndDonationType *request = [[IACADGetPersonsByCharityAndDonationType alloc]init];
    request.culture = appDelegate.culture;
    request.donationTypeId = donationTypeId;
    request.charityId = charityID;
    request.countryId = countryID;
    request.pageSize = pagesize;
    request.pageIndex = pageIndex;
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetPersonsByCharityAndDonationTypeAsyncIsPost:YES input:request caller:self];
}

- (void)loadMore {
    if (isLoading == false) {
        
        if (itemsCount > projectsList.count) {
            pageIndex++;
            
            [self loadTableview];
        }
    }
}

-(void) donationDetailsMethod:(id)sender
{
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        UIButton *b = (UIButton *)sender;
        //        IACADDonationType * donationType = [projectsList objectAtIndex:b.tag];
        IACADCatalogPerson *catalogProject = [projectsList objectAtIndex:b.tag];
        
        personalViewController *constView = [[personalViewController alloc] init:catalogProject :self];
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:constView animated:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuMethod:(id)sender {
    [self.viewDeckController toggleRightView];
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

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    BOOL result = !([touch.view isKindOfClass:[UIControl class]]);
    
    BOOL result2 = ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];
    
    return result && result2;
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

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if(decelerate) {
        CGRect b = scrollView.bounds;
        NSLog(@"                    %f, %f", b.origin.y + b.size.height, scrollView.contentSize.height);
        
        if(b.origin.y + b.size.height > scrollView.contentSize.height - 400) {
            [self loadMore];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGRect b = scrollView.bounds;
    if(b.origin.y + b.size.height > scrollView.contentSize.height - 15) {
        [self loadMore];
    }
}


- (void)viewDidUnload {
    [self setTitleLbl:nil];
    [self setTheScrollview:nil];
    [super viewDidUnload];
}
@end
