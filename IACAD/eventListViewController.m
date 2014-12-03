//
//  eventListViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/21/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "eventListViewController.h"
#import "CustomizedACView.h"
#import "ArabicConverter.h"
#import "IIViewDeckController.h"
#import "IACADServiceClient.h"
#import "IACADGetEvents.h"
#import "IACADGetEventsResponse.h"
#import "IACADIACADEvent.h"
#import "EnToArNum.h"
#import "eventDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface eventListViewController ()

@end

@implementation eventListViewController

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
    
    if([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"event_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        self.nodataString.text = [converter convertArabic:NSLocalizedStringFromTable(@"no_info_lbl",appDelegate.culture, @"")];
        self.nodataString.font = boldFont;
    }
    else
    {
        
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        self.titleLbl.text = NSLocalizedStringFromTable(@"event_lbl",appDelegate.culture, @"");
        self.nodataString.text = NSLocalizedStringFromTable(@"no_info_lbl",appDelegate.culture, @"");
    }
    
   
    self.nodataString.alpha = 0;
  
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    pagesize = 10;
    newdata = 1;
    itemsCount = 0;

    [self getEventsAPI];
    
    /////////
  /*   [AC stopLoading];
   eventList = [[NSMutableArray alloc]init];
    IACADIACADEvent * event = [[IACADIACADEvent alloc]init];
    NSDate *today = [NSDate date];
    event.StartDate = today;
    event.Name =  @"الفاعليات";
    [eventList addObject:event];
    [self fillTable]; */


}

-(void) getEventsAPI
{
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    IACADGetEvents * request = [[IACADGetEvents alloc]init];
    request.culture = appDelegate.culture;
    request.pageIndex = 0;
    request.pageSize = pagesize;
    IACADServiceClient * client = [[IACADServiceClient alloc]init];
    [client GetEventsAsyncIsPost:YES input:request caller:self];
}

-(void) GetEventsCallback:(IACADGetEventsResponse *)response error:(NSError *)error
{
    
    [AC stopLoading];
    eventList = [[NSMutableArray alloc]init];
    eventList = response.GetEventsResult;
    
    if (itemsCount == [eventList count])
        newdata = 0;
    
    if ([eventList count]>0)
        [self fillTable];
    else
        self.nodataString.alpha = 1;
}

-(void) fillTable
{
    itemsCount = [eventList count];
    self.eventsTable.alpha = 1;
    self.eventsTable.dataSource = self;
    self.eventsTable.delegate = self;
    [self.eventsTable reloadData];
}

