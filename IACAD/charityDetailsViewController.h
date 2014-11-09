//
//  charityDetailsViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/20/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADCharity.h"
#import "AppDelegate.h"

@class AppDelegate;
@interface charityDetailsViewController : UIViewController
{
    IACADCharity * itemDetails;
    AppDelegate * appDelegate;
}
- (IBAction)emailMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;
@property (weak, nonatomic) IBOutlet UILabel *emailString;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
- (IBAction)websiteMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *websiteButton;
@property (weak, nonatomic) IBOutlet UILabel *websiteString;
@property (weak, nonatomic) IBOutlet UILabel *websiteLbl;
@property (weak, nonatomic) IBOutlet UILabel *faxString;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *phoneString;
@property (weak, nonatomic) IBOutlet UILabel *phoneLbl;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *faxLbl;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
- (IBAction)phoneMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *activityString;
@property (weak, nonatomic) IBOutlet UILabel *descString;
@property (weak, nonatomic) IBOutlet UILabel *nameString;
@property (weak, nonatomic) IBOutlet UILabel *activityLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)backMethod:(id)sender;
-(id)init: (IACADCharity *)item;
@end
