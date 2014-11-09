//
//  AppDelegate.m
//  IACAD
//
//  Created by Ahmed Azab on 7/17/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "IIViewDeckController.h"
#import "Flurry.h"
#import "Reachability.h"
#import "ArabicConverter.h"
#import "langSplashViewController.h"


@implementation AppDelegate
@synthesize window = _window;
@synthesize centerController = _viewController;
@synthesize navControl;
@synthesize userName,firstName,lastName,userID,login,culture;
@synthesize countViews,lastView;
@synthesize deckController,rightController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Flurry setCrashReportingEnabled:YES];
    [Flurry startSession:@"X3SP47QVZJCF3C84N88F"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    countViews = 0;
    lastView = 1;
    


    [self loadAppSettings];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *cul = [prefs objectForKey:@"culture"];
    culture = cul;
    if (!cul || [cul isEqualToString:@""])
        [self showLangView];
    else
        [self showAppViews];
    
    
    [self.window makeKeyAndVisible];

    [self monitorcon];
    return YES;
}
//
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
//    NSLog(@"url recieved: %@", url);
//    NSLog(@"query string: %@", [url query]);
//    NSLog(@"host: %@", [url host]);
//    NSLog(@"url path: %@", [url path]);
//    NSDictionary *dict = [self parseQueryString:[url query]];
//    NSLog(@"query dict: %@", dict);
//    return YES;
//}
//
//- (NSDictionary *)parseQueryString:(NSString *)query {
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
//    NSArray *pairs = [query componentsSeparatedByString:@"&"];
//    
//    for (NSString *pair in pairs) {
//        NSArray *elements = [pair componentsSeparatedByString:@"="];
//        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        
//        [dict setObject:val forKey:key];
//    }
//    return dict;
//}

-(void) showLangView
{
    langSplashViewController * langView = [[langSplashViewController alloc]init:self];
    self.window.rootViewController = langView;
}

-(void) backFromLangView
{
    [self showAppViews];
}

-(void) showAppViews
{
    navControl=[[UINavigationController alloc] init];
    navControl.navigationBar.hidden = YES;
    [navControl setNavigationBarHidden:YES];
    
    
    rightController = [[RightViewController alloc] initWithNibName:@"RightViewController" bundle:nil];
    
    ViewController *centerController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    //  navControl.view.frame = CGRectMake(0, 20, 320, self.window.frame.size.height-20);
    
    //  self.centerController = [[UINavigationController alloc] initWithRootViewController:centerController];
    [navControl pushViewController:centerController  animated:NO];
    
   if ([culture isEqualToString:@"ar"])
        deckController =  [[IIViewDeckController alloc] initWithCenterViewController:navControl
                                                                  leftViewController:nil
                                                                 rightViewController:rightController];
    else
        deckController =  [[IIViewDeckController alloc] initWithCenterViewController:navControl
                                                                  leftViewController:rightController
                                                                 rightViewController:nil];
        
    deckController.rightSize = 50;
    deckController.leftSize = 50;
    
    
    /* To adjust speed of open/close animations, set either of these two properties. */
    //  deckController.openSlideAnimationDuration = 0.15f;
    //  deckController.closeSlideAnimationDuration = 0.5f;
    
    
    
    self.window.rootViewController = deckController;
}

-(void) showSideMenu
{
    rightController = nil;
    [rightController.view removeFromSuperview];
     rightController = [[RightViewController alloc] initWithNibName:@"RightViewController" bundle:nil];
    lastView = 1;
    
    if ([culture isEqualToString:@"ar"])
    {
        deckController.leftController = nil;
        deckController.rightController = rightController;
    }
    else
    {
        deckController.leftController = rightController;
        deckController.rightController = nil;
    }
}

-(void) updateRightSideMenu
{
    [rightController updateSideMenu];
}

-(void) loadAppSettings
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *user = [prefs objectForKey:@"userName"];
    
    if (!user || [user isEqualToString:@""])
    {
        userName = @"";
        firstName = @"";
        lastName = @"";
        login = 0;
    }
    else
    {
        login = 1;
      userName = [prefs objectForKey:@"userName"];
        firstName = [prefs objectForKey:@"firstName"];
        lastName = [prefs objectForKey:@"lastName"];
        userID = [prefs objectForKey:@"userID"];
         [prefs synchronize];
    }
        
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //navControl.view.frame = CGRectMake(0, 20, 320, 568);
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Reachability methods

