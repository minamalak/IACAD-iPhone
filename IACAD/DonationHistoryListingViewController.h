//
//  DonationHistoryListingViewController.h
//  IACAD
//
//  Created by Mina Malak on 11/9/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "IACADGetDonorProjects.h"
#import "IACADGetDonorProjectsResponse.h"
#import "IACADDonorProjectsData.h"
#import "AppDelegate.h"
#import "DonationHistoryItemDetailsViewController.h"

@class CustomizedACView;
@class AppDelegate;

@interface DonationHistoryListingViewController : UIViewController <IACADServiceClientCaller,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate>
{
    int donateID;
    NSString * donationName;
    NSMutableArray * donationsList;
    CustomizedACView * AC;
//    FilterView * filterView;
    int charityID;
    int countryID;
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
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
//- (IBAction)filterMethod:(id)sender;
- (IBAction)openmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UITableView *donationslistTable;
-(void) reloadTableview: (int) charID :(int) counID :(NSString *)charindex :(NSString *)counindex;
- (IBAction)backMethod:(id)sender;
-(id)init:(int)did :(NSString *)dname :(BOOL)isQ;
//-(void) hideFilterView;

@end
