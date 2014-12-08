//
//  ViewController.m
//  ViewDeckExample
//

#import "ViewController.h"
#import "IIViewDeckController.h"
#import "ArabicConverter.h"
#import "donateListViewController.h"
#import "browseViewController.h"
#import "eventListViewController.h"
#import "charitiesListViewController.h"
#import "ReliefCharitiesViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () {
    
    __weak IBOutlet UIView *_vwBrowse;
    __weak IBOutlet UIView *_vwSpecialDonation;
    __weak IBOutlet UIView *_vwEvents;
    __weak IBOutlet UIView *_vwGeneralDonation;
}

@end

@implementation ViewController



-(id)init{
    NSLog(@"%s",__func__);
	if(self = [super init])
	{
        
	}
	return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"%s",__func__);
	if(self = [super initWithNibName:nibBundleOrNil bundle:nibBundleOrNil])
	{
        
	}
	return self;
}
 

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   
     [self.navigationController.navigationBar setHidden:YES];
  
    
  //  CGSize result = [[UIScreen mainScreen] bounds].size;
  //  if(result.height == 480)
   //     [self.theScrollview setContentSize:CGSizeMake(320, 500)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}


- (void)viewDidUnload
{
    [self setMenuButton:nil];
    [self setTitleLbl:nil];
    [self setTheScrollview:nil];
    [self setBrowseLbl:nil];
    [self setDonateLbl:nil];
    [self setEventLbl:nil];
    [self setDonate2Lbl:nil];
    [self setRescueLbl:nil];
    [self setTapGesture:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
  
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    float currentVersion = 7.0;
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion) {
//        self.view.frame = CGRectMake(0, 20, 320, self.view.frame.size.height-40);
//        self.tabbarImg.frame  =  CGRectMake(0, -20,320,66);
//    }
    
    [_theScrollview setContentSize:CGSizeMake(320, 524)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    float currentVersion = 7.0;
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion) {
//        self.view.frame = CGRectMake(0, 20, 320, self.view.frame.size.height-40);
//        self.tabbarImg.frame  =  CGRectMake(0, -20,320,66);
//    }

    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.menuButton.frame = CGRectMake(272, self.menuButton.frame.origin.y, self.menuButton.frame.size.width, self.menuButton.frame.size.height);
        self.menuImg.frame = CGRectMake(286, self.menuImg.frame.origin.y, self.menuImg.frame.size.width, self.menuImg.frame.size.height);
    }
    else
    {
      self.menuButton.frame = CGRectMake(0, self.menuButton.frame.origin.y, self.menuButton.frame.size.width, self.menuButton.frame.size.height);
        self.menuImg.frame = CGRectMake(9, self.menuImg.frame.origin.y, self.menuImg.frame.size.width, self.menuImg.frame.size.height);
    }
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
    UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_main",appDelegate.culture, @"")];
    self.titleLbl.font = boldFont;
    
    self.browseLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"browse_lbl",appDelegate.culture, @"")];
    self.browseLbl.font = boldFont;
    
    self.donateLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"special_donate_lbl",appDelegate.culture, @"")];
    self.donateLbl.font = boldFont;
    
    self.eventLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"event_lbl",appDelegate.culture, @"")];
    self.eventLbl.font = boldFont;
    
    self.donate2Lbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"donate_lbl",appDelegate.culture, @"")];
    self.donate2Lbl.font = boldFont;
    
    self.rescueLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"rescue_lbl",appDelegate.culture, @"")];
    self.rescueLbl.font = boldFont;
    }
    else
    {
        UIFont *boldFont = [UIFont systemFontOfSize:18];
        self.titleLbl.text = NSLocalizedStringFromTable(@"side_main",appDelegate.culture, @"");
        self.titleLbl.font = boldFont;
        
        self.browseLbl.text = NSLocalizedStringFromTable(@"browse_lbl",appDelegate.culture, @"");
        self.browseLbl.font = boldFont;
        
        self.donateLbl.text = NSLocalizedStringFromTable(@"donate_lbl",appDelegate.culture, @"");
        self.donateLbl.font = boldFont;
        
        self.eventLbl.text = NSLocalizedStringFromTable(@"event_lbl",appDelegate.culture, @"");
        self.eventLbl.font = boldFont;
        
        self.donate2Lbl.text = NSLocalizedStringFromTable(@"general_lbl",appDelegate.culture, @"");
        self.donate2Lbl.font = boldFont;
        
        self.rescueLbl.text = NSLocalizedStringFromTable(@"rescue_lbl",appDelegate.culture, @"");
        self.rescueLbl.font = boldFont;
    }
    
    
    //[self.viewDeckController closeLeftViewAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%s",__func__);
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%s",__func__);
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}


- (IBAction)openMenuMethod:(id)sender {
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController toggleRightView];
    else
        [self.viewDeckController toggleLeftView];
    
}
- (IBAction)browseMethod:(id)sender {
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    
    browseViewController * browse = [[browseViewController alloc]init];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
                transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:browse animated:NO];
    }
}

- (IBAction)donateMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    
    donateListViewController * donate = [[donateListViewController alloc]init];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:donate animated:NO];
    }
}

- (IBAction)eventsMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
  
    eventListViewController * events = [[eventListViewController alloc]init];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:events animated:NO];
    }
}

- (IBAction)generalDonateMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
    charitiesListViewController * charities = [[charitiesListViewController alloc]init:1];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromLeft;
        else
            transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:charities animated:NO];
    }
}

- (IBAction)rescueMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        ReliefCharitiesViewController * relief = [[ReliefCharitiesViewController alloc]init:1];
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



@end
