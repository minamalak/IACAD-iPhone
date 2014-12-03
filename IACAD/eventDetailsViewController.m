//
//  eventDetailsViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/21/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "eventDetailsViewController.h"
#import "IACADIACADEvent.h"
#import "ArabicConverter.h"
#import "IIViewDeckController.h"
#import "DisplayMap.h"
#import "EnToArNum.h"
#import "IACADLocation.h"

@interface eventDetailsViewController ()

@end

@implementation eventDetailsViewController

-(id)init: (IACADIACADEvent *)item
{
	if(self = [super init])
	{
        itemDetails = item;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSDate * date = itemDetails.StartDate;
    NSTimeInterval secondsInEightHours = 4 * 60 * 60;
    //NSDate *newDate = [date dateByAddingTimeInterval:secondsInEightHours];
    NSDate *newDate =  itemDetails.StartDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d MMMM YYYY - h:mm a"];
    NSString *startDateTemp = [dateFormatter stringFromDate:newDate];
   
    
    NSDate * date2 = itemDetails.EndDate;
    //  NSDate *newDate2 = [date2 dateByAddingTimeInterval:secondsInEightHours];
    NSDate *newDate2 = itemDetails.EndDate;
   
    
    
    if([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"event_lbl",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
        
        self.headerLbl.text = [converter convertArabic:itemDetails.Name];
        self.headerLbl.font = boldFont;
        
        self.startLbl.text = [converter convertArabic:@"بدأ :"];
        self.startLbl.font = boldFont2;
        
        self.endLbl.text = [converter convertArabic:@"إنتهاء :"];
        self.endLbl.font = boldFont2;
        
        EnToArNum * entoar = [[EnToArNum alloc]init];
        NSString * startDate = [entoar convertString:startDateTemp];
        self.startdateLbl.text = [converter convertArabic:startDate];
        self.startdateLbl.font = boldFont2;
        
        NSString *endDateTemp = [dateFormatter stringFromDate:newDate2];
        NSString * endDate = [entoar convertString:endDateTemp];
        self.enddateLbl.text = [converter convertArabic:endDate];
        self.enddateLbl.font = boldFont2;
        
        self.descLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"desc2_lbl",appDelegate.culture, @"")];
        self.descLbl.font = boldFont2;
        
        self.descString.text = [converter convertArabic:itemDetails.Description];
        self.descString.font = boldFont2;
        
       
    }
    else
    {
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        self.titleLbl.text = NSLocalizedStringFromTable(@"event_lbl",appDelegate.culture, @"");
        
        self.calImg.frame = CGRectMake(20, self.calImg.frame.origin.y, self.calImg.frame.size.width, self.calImg.frame.size.height);
        
        self.startLbl.text = @"Starts:";
        self.startLbl.textAlignment = NSTextAlignmentLeft;
        self.startLbl.frame = CGRectMake(59, self.startLbl.frame.origin.y, 50, self.startLbl.frame.size.height);
        
        self.endLbl.text = @"Ends:";
        self.endLbl.textAlignment = NSTextAlignmentLeft;
        self.endLbl.frame = CGRectMake(59, self.endLbl.frame.origin.y, self.endLbl.frame.size.width, self.endLbl.frame.size.height);
        
        self.headerLbl.text = itemDetails.Name;
        self.headerLbl.textAlignment = NSTextAlignmentLeft;
        
      
        NSString * startDate = startDateTemp;
        self.startdateLbl.text = startDate;
        self.startdateLbl.textAlignment = NSTextAlignmentLeft;
        self.startdateLbl.frame = CGRectMake(110, self.startdateLbl.frame.origin.y, self.startdateLbl.frame.size.width, self.startdateLbl.frame.size.height);
        
        NSString *endDateTemp = [dateFormatter stringFromDate:newDate2];
        NSString * endDate = endDateTemp;
        self.enddateLbl.text = endDate;
        self.enddateLbl.textAlignment = NSTextAlignmentLeft;
         self.enddateLbl.frame = CGRectMake(110, self.enddateLbl.frame.origin.y, self.enddateLbl.frame.size.width, self.enddateLbl.frame.size.height);
        
        self.descLbl.text = NSLocalizedStringFromTable(@"desc2_lbl",appDelegate.culture, @"");
        self.descLbl.textAlignment = NSTextAlignmentLeft;
        
        self.descString.text =itemDetails.Description;
        self.descString.textAlignment = NSTextAlignmentLeft;;
        
    }
    
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
   // itemDetails.EventLocation
    
    [self.mapView.layer setBorderColor:[[UIColor colorWithRed:40/255.f
                                                          green:140/255.f
                                                           blue:53/255.f
                                                        alpha:1.0] CGColor]];
     [self.mapView.layer setBorderWidth:1.0];
      [self.mapView.layer setCornerRadius:5.0];
    
    IACADLocation * location = [[IACADLocation alloc]init];
    location = itemDetails.EventLocation;
    region.center.latitude = location.Latitude;
    region.center.longitude = location.Longitude;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [self.mapView setRegion:region animated:YES];
    
    [self.mapView setDelegate:self];
    
    DisplayMap *ann = [[DisplayMap alloc] init];
    ann.title = itemDetails.Name;
    ann.subtitle = @"";
    ann.coordinate = region.center;
    [self.mapView addAnnotation:ann];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    

}

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinView = nil;
    if(annotation != self.mapView.userLocation)
    {
        static NSString *defaultPinID = @"com.invasivecode.pin";
        pinView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
                                          initWithAnnotation:annotation reuseIdentifier:defaultPinID];
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
       // [pinView setImage:[UIImage imageNamed:@"locationIcon.png"]];
        
    }
    else {
        [self.mapView.userLocation setTitle:@"I am here"];
    }
    return pinView;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLbl:nil];
    [self setMapView:nil];
    [self setHeaderLbl:nil];
    [self setStartLbl:nil];
    [self setEndLbl:nil];
    [self setStartdateLbl:nil];
    [self setEnddateLbl:nil];
    [self setDescLbl:nil];
    [self setDescString:nil];
    [super viewDidUnload];
}
- (IBAction)openmenuMethod:(id)sender {
     [self.viewDeckController toggleRightView];
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
    return ! ([touch.view isKindOfClass:[UIControl class]]);
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

-(void)detectTapGesture {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    
}

- (IBAction)openMapMethod:(id)sender {
}
@end
