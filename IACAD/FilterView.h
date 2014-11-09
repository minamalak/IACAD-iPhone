//
//  FilterView.h
//  IACAD
//
//  Created by Ahmed Azab on 8/19/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "donateDetailsListViewController.h"
#import "AppDelegate.h"

@class AppDelegate;
@interface FilterView : UIView <UITableViewDelegate,UITableViewDataSource,IACADServiceClientCaller>
{
    id delegate;
    UITableView * rtable;
    NSMutableArray * charitiesList;
    NSString * filterType;
    UIImageView * firstcellImage;
    int charityID;
    int countryID;
    int donateID;
    UIImageView * arrowleft;
    UIImageView * arrowright;
    int showTableOrg;
    int showTableCountry;
    UILabel * charity2Lbl;
    UILabel * country2Lbl;
    NSString * charityName;
    NSString * countryName;
    AppDelegate * appDelegate;
 
}

- (id)initWithFrame:(CGRect)frame  :(id)del :(int)charityid :(int)countryid :(int)donateid :(NSString *)charIndex :(NSString *)counIndex;

@end
