//
//  FilterView.h
//  IACAD
//
//  Created by Ahmed Azab on 8/19/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACADServiceClient.h"
#import "donateGridListViewController.h"
//#import "AppDelegate.h"

@class AppDelegate;

@interface PersonalFilterView : UIView <UITableViewDelegate,UITableViewDataSource,IACADServiceClientCaller>
{
    id delegate;
    UITableView * rtable;
    NSMutableArray * charitiesList;
    NSString * filterType;
    UIImageView * firstcellImage;
    int charityID;
    NSMutableArray *countryID;
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
 
    UIView *viewFiltersButtons;
    NSMutableArray *arraySelected;
    
    int charID;
    NSMutableArray * counID;
}

- (id)initWithFrame:(CGRect)frame  :(id)del :(int)charityid :(NSMutableArray *)countryid :(int)donateid :(NSString *)charIndex :(NSString *)counIndex;

@end
