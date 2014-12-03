//
//  RightViewController.m
//  ViewDeckExample
//


#import "RightViewController.h"
#import "LeftViewController.h"
#import "FirstViewController.h"
#import "IIViewDeckController.h"
//#import "NestViewController.h"
//#import "PushedViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
#import "ArabicConverter.h"
#import "aboutViewController.h"
#import "languageViewController.h"
#import "contactViewController.h"
#import "DonationHistoryListingViewController.h"

@interface RightViewController () <IIViewDeckControllerDelegate>

@property (nonatomic, retain) NSMutableArray* logs;

@end


@implementation RightViewController

@synthesize tableView = _tableView;
@synthesize logs = _logs;
@synthesize pushButton = _pushButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIImage *greenImg= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"greenButton" ofType:@"png"]];
    [self.mainmenuButton setBackgroundImage:greenImg forState:UIControlStateNormal];
    
    self.logs = [NSMutableArray array];
    
    self.viewDeckController.delegate = self;
    self.tableView.scrollsToTop = NO;
    self.pushButton.enabled = NO;
    self.pushButton.layer.opacity = 0.2;
  
    
   
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.logoImg.frame = CGRectMake(121, self.logoImg.frame.origin.y, self.logoImg.frame.size.width, self.logoImg.frame.size.height);
        self.mainmenuLbl.textAlignment = NSTextAlignmentRight;
        self.aboutLbl.textAlignment = NSTextAlignmentRight;
        self.contactLbl.textAlignment = NSTextAlignmentRight;
        self.langLbl.textAlignment = NSTextAlignmentRight;
        self.lblDonationHistory.textAlignment = NSTextAlignmentRight;
        self.loginButton.frame = CGRectMake(58, self.loginButton.frame.origin.y, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
        
        
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:20];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.mainmenuLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_main",appDelegate.culture, @"")];;
        self.mainmenuLbl.font = boldFont;
        
        
        self.aboutLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_about",appDelegate.culture, @"")];
        self.aboutLbl.font = boldFont;
        
        self.contactLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_contact",appDelegate.culture, @"")];
        self.contactLbl.font = boldFont;
        
        self.langLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_language",appDelegate.culture, @"")];
        self.langLbl.font = boldFont;
        
        self.lblDonationHistory.text = [converter convertArabic:NSLocalizedStringFromTable(@"side_history",appDelegate.culture, @"")];
        self.lblDonationHistory.font = boldFont;
    }
    else
    {
        self.logoImg.frame = CGRectMake(71, self.logoImg.frame.origin.y, self.logoImg.frame.size.width, self.logoImg.frame.size.height);
        self.mainmenuLbl.textAlignment = NSTextAlignmentLeft;
        self.aboutLbl.textAlignment = NSTextAlignmentLeft;
        self.contactLbl.textAlignment = NSTextAlignmentLeft;
        self.langLbl.textAlignment = NSTextAlignmentLeft;
        self.lblDonationHistory.textAlignment = NSTextAlignmentLeft;
        self.loginButton.frame = CGRectMake(7, self.loginButton.frame.origin.y, self.loginButton.frame.size.width, self.loginButton.frame.size.height);

        
        self.mainmenuLbl.text = NSLocalizedStringFromTable(@"side_main",appDelegate.culture, @"");
        self.aboutLbl.text = NSLocalizedStringFromTable(@"side_about",appDelegate.culture, @"");
        self.contactLbl.text = NSLocalizedStringFromTable(@"side_contact",appDelegate.culture, @"");
        self.langLbl.text = NSLocalizedStringFromTable(@"side_language",appDelegate.culture, @"");
        self.lblDonationHistory.text = NSLocalizedStringFromTable(@"side_history",appDelegate.culture, @"");
    }
    
    
    
    [self updateSideMenu];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self updateSideMenu];
    [self addLog:@"view will appear"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self addLog:@"view will disappear"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addLog:@"view did appear"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self addLog:@"view did disappear"];
}


#pragma mark - View lifecycle

#pragma mark - view deck delegate

