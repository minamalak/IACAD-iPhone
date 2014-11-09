//
//  browseViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/20/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;
@interface browseViewController : UIViewController
{
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
- (IBAction)charitiesMethod:(id)sender;
- (IBAction)statisticsMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *charitiesLbl;
@property (weak, nonatomic) IBOutlet UILabel *statisticsLbl;
- (IBAction)backMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1Img;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2Img;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)menuopenMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@end
