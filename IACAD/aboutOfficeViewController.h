//
//  aboutOfficeViewController.h
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
@interface aboutOfficeViewController : UIViewController <IACADServiceClientCaller>
{
     CustomizedACView * AC;
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)openmenuMethod:(id)sender;
- (IBAction)backMethod:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
