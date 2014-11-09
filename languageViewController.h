//
//  languageViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 12/4/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;
@interface languageViewController : UIViewController
{
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UILabel *englishLbl;
- (IBAction)englishMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *arabicLbl;
- (IBAction)arabicMethod:(id)sender;
- (IBAction)openmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIImageView *menuButtonImg;

@end
