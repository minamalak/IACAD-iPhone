//
//  confirmDonationView.m
//  IACAD
//
//  Created by Ahmed Azab on 9/2/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "confirmPersonalDonationView.h"
#import "ArabicConverter.h"
#import "BlockAlertView.h"
#import "constructionViewController.h"


@implementation confirmPersonalDonationView
@synthesize amoutTF;//,projectNoteTF,projectNameTF;

- (id)initWithFrame:(CGRect)frame  :(id)del :(double)cot// :(BOOL)qua :(BOOL)con :(int)numofSt :(int)catID
{
    self = [super initWithFrame:frame];
    if (self) {
        delegate = del;
        cost = cot;
        self.backgroundColor = [UIColor clearColor];
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        UIImageView * bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,304,145)];
        if ([appDelegate.culture isEqualToString:@"ar"])
            [bgImage setImage:[UIImage imageNamed:@"donate-popup_bg.png"]];
        else
            [bgImage setImage:[UIImage imageNamed:@"donate-popup_bg_en.png"]];
        [self addSubview:bgImage];
        
        UIImage *confirmImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"donate-confirm_btn" ofType:@"png"]];
        UIButton * cofirmButton =[[UIButton alloc]initWithFrame:CGRectMake(5,95,294,39)];
        [cofirmButton setBackgroundImage:confirmImage forState:UIControlStateNormal];
        [cofirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cofirmButton];
        UIFont * boldFont;
        if([appDelegate.culture isEqualToString:@"ar"])
            boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:16];
        else
            boldFont=[UIFont systemFontOfSize:16];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        UILabel * buttonLbl = [[UILabel alloc]initWithFrame:CGRectMake(5,95,294,39)];
        if ([appDelegate.culture isEqualToString:@"ar"])
            buttonLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"confirm_donate_lbl",appDelegate.culture, @"")];
        else
            buttonLbl.text = NSLocalizedStringFromTable(@"confirm_donate_lbl",appDelegate.culture, @"");
        buttonLbl.textAlignment = NSTextAlignmentCenter;
        buttonLbl.backgroundColor=[UIColor clearColor];
        buttonLbl.textColor=[UIColor whiteColor];
        buttonLbl.font = boldFont;
        [self addSubview:buttonLbl];
        
        [self AnotherCatID];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(dismissKeyboard)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        tap.delegate = (id)self;
        [self addGestureRecognizer:tap];
        
    }
    return self;
}


-(void) AnotherCatID
{
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    UIFont * boldFont3;
    if([appDelegate.culture isEqualToString:@"ar"])
        boldFont3=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
    else
        boldFont3=[UIFont systemFontOfSize:14];
    
    NSString * textString = NSLocalizedStringFromTable(@"enter_number_months",appDelegate.culture, @"");
    
    UILabel * textLbl = [[UILabel alloc]init];
    if([appDelegate.culture isEqualToString:@"ar"])
    {
        textLbl.frame = CGRectMake(105,20,180,50);
        textLbl.text = [converter convertArabic:textString];
        textLbl.textAlignment = NSTextAlignmentRight;
    }
    else
    {
        textLbl.frame = CGRectMake(10,10,180,70);
        textLbl.text = textString;
        textLbl.textAlignment = NSTextAlignmentLeft;
    }
    textLbl.numberOfLines = 0;
    textLbl.backgroundColor=[UIColor clearColor];
    textLbl.textColor=[UIColor whiteColor];
    textLbl.font = boldFont3;
    [self addSubview:textLbl];
    
    NSString * placeholder = NSLocalizedStringFromTable(@"months_lbl",appDelegate.culture, @"");
    
    UIFont * boldFont2;
    if([appDelegate.culture isEqualToString:@"ar"])
        boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:20];
    else
        boldFont2=[UIFont systemFontOfSize:20];
    amoutTF = [[UITextField alloc] init];
    amoutTF.font = boldFont2;
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        amoutTF.text = [converter convertArabic: @""];
        amoutTF.placeholder=[converter convertArabic:placeholder];
        amoutTF.frame=CGRectMake(10,30,280,30);
        amoutTF.textAlignment = NSTextAlignmentRight;
    }
    else
    {
        amoutTF.text = @"";
        amoutTF.placeholder=placeholder;
        amoutTF.frame=CGRectMake(10,30,280,30);
        amoutTF.textAlignment = NSTextAlignmentLeft;
    }
    amoutTF.returnKeyType=UIReturnKeyDefault;
    amoutTF.borderStyle = UITextBorderStyleLine;
    amoutTF.textColor=[UIColor blackColor];
    amoutTF.keyboardType = UIKeyboardTypeNumberPad;
    amoutTF.autocorrectionType = UITextAutocorrectionTypeNo;
    amoutTF.backgroundColor=[UIColor whiteColor];
    amoutTF.delegate = self;
    [amoutTF addTarget:self action:@selector(updateLabelUsingContentsOfTextField:) forControlEvents:UIControlEventEditingChanged];
    amoutTF.keyboardAppearance = UIBarStyleBlack;
    [self addSubview:amoutTF];
    
    lblTotal = [[UILabel alloc]initWithFrame:CGRectMake(10, 65, 280, 30)];
    if([appDelegate.culture isEqualToString:@"ar"]) {
        [lblTotal setText:@"مجموع: ٠ درهم اماراتي"];
        [lblTotal setTextAlignment:NSTextAlignmentRight];
    }
    else {
        [lblTotal setText:@"total: 0 AED"];
        [lblTotal setTextAlignment:NSTextAlignmentLeft];
    }
    
    [lblTotal setFont:boldFont3];
    [lblTotal setBackgroundColor:[UIColor clearColor]];
    [lblTotal setTextColor:[UIColor whiteColor]];
    [self addSubview:lblTotal];
}

