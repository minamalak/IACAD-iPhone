//
//  RightViewController.h
//  ViewDeckExample
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@interface RightViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate * appDelegate;
}


@property (weak, nonatomic) IBOutlet UIImageView *logoImg;
@property (nonatomic, retain) IBOutlet UITableView* tableView;
@property (nonatomic, retain) IBOutlet UIButton* pushButton;
@property (weak, nonatomic) IBOutlet UIButton *mainmenuButton;
- (IBAction)aboutMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *contactButton;
@property (weak, nonatomic) IBOutlet UILabel *contactLbl;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLbl;
@property (weak, nonatomic) IBOutlet UILabel *langLbl;
- (IBAction)langMethod:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *langButton;
- (IBAction)contactMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *aboutLbl;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;
- (IBAction)mainmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *mainmenuLbl;
//- (IBAction)defaultCenterPressed:(id)sender;
- (IBAction)swapLeftAndCenterPressed:(id)sender;
- (IBAction)centerNavController:(id)sender;
- (IBAction)pushOverCenter:(id)sender;
- (IBAction)moveToLeft:(id)sender;
- (IBAction)loginMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *welcomeString;
-(void) updateSideMenu;

// Mina
@property (weak, nonatomic) IBOutlet UILabel *lblDonationHistory;
- (IBAction)donationHistoryAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnDonationHistory;

@end
