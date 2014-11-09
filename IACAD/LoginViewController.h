//
//  LoginViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/5/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@interface LoginViewController : UIViewController
{
    AppDelegate * appDelegate;
    int type;
}
@property (weak, nonatomic) IBOutlet UILabel *labelLbl;
- (IBAction)newuserMethod:(id)sender;
- (IBAction)closeMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UILabel *newuserLbl;
@property (weak, nonatomic) IBOutlet UIButton *newuserButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)logoutMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *menuImage;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
- (IBAction)loginMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)openmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
-(id)init :(int)ty;
@end
