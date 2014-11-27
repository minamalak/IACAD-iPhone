//
//  donateDetailsListViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/15/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"
@class FilterView;
@class CustomizedACView;
@class AppDelegate;
@interface donateDetailsListViewController : UIViewController <IACADServiceClientCaller,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate>
{
    int donateID;
    NSString * donationName;
    NSMutableArray * donationsList;
    CustomizedACView * AC;
    FilterView * filterView;
    int charityID;
    NSMutableArray *countryID;
    NSString * charityName;
    NSString * CountryName;
    int pagesize;
    int newdata;
    int itemsCount;
    BOOL isQuant;
    AppDelegate * appDelegate;
}


@property (strong, nonatomic) IBOutlet UITableView *detailsTable;
@property (weak, nonatomic) IBOutlet UILabel *nodataTitle;
@property (weak, nonatomic) IBOutlet UIImageView *filterImg;
@property (weak, nonatomic) IBOutlet UIButton *filterButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
- (IBAction)filterMethod:(id)sender;
- (IBAction)openmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UITableView *donationslistTable;
-(void) reloadTableview: (int) charID :(NSMutableArray *) counID :(NSString *)charindex :(NSString *)counindex;
- (IBAction)backMethod:(id)sender;
-(id)init:(int)did :(NSString *)dname :(BOOL)isQ;
-(void) hideFilterView;
@end
