//
//  AppDelegate.h
//  IACAD
//
//  Created by Ahmed Azab on 7/17/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RightViewController.h"
#import "IIViewDeckController.h"

@class IIViewDeckController;
@class ViewController;
@class RightViewController;
@class Reachability;
@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>
{
    UINavigationController * navControl;
    NSString * userName;
    NSString * userID;
    NSString * firstName;
    NSString * lastName;
    NSString * culture;
    int login;
    int countViews;
    int lastView;
    RightViewController* rightController;
    IIViewDeckController* deckController;
    
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
    BOOL ordered;
	UIView *conerror;
	BOOL condown;
    UIImageView *ViewactivityImage;
   
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * culture;
@property int login;
@property int countViews;
@property int lastView;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (retain, nonatomic) UIViewController *centerController;
@property (retain, nonatomic) IIViewDeckController* deckController;
@property (retain, nonatomic) RightViewController* rightController;
@property (retain, nonatomic) UINavigationController * navControl;
-(void) updateRightSideMenu;
-(void) backFromLangView;
-(void) showSideMenu;
@end
