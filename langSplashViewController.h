//
//  langSplashViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 12/5/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;
@interface langSplashViewController : UIViewController
{
    id delegate;
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UIButton *arabicButton;
-(id)init:(id)del;
- (IBAction)englishMethod:(id)sender;
- (IBAction)arabicMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@end
