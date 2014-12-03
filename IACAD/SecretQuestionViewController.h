//
//  SecretQuestionViewController.h
//  IACAD
//
//  Created by Mina Malak on 12/2/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"
@class AppDelegate;
@class CustomizedACView;

@interface SecretQuestionViewController : UIViewController <IACADServiceClientCaller,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate>
{
    AppDelegate * appDelegate;
    id delegate;
    CustomizedACView * AC;
    NSMutableArray * countriesList;
}
@property (weak, nonatomic) IBOutlet UIButton *backButton;
-(id)init :(id)del;
- (IBAction)backMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UITableView *questionsListTable;

@end
