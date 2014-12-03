//
//  ViewController.h
//  ViewDeckExample
//


#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;
@interface ViewController : UIViewController <UINavigationControllerDelegate>
//,UITableViewDataSource,UITableViewDelegate
{
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UIImageView *menuImg;

@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UIScrollView *theScrollview;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UILabel *browseLbl;
@property (weak, nonatomic) IBOutlet UILabel *donateLbl;
@property (weak, nonatomic) IBOutlet UILabel *eventLbl;
@property (weak, nonatomic) IBOutlet UILabel *donate2Lbl;
@property (weak, nonatomic) IBOutlet UILabel *rescueLbl;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

- (IBAction)browseMethod:(id)sender;
- (IBAction)donateMethod:(id)sender;
- (IBAction)eventsMethod:(id)sender;
- (IBAction)generalDonateMethod:(id)sender;
- (IBAction)rescueMethod:(id)sender;
@end
