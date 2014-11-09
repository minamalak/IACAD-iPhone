//
//  donateListViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/14/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"

@class PersonalFilterView;
@class CustomizedACView;
@class AppDelegate;
@interface donateGridListViewController : UIViewController <IACADServiceClientCaller, UIScrollViewDelegate>
{
    id delegate;
    AppDelegate * appDelegate;
    NSMutableArray * projectsList;
    CustomizedACView * AC;
    PersonalFilterView * filterView;
    
    
    int donationTypeId;
    int charityID;
    int countryID;
    int pageIndex;
    int pagesize;
    int newdata;
    
    BOOL isLoading;
    
    NSMutableArray *scrollViewControls;
    
    NSString * charityName;
    NSString * CountryName;
    NSString *donationName;
    
    int itemsCount;
}
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;

@property (weak, nonatomic) IBOutlet UIImageView *filterImg;
@property (weak, nonatomic) IBOutlet UIButton *filterButton;
@property (weak, nonatomic) IBOutlet UIScrollView *theScrollview;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *nodataTitle;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

-(id)init:(int)did :(NSString *)dname;
-(void)reloadTableview;
- (IBAction)menuMethod:(id)sender;
- (IBAction)backMethod:(id)sender;
@end
