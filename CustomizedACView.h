//
//  CustomizedACView.h
//  MasrawyUniversalApp
//
//  Created by Mohamed Waly on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;
@interface CustomizedACView : UIView
{

    UIActivityIndicatorView *ac;
    UILabel *LoadingString;
    AppDelegate * appDelegate;

}
-(void)startLoading;
-(void)stopLoading;
@property (nonatomic, retain)    UIActivityIndicatorView *ac;

@end
