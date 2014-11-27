//
//  ReliefCharitiesViewController.h
//  IACAD
//
//  Created by Mina Malak on 11/24/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IACADServiceClient.h"
#import "FilterView.h"
#import "AppDelegate.h"

@class CustomizedACView;

@interface ReliefCharitiesViewController : UIViewController <IACADServiceClientCaller,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate>
{
    int donateID;
    NSString * donationName;
    NSMutableArray * donationsList;
    CustomizedACView * AC;
    int charityID;
    int type;
    UITapGestureRecognizer *tap;
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)backMethod:(id)sender;
-(id)init :(int) thetype;

@property (weak, nonatomic) IBOutlet UITableView *donationslistTable;
@end
