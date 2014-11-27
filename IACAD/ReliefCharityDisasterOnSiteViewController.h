//
//  ReliefCharityDisasterOnSiteViewController.h
//  IACAD
//
//  Created by Mina Malak on 11/24/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IACADServiceClient.h"
#import "IACADGetReliefDisasterForCharity.h"
#import "IACADGetReliefDisasterForCharityResponse.h"
#import "IACADReliefCharityDisasterOnSite.h"
#import "AppDelegate.h"
#import "CustomizedACView.h"
#import "IACADCharity.h"
#import "ReliefNeedsViewController.h"

@interface ReliefCharityDisasterOnSiteViewController : UIViewController <IACADServiceClientCaller,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate>
{
    NSMutableArray * donationsList;
    CustomizedACView * AC;
    AppDelegate * appDelegate;
}
@property (strong, nonatomic) IACADCharity *item;
@property (weak, nonatomic) IBOutlet UILabel *nodataTitle;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UITableView *reliefCharityTable;
//-(void) reloadTableview: (int) charID :(int) counID :(NSString *)charindex :(NSString *)counindex;
- (IBAction)backMethod:(id)sender;
//-(id)init:(int)did :(NSString *)dname :(BOOL)isQ;

@end
