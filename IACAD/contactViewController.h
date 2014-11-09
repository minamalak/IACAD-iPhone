//
//  contactViewController.h
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
@interface contactViewController : UIViewController <IACADServiceClientCaller>
{
    AppDelegate * appDelegate;
    CustomizedACView * AC;
}
@property (weak, nonatomic) IBOutlet UIImageView *menuButtonImg;

@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
- (IBAction)openmenuMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
