//
//  FirstViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 7/18/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"

@interface FirstViewController : UIViewController <IACADServiceClientCaller,UINavigationControllerDelegate>
{
    UINavigationController * navControl;
}
@property (nonatomic, retain) UINavigationController * navControl;

@end