- (void) configureConAlert: (Reachability*) curReach
{
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    BOOL connectionRequired= [curReach connectionRequired];
	
    NSString* statusString= @"";
    switch (netStatus)
    {
        case NotReachable:
        {
            statusString = @"Access Not Available";
			
			if (!conerror)
			{
				conerror = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.window.frame.size.width,self.window.frame.size.height)];
				
				conerror.backgroundColor = [UIColor colorWithRed:195/255.f
                                                           green:213/255.f
                                                            blue:181/255.f
                                                           alpha:1.0];
				
				
                
				
				UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0,130,self.window.frame.size.width,100)];
				//lab.center = CGPointMake(window.center.x, window.center.y);
                
                UIFont * boldFont;
                //noconnection_lbl
                if ([culture isEqualToString:@"ar"])
                {
                    boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:16];
                    ArabicConverter *converter = [[ArabicConverter alloc] init];
                    lab.text = [converter convertArabic:NSLocalizedStringFromTable(@"noconnection_lbl",culture, @"")];
                }
                else
                {
                  boldFont=[UIFont systemFontOfSize:16];
                    lab.text = NSLocalizedStringFromTable(@"noconnection_lbl",culture, @"");
                }
				
				
				lab.font = boldFont;
				lab.lineBreakMode = NSLineBreakByWordWrapping;
				lab.textColor =[UIColor darkGrayColor];
				lab.backgroundColor=[UIColor clearColor];
				lab.numberOfLines = 0;
				lab.textAlignment = NSTextAlignmentCenter;
				lab.center = CGPointMake(self.window.center.x, lab.center.y);
				[conerror addSubview:lab];
				
				
				UIActivityIndicatorView *sig = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
				sig.center = CGPointMake(self.window.center.x+7,220);
				[sig startAnimating];
				[conerror addSubview:sig];
				//conerror.alpha = 0.94;
				
				
			}
			[self.window addSubview:conerror];
			condown=true;
			//            imageView.image = [UIImage imageNamed: @"stop-32.png"] ;
            //Minor interface detail- connectionRequired may return yes, even when the host is unreachable.  We cover that up here...
            connectionRequired= NO;
            break;
        }
            
        case ReachableViaWWAN:
        {
			if (condown)
			{
				//	if (!viewController.loaded)
				//		[viewController viewWillAppear:true];
				
				[conerror removeFromSuperview];
				conerror = nil;
				condown=false;
				//		condown=false;
			}
			//    statusString = @"Reachable WWAN";
			//    imageView.image = [UIImage imageNamed: @"WWAN5.png"];
            break;
        }
        case ReachableViaWiFi:
        {
			
			if (condown)
			{
				[conerror removeFromSuperview];
				conerror = nil;
				condown=false;
                
			}
			
			statusString= @"Reachable WiFi";
            
            
			//    imageView.image = [UIImage imageNamed: @"Airport.png"];
            break;
		}
    }
	
    if(connectionRequired)
    {
        statusString= [NSString stringWithFormat: @"%@, Connection Required", statusString];
    }
	//    textField.text= statusString;
}

- (void) updateInterfaceWithReachability: (Reachability*) curReach
{
    if(curReach == hostReach)
	{
		[self configureConAlert:curReach];
		//        NetworkStatus netStatus = [curReach currentReachabilityStatus];
        BOOL connectionRequired= [curReach connectionRequired];
        
        
		
		//    summaryLabel.hidden = (netStatus != ReachableViaWWAN);
        NSString* baseLabel=  @"";
        if(connectionRequired)
        {
            baseLabel=  @"Cellular data network is available.\n  Internet traffic will be routed through it after a connection is established.";
        }
        else
        {
            baseLabel=  @"Cellular data network is active.\n  Internet traffic will be routed through it.";
        }
		
		// summaryLabel.text= baseLabel;
    }
	
	if(curReach == internetReach)
	{
		[self configureConAlert:curReach];
	}
	if(curReach == wifiReach)
	{
		[self configureConAlert:curReach];
	}
	
}

//Called by Reachability whenever status changes.
- (void) reachabilityChanged: (NSNotification* )note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
	[self updateInterfaceWithReachability: curReach];
}


- (void) monitorcon
{
	// Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the
    // method "reachabilityChanged" will be called.
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
	
    //Change the host name here to change the server your monitoring
	//   remoteHostLabel.text = [NSString stringWithFormat: @"Remote Host: %@", @"www.apple.com"];
	hostReach = [Reachability reachabilityWithHostName: @"www.google.com"];
	[hostReach startNotifer];
    
    internetReach = [Reachability reachabilityForInternetConnection];
    [internetReach startNotifer];
    
    wifiReach = [Reachability reachabilityForLocalWiFi];
    [wifiReach startNotifer];
    
	
    
}


@end