#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    
    
    IACADIACADEvent * item = [eventList objectAtIndex:indexPath.row];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
        UIImageView * bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,316,61)];
        if ([appDelegate.culture isEqualToString:@"ar"])
        [bgImage setImage:[UIImage imageNamed:@"eventlist_bg.png"]];
        else
            [bgImage setImage:[UIImage imageNamed:@"eventlist_bg_en.png"]];
        [cell.contentView addSubview:bgImage];
        
      
        
        UILabel *donationDesc = [[UILabel alloc] init];
        UIFont * boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            donationDesc.textAlignment = NSTextAlignmentRight;
            donationDesc.frame=CGRectMake(60, 1.5, 185,45);
        }
        else
        {
             boldFont = [UIFont systemFontOfSize:14];
            donationDesc.textAlignment = NSTextAlignmentLeft;
            donationDesc.frame=CGRectMake(70, 1.5, 185,45);
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
        
        UILabel *dayString = [[UILabel alloc] init];
        UIFont * boldFont2;
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:26];
             dayString.frame=CGRectMake(268, 5, 30,30);
        }
        else
        {
            boldFont2 = [UIFont systemFontOfSize:26];
             dayString.frame=CGRectMake(15, 5, 30,30);
        }
        
        dayString.font = boldFont2;
        dayString.backgroundColor = [UIColor clearColor];
        dayString.lineBreakMode = UILineBreakModeWordWrap;
        dayString.textColor = [UIColor whiteColor];
        dayString.tag = 60;
        dayString.textAlignment = UITextAlignmentCenter;
        [cell.contentView addSubview:dayString];
        
        UILabel *monthLbl = [[UILabel alloc] init];
        UIFont * boldFont3;
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            boldFont3=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
            monthLbl.frame=CGRectMake(253, 35, 55,20);
        }
        else
        {
            boldFont3 = [UIFont systemFontOfSize:12];
            monthLbl.frame=CGRectMake(3, 35, 55,20);
        }
    
        monthLbl.font = boldFont3;
        monthLbl.backgroundColor = [UIColor clearColor];
        monthLbl.lineBreakMode = UILineBreakModeWordWrap;
        monthLbl.textColor = [UIColor whiteColor];
        monthLbl.tag = 90;
        monthLbl.textAlignment = UITextAlignmentCenter;
        [cell.contentView addSubview:monthLbl];
        
        UILabel *timeLbl = [[UILabel alloc] init];
        UIFont * boldFont4;
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            boldFont4=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            timeLbl.frame=CGRectMake(170, 35, 50,20);
            timeLbl.textAlignment = NSTextAlignmentLeft;
        }
        else
        {
            boldFont4 = [UIFont systemFontOfSize:14];
            timeLbl.frame=CGRectMake(95, 35, 60,20);
            timeLbl.textAlignment = NSTextAlignmentLeft;
        }
        timeLbl.font = boldFont4;
        timeLbl.backgroundColor = [UIColor clearColor];
        timeLbl.lineBreakMode = UILineBreakModeWordWrap;
        timeLbl.textColor = [UIColor colorWithRed:137/255.f
                                            green:137/255.f
                                             blue:137/255.f
                                            alpha:1.0];
        timeLbl.tag = 100;
        [cell.contentView addSubview:timeLbl];
        
        UIImageView * clockImage = [[UIImageView alloc] init];
        if ([appDelegate.culture isEqualToString:@"ar"])
            clockImage.frame =CGRectMake(227,35,16,16);
        else
            clockImage.frame = CGRectMake(70,35,16,16);
        [clockImage setImage:[UIImage imageNamed:@"timeIcon.png"]];
        [cell.contentView addSubview:clockImage];
        
        
    }
    else
    {
        
    }
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    
    
    UILabel *lbl5 = (UILabel *)[cell.contentView viewWithTag:30];
    if ([appDelegate.culture isEqualToString:@"ar"])
    lbl5.text = [converter convertArabic: item.Name];
    else
        lbl5.text = item.Name;
    
 
    ///4 hours plus
    NSDate * date = item.StartDate;
   // NSTimeInterval secondsInEightHours = 4 * 60 * 60;
   // NSDate *newDate = [date dateByAddingTimeInterval:secondsInEightHours];
    NSDate *newDate  = item.StartDate;
    NSLog(@"date %@",newDate);
    ///DAY
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d"];
    NSString *day = [dateFormatter stringFromDate:newDate];
    
    UILabel *lbl8 = (UILabel *)[cell.contentView viewWithTag:60];
     if ([appDelegate.culture isEqualToString:@"ar"])
    lbl8.text = [converter convertArabic: day];
    else
        lbl8.text = day;
    
    
    ///Month
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"MMMM"];
    NSString *monthtemp = [dateFormatter2 stringFromDate:newDate];
    EnToArNum * entoar = [[EnToArNum alloc]init];
    NSString * month = monthtemp;
    
    UILabel *lbl9 = (UILabel *)[cell.contentView viewWithTag:90];
     if ([appDelegate.culture isEqualToString:@"ar"])
     {
         month = [entoar convertString:monthtemp];
    lbl9.text = [converter convertArabic: month];
     }
    else
        lbl9.text = month;
    
    ///Time
    NSDateFormatter *dateFormatter3 = [[NSDateFormatter alloc] init];
    [dateFormatter3 setDateFormat:@"h:mm a"];
   // [dateFormatter3 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSString *timetemp = [dateFormatter3 stringFromDate:newDate];
    NSString * time = timetemp;
    UILabel *lbl10 = (UILabel *)[cell.contentView viewWithTag:100];
     if ([appDelegate.culture isEqualToString:@"ar"])
     {
        time = [entoar convertString:timetemp];
    lbl10.text = [converter convertArabic: time];
     }
    else
        lbl10.text = time;
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];

    
	return cell;
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [eventList count];
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
    
    IACADIACADEvent * item = [eventList objectAtIndex:indexPath.row];
    eventDetailsViewController * event = [[eventDetailsViewController alloc]init:item];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
             transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:event animated:NO];
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
            [self getEventsAPI];
        }
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLbl:nil];
    [self setEventsTable:nil];
    [self setNodataString:nil];
    [super viewDidUnload];
}
- (IBAction)openmenuMethod:(id)sender {
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
        if([appDelegate.culture isEqualToString:@"ar"])
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
