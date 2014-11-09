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
@class CustomizedACView;
@class AppDelegate;
@interface donateListViewController : UIViewController <IACADServiceClientCaller>
{
    id delegate;
    AppDelegate * appDelegate;
    NSMutableArray * donateList;
    CustomizedACView * AC;
}
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;

@property (weak, nonatomic) IBOutlet UIScrollView *theScrollview;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
-(id)init:(id)del;
- (IBAction)menuMethod:(id)sender;
- (IBAction)backMethod:(id)sender;
@end
