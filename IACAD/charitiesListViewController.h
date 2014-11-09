//
//  charitiesListViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/20/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "FilterView.h"
#import "AppDelegate.h"

@class AppDelegate;
@class FilterView;
@class CustomizedACView;
@interface charitiesListViewController : UIViewController <IACADServiceClientCaller,UITableViewDelegate,UITableViewDataSource>
{
    int donateID;
    NSString * donationName;
    NSMutableArray * donationsList;
    CustomizedACView * AC;
    FilterView * filterView;
    int charityID;
    int type;
    UITapGestureRecognizer *tap;
    int countryID;
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
- (IBAction)openmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)backMethod:(id)sender;
-(id)init :(int) thetype;

@property (weak, nonatomic) IBOutlet UITableView *donationslistTable;
@end