- (void)updateLabelUsingContentsOfTextField:(id)sender {
    
    if (((UITextField *)sender).text.length < 8) {
        double value = [((UITextField *)sender).text floatValue];
        double total = value * cost;
        NSString* myNewString = [NSString stringWithFormat:@"%.2f", total];
        if ([appDelegate.culture isEqualToString:@"ar"]) {
            [lblTotal setText:[NSString stringWithFormat:@"مجموع: %@ درهم إماراتي", myNewString]];
        }
        else {
            [lblTotal setText:[NSString stringWithFormat:@"total: %@ AED", myNewString]];
        }
    }
    else {
        UITextField *txt = ((UITextField *)sender);
        txt.text = [txt.text substringToIndex:[txt.text length]-1];
    }
}

-(void) confirmAction
{
    //    if (categoryID == 1)
    //        [self confirmCat1];
    //    else
    [self confirmOtherCat];
    
}

//-(void) confirmCat1
//{
//    if (cont == FALSE)
//    {
//        if ([projectNameTF.text isEqualToString:@""])
//        {
//            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"project_name_msg",appDelegate.culture, @"")];
//            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
//            [alert show];
//        }
//        else
//        if ([amoutTF.text isEqualToString:@""])
//        {
//            NSString * textString = @"";
//            if (quant == TRUE)
//                textString = NSLocalizedStringFromTable(@"enter_number_units",appDelegate.culture, @"");
//            else if (cont == TRUE)
//                textString = NSLocalizedStringFromTable(@"enter_value",appDelegate.culture, @"");
//
//            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:textString];
//            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
//            [alert show];
//        }
//        else
//        {
//            int value = 0;
//            [delegate getTotalAmount:value:projectNameTF.text:projectNoteTF.text];
//        }
//    }
//    else
//    {
//        int value = [amoutTF.text intValue];
//        if ([projectNameTF.text isEqualToString:@""])
//        {
//            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"project_name_msg",appDelegate.culture, @"")];
//            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
//            [alert show];
//        }
//        else if (value > remainingStocks)
//        {
//            BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"value_more_remaining_lbl",appDelegate.culture, @"")];
//            [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
//            [alert show];
//        }
//        else
//        {
//
//            [delegate getTotalAmount:value:projectNameTF.text:projectNoteTF.text];
//        }
//    }
//}

-(void) confirmOtherCat
{
    if ([amoutTF.text isEqualToString:@""])
    {
        NSString * textString = NSLocalizedStringFromTable(@"enter_number_months",appDelegate.culture, @"");
        //        if (quant == TRUE)
        //            textString = NSLocalizedStringFromTable(@"enter_number_units",appDelegate.culture, @"");
        //        else if (cont == TRUE)
        //            textString = NSLocalizedStringFromTable(@"enter_value",appDelegate.culture, @"");
        
        //        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:textString];
        //        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
        //        [alert show];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:textString delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        //        if (cont == TRUE)
        //        {
        //            int totalstock = [amoutTF.text intValue];
        //            if (totalstock > remainingStocks)
        //            {
        //                //remaining_share_message
        //                BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"remaining_share_message",appDelegate.culture, @"")];
        //                [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
        //                [alert show];
        //            }
        //            else
        //            {
        //                int value = [amoutTF.text intValue];
        //                [delegate getTotalAmount:value:@"":@""];
        //            }
        //        }
        //        else
        //        {
        int value = [amoutTF.text intValue];
        [delegate getTotalAmount:value:@"":@""];
        //        }
    }
}

-(void)dismissKeyboard
{
    if (amoutTF.isFirstResponder) {
        [amoutTF resignFirstResponder];
    }
    //    if (projectNameTF.isFirstResponder) {
    //        [projectNameTF resignFirstResponder];
    //    }
    //    if (projectNoteTF.isFirstResponder) {
    //        [projectNoteTF resignFirstResponder];
    //    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ! ([touch.view isKindOfClass:[UIControl class]]);
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
