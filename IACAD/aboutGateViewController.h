//
//  aboutGateViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/22/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "AppDelegate.h"

@class AppDelegate;
@class CustomizedACView;
@interface aboutGateViewController : UIViewController <IACADServiceClientCaller>
{
    CustomizedACView * AC;
    AppDelegate * appDelegate;
}
- (IBAction)backMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)openmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@end
