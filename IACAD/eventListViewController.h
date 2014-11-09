//
//  eventListViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/21/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"
@class CustomizedACView;
@class AppDelegate;
@interface eventListViewController : UIViewController <IACADServiceClientCaller,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * eventList;
    CustomizedACView * AC;
    int pagesize;
    int newdata;
    int itemsCount;
    AppDelegate * appDelegate;

}
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UILabel *nodataString;
@property (weak, nonatomic) IBOutlet UITableView *eventsTable;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)openmenuMethod:(id)sender;
- (IBAction)backMethod:(id)sender;

@end