- (void)addLog:(NSString*)line {
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
    self.tableView.frame = (CGRect) { self.viewDeckController.rightSize, self.tableView.frame.origin.y,
        self.view.frame.size.width - self.viewDeckController.rightSize, self.tableView.frame.size.height };
    }
    else
    {
        self.tableView.frame = (CGRect) { self.viewDeckController.leftSize, self.tableView.frame.origin.y,
            self.view.frame.size.width - self.viewDeckController.leftSize, self.tableView.frame.size.height };
    }

    [self.logs addObject:line];
    NSIndexPath* index = [NSIndexPath indexPathForRow:self.logs.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationBottom];
    [self.tableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController applyShadow:(CALayer *)shadowLayer withBounds:(CGRect)rect {
    [self addLog:@"apply Shadow"];
    shadowLayer.masksToBounds = NO;
    shadowLayer.shadowRadius = 12;
    shadowLayer.shadowOpacity = 1;
    shadowLayer.shadowColor = [[UIColor blackColor] CGColor];
    //shadowLayer.shadowColor = [[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:1] CGColor];
    shadowLayer.shadowOffset = CGSizeZero;
    shadowLayer.shadowPath = [[UIBezierPath bezierPathWithRect:rect] CGPath];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController didChangeOffset:(CGFloat)offset orientation:(IIViewDeckOffsetOrientation)orientation panning:(BOOL)panning {
    [self addLog:[NSString stringWithFormat:@"%@: %f", panning ? @"Pan" : @"Offset", offset]];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController willOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
    [self addLog:[NSString stringWithFormat:@"will open %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController didOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
    [self addLog:[NSString stringWithFormat:@"did open %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController willCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
    [self addLog:[NSString stringWithFormat:@"will close %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController didCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
    [self addLog:[NSString stringWithFormat:@"did close %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController didShowCenterViewFromSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
    [self addLog:[NSString stringWithFormat:@"did show center view from %@", NSStringFromIIViewDeckSide(viewDeckSide)]];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController willPreviewBounceViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
    [self addLog:[NSString stringWithFormat:@"will preview bounce %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController didPreviewBounceViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
    [self addLog:[NSString stringWithFormat:@"did preview bounce %@ view", NSStringFromIIViewDeckSide(viewDeckSide)]];
}

//#pragma mark - Table view

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.logs.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:13];
//    cell.textLabel.text = [self.logs objectAtIndex:indexPath.row];
//
//    return cell;
//}



- (void)viewDidUnload {
    [self setLoginButton:nil];
    [self setMainmenuLbl:nil];
    [self setMainmenuButton:nil];
    [self setAboutButton:nil];
    [self setAboutLbl:nil];
    [self setContactButton:nil];
    [self setContactLbl:nil];
    [self setWelcomeLbl:nil];
    [self setWelcomeString:nil];
    [super viewDidUnload];
}
- (IBAction)loginMethod:(id)sender {
    
  // if (appDelegate.login == 0)
  //  {
        UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
        [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
        
         [appDelegate.navControl popToRootViewControllerAnimated:NO];
    LoginViewController * loginView = [[LoginViewController alloc]init:0 :nil];
        [appDelegate.navControl pushViewController:loginView animated:NO];
        if ([appDelegate.culture isEqualToString:@"ar"])
            [self.viewDeckController closeRightViewAnimated:YES];
        else
            [self.viewDeckController closeLeftViewAnimated:YES];
 /*   }
    else
    {
        appDelegate.userName = @"";
        appDelegate.firstName = @"";
        appDelegate.lastName = @"";
        appDelegate.login = 0;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:@"" forKey:@"userName"];
        [prefs setObject:@"" forKey:@"firstName"];
        [prefs setObject:@"" forKey:@"lastName"];
        [prefs synchronize];
    } */
    [self updateSideMenu];
    
}
- (IBAction)aboutMethod:(id)sender {
    
    UIImage *greenImg= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"greenButton" ofType:@"png"]];
    UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
   
    
    [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.aboutButton setBackgroundImage:greenImg forState:UIControlStateNormal];
    [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.btnDonationHistory setBackgroundImage:transImage forState:UIControlStateNormal];
    
   
     appDelegate.countViews = 0;
    appDelegate.lastView = 2;
    [appDelegate.navControl popToRootViewControllerAnimated:NO];
    aboutViewController * aboutView = [[aboutViewController alloc]init];
    [appDelegate.navControl pushViewController:aboutView animated:NO];
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController closeRightViewAnimated:YES];
    else
        [self.viewDeckController closeLeftViewAnimated:YES];
    
}

- (IBAction)donationHistoryAction:(id)sender
{
    NSLog(@"donation history");
    
    UIImage *greenImg= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"greenButton" ofType:@"png"]];
    UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
    
    
    [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.btnDonationHistory setBackgroundImage:greenImg forState:UIControlStateNormal];
    
    appDelegate.lastView = 5;
    appDelegate.countViews = 0;
    [appDelegate.navControl popToRootViewControllerAnimated:NO];
    DonationHistoryListingViewController * history = [[DonationHistoryListingViewController alloc]init];
    [appDelegate.navControl pushViewController:history animated:NO];
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController closeRightViewAnimated:YES];
    else
        [self.viewDeckController closeLeftViewAnimated:YES];
}

- (IBAction)langMethod:(id)sender {

    UIImage *greenImg= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"greenButton" ofType:@"png"]];
    UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
    
    
    [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.langButton setBackgroundImage:greenImg forState:UIControlStateNormal];
    [self.btnDonationHistory setBackgroundImage:transImage forState:UIControlStateNormal];
    
    appDelegate.lastView = 4;
    appDelegate.countViews = 0;
    [appDelegate.navControl popToRootViewControllerAnimated:NO];
    languageViewController * langView = [[languageViewController alloc]init];
    [appDelegate.navControl pushViewController:langView animated:NO];
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController closeRightViewAnimated:YES];
    else
        [self.viewDeckController closeLeftViewAnimated:YES];
    
}

- (IBAction)contactMethod:(id)sender {
    UIImage *greenImg= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"greenButton" ofType:@"png"]];
    UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
    
    
    [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.contactButton setBackgroundImage:greenImg forState:UIControlStateNormal];
    [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.btnDonationHistory setBackgroundImage:transImage forState:UIControlStateNormal];

     appDelegate.countViews = 0;
    appDelegate.lastView = 3;
    [appDelegate.navControl popToRootViewControllerAnimated:NO];
    contactViewController * contactView = [[contactViewController alloc]init];
    [appDelegate.navControl pushViewController:contactView animated:NO];
    if ([appDelegate.culture isEqualToString:@"ar"])
        [self.viewDeckController closeRightViewAnimated:YES];
    else
        [self.viewDeckController closeLeftViewAnimated:YES];
    
    
}

- (IBAction)mainmenuMethod:(id)sender {
    
    UIImage *greenImg= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"greenButton" ofType:@"png"]];
    UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
    
    
    [self.mainmenuButton setBackgroundImage:greenImg forState:UIControlStateNormal];
    [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
    [self.btnDonationHistory setBackgroundImage:transImage forState:UIControlStateNormal];

   
    appDelegate.lastView = 0;
    [appDelegate.navControl popToRootViewControllerAnimated:NO];
    if ([appDelegate.culture isEqualToString:@"ar"])
    [self.viewDeckController closeRightViewAnimated:YES];
    else
    [self.viewDeckController closeLeftViewAnimated:YES];
}

