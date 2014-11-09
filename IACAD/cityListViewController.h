//
//  cityListViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 9/1/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"
@class AppDelegate;
@class CustomizedACView;
@interface cityListViewController : UIViewController <IACADServiceClientCaller,UITableViewDelegate,UITableViewDataSource>
{
    AppDelegate * appDelegate;
    int countryID;
    id delegate;
    CustomizedACView * AC;
    NSMutableArray * citiesList;

}
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
-(id)init :(id)del :(int)counid;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)backMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *citiesListTable;

@end
