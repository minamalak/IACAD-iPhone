//
//  confirmDonationView.h
//  IACAD
//
//  Created by Ahmed Azab on 9/2/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;
@interface confirmPersonalDonationView : UIView <UITextFieldDelegate,UITextViewDelegate>
{
    id delegate;
    UITextField *amoutTF;
//    UITextField *projectNameTF;
//    UITextField *projectNoteTF;
//    BOOL quant;
//    BOOL cont;
    UILabel * totalAmount;
    UILabel *lblTotal;
    double cost;
    AppDelegate * appDelegate;
//    int remainingStocks;
//    int categoryID;
}
- (id)initWithFrame:(CGRect)frame  :(id)del :(double)cot;// :(BOOL)qua :(BOOL)con :(int)numofSt :(int)catID;
@property (retain, nonatomic) UITextField * amoutTF;
//@property (retain, nonatomic) UITextField * projectNameTF;
//@property (retain, nonatomic) UITextField * projectNoteTF;
@end
