//
//  aboutViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/22/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;
@interface aboutViewController : UIViewController
{
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
- (IBAction)aboutOfficeMethod:(id)sender;
- (IBAction)aboutGateMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *officeLbl;
@property (weak, nonatomic) IBOutlet UILabel *gateLbl;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIImageView *menuButtonImg;

- (IBAction)openmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1Img;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2Img;
@end
