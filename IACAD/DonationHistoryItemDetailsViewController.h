//
//  DonationHistoryItemDetailsViewController.h
//  IACAD
//
//  Created by Mina Malak on 11/9/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "IACADGetProject.h"
#import "IACADGetProjectResponse.h"
#import "IACADProjectsData.h"
#import "IACADDonorProjectsData.h"
#import "IACADServiceClient.h"

@class CustomizedACView;

@interface DonationHistoryItemDetailsViewController : UIViewController <IACADServiceClientCaller>
{
    int totalAmount;
    CustomizedACView * AC;
    NSString * charityName;
    AppDelegate * appDelegate;
    BOOL isQant;
    int remainingStock;
}
@property (nonatomic, retain) IACADDonorProjectsData *item;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalCost;
@property (weak, nonatomic) IBOutlet UILabel *lblPercentCompleted;
@property (weak, nonatomic) IBOutlet UILabel *lblInitialDuration;
@property (weak, nonatomic) IBOutlet UILabel *lblID;
@property (weak, nonatomic) IBOutlet UILabel *lblArea;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UILabel *lblCharity;
@property (weak, nonatomic) IBOutlet UILabel *lblCountryName;
@property (weak, nonatomic) IBOutlet UILabel *lblContractDateString;

@property (weak, nonatomic) IBOutlet UILabel *lblTotalCostTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPercentCompletedTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblInitialDurationTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblIDTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblAreaTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescriptionTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTypeTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCharityTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCountryNameTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblContractDateStringTitle;


- (IBAction)backMethod:(id)sender;
@end
