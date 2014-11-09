//
//  eventDetailsViewController.h
//  IACAD
//
//  Created by Ahmed Azab on 8/21/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADIACADEvent.h"
#import "IACADServiceClient.h"
#import <MapKit/MapKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@class IACADIACADEvent;
@interface eventDetailsViewController : UIViewController <IACADServiceClientCaller,MKMapViewDelegate>
{
    IACADIACADEvent * itemDetails;
    AppDelegate * appDelegate;
}
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *calImg;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarImg;
@property (weak, nonatomic) IBOutlet UILabel *descString;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UILabel *enddateLbl;
@property (weak, nonatomic) IBOutlet UILabel *startdateLbl;
@property (weak, nonatomic) IBOutlet UILabel *endLbl;
@property (weak, nonatomic) IBOutlet UILabel *startLbl;
@property (weak, nonatomic) IBOutlet UILabel *headerLbl;
- (IBAction)openMapMethod:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
-(id)init: (IACADIACADEvent *)item;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)openmenuMethod:(id)sender;
- (IBAction)backMethod:(id)sender;

@end