-(void) updateSideMenu
{
    if (appDelegate.login == 0)
    {
        if ([appDelegate.culture isEqualToString:@"ar"])
            [self.loginButton setImage:[UIImage imageNamed:@"loginReg_btn.png"] forState:UIControlStateNormal];
        else
        [self.loginButton setImage:[UIImage imageNamed:@"loginReg_btn_en.png"] forState:UIControlStateNormal];
        
        self.welcomeLbl.alpha = 0;
        self.welcomeString.alpha = 0;
        
    }
    else
    {
        if ([appDelegate.culture isEqualToString:@"ar"])
            [self.loginButton setImage:[UIImage imageNamed:@"logout_editprofile.png"] forState:UIControlStateNormal];
        else
            [self.loginButton setImage:[UIImage imageNamed:@"logout_editprofile.png"] forState:UIControlStateNormal];
        
        [self updateGreenBar];
    }
}

-(void) updateGreenBar
{
    UIImage *greenImg= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"greenButton" ofType:@"png"]];
    UIImage *transImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
    
    if (appDelegate.lastView == 1)
    {
        [self.mainmenuButton setBackgroundImage:greenImg forState:UIControlStateNormal];
        [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.btnDonationHistory setBackgroundImage:transImage forState:UIControlStateNormal];
    }
    if (appDelegate.lastView == 2)
    {
        [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.aboutButton setBackgroundImage:greenImg forState:UIControlStateNormal];
        [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.btnDonationHistory setBackgroundImage:transImage forState:UIControlStateNormal];
    }
    if (appDelegate.lastView == 3)
    {
        [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.contactButton setBackgroundImage:greenImg forState:UIControlStateNormal];
        [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.btnDonationHistory setBackgroundImage:transImage forState:UIControlStateNormal];
    }
    if (appDelegate.lastView == 4)
    {
        [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.langButton setBackgroundImage:greenImg forState:UIControlStateNormal];
        [self.btnDonationHistory setBackgroundImage:transImage forState:UIControlStateNormal];
    }
    if (appDelegate.lastView == 5)
    {
        [self.mainmenuButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.aboutButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.contactButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.langButton setBackgroundImage:transImage forState:UIControlStateNormal];
        [self.btnDonationHistory setBackgroundImage:greenImg forState:UIControlStateNormal];
    }
}


@end
