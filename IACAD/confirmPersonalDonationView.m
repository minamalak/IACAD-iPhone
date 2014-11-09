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
//        quant = qua;
//        cont = con;
        cost = cot;
//        remainingStocks = numofSt;
//        categoryID = catID;
        self.backgroundColor = [UIColor clearColor];
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        UIImageView * bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,304,145)];
        if ([appDelegate.culture isEqualToString:@"ar"])
            [bgImage setImage:[UIImage imageNamed:@"donate-popup_bg.png"]];
        else
            [bgImage setImage:[UIImage imageNamed:@"donate-popup_bg_en.png"]];
        [self addSubview:bgImage];
        
        
        
        UIImage *confirmImage= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"donate-confirm_btn" ofType:@"png"]];
        UIButton * cofirmButton =[[UIButton alloc]initWithFrame:CGRectMake(5,85,294,52)];
        [cofirmButton setBackgroundImage:confirmImage forState:UIControlStateNormal];
        [cofirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cofirmButton];
        UIFont * boldFont;
        if([appDelegate.culture isEqualToString:@"ar"])
            boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:16];
        else
            boldFont=[UIFont systemFontOfSize:16];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        UILabel * buttonLbl = [[UILabel alloc]initWithFrame:CGRectMake(5,85,295,52)];
        if ([appDelegate.culture isEqualToString:@"ar"])
            buttonLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"confirm_donate_lbl",appDelegate.culture, @"")];
        else
            buttonLbl.text = NSLocalizedStringFromTable(@"confirm_donate_lbl",appDelegate.culture, @"");
        buttonLbl.textAlignment = UITextAlignmentCenter;
        buttonLbl.backgroundColor=[UIColor clearColor];
        buttonLbl.textColor=[UIColor whiteColor];
        buttonLbl.font = boldFont;
        [self addSubview:buttonLbl];
        
        
//        if (categoryID == 1)
//        {
//            [self catid1];
//        }
//        else
//        {
            [self AnotherCatID];
//        }
        
        
        
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
//    if (quant == TRUE)
//        textString = NSLocalizedStringFromTable(@"enter_number_units",appDelegate.culture, @"");
//    else if (cont == TRUE)
//        textString = NSLocalizedStringFromTable(@"enter_stock",appDelegate.culture, @"");
//    else
//        textString = @"";
    
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
    
//    if (quant == TRUE)
//    {
        UIFont * boldFont6;
        if([appDelegate.culture isEqualToString:@"ar"])
            boldFont6=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
        else
            boldFont6=[UIFont systemFontOfSize:12];
        UILabel *  totalLbl = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            totalLbl.frame = CGRectMake(190,65,85,15);
            totalLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"total_value",appDelegate.culture, @"")];
            totalLbl.textAlignment = UITextAlignmentRight;
        }
        else
        {
            totalLbl.frame = CGRectMake(10,70,85,15);
            totalLbl.text = NSLocalizedStringFromTable(@"total_value",appDelegate.culture, @"");
            totalLbl.textAlignment = NSTextAlignmentLeft;
        }
        totalLbl.backgroundColor=[UIColor clearColor];
        totalLbl.textColor=[UIColor whiteColor];
        totalLbl.font = boldFont6;
        [self addSubview:totalLbl];
        
        NSString * temp = [@"0" stringByAppendingString:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
        
        totalAmount = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            totalAmount.frame = CGRectMake(100,65,90,15);
            totalAmount.text = [converter convertArabic:temp];
            totalAmount.textAlignment = UITextAlignmentRight;
        }
        else
        {
            totalAmount.frame = CGRectMake(75,70,90,15);
            totalAmount.text = temp;
            totalAmount.textAlignment = NSTextAlignmentLeft;
        }
        totalAmount.tag = 10;
        totalAmount.backgroundColor=[UIColor clearColor];
        totalAmount.textColor=[UIColor whiteColor];
        totalAmount.font = boldFont6;
        [self addSubview:totalAmount];
//    }
    
    
    UIImageView * fieldImage = [[UIImageView alloc] init];
    if ([appDelegate.culture isEqualToString:@"ar"])
        fieldImage.frame = CGRectMake(10,25,82,41);
    else
        fieldImage.frame = CGRectMake(210,25,82,41);
    [fieldImage setImage:[UIImage imageNamed:@"donate-textfield_bg"]];
    [self addSubview:fieldImage];
    
    NSString * placeholder = NSLocalizedStringFromTable(@"months_lbl",appDelegate.culture, @"");
    
//    if (quant == TRUE)
//        placeholder = NSLocalizedStringFromTable(@"units_lbl",appDelegate.culture, @"");
//    else if (cont == TRUE)
//        placeholder = NSLocalizedStringFromTable(@"shares_lbl",appDelegate.culture, @"");
//    else
//        placeholder = @"";
    
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
        amoutTF.frame=CGRectMake(10,33,82,41);
    }
    else
    {
        amoutTF.text = @"";
        amoutTF.placeholder=placeholder;
        amoutTF.frame=CGRectMake(210,33,82,41);
    }
    amoutTF.textAlignment = UITextAlignmentCenter;
    amoutTF.returnKeyType=UIReturnKeyDefault;
    amoutTF.borderStyle = UITextBorderStyleNone;
    amoutTF.textColor=[UIColor blackColor];
    amoutTF.keyboardType = UIKeyboardTypeNumberPad;
    amoutTF.autocorrectionType = UITextAutocorrectionTypeNo;
    amoutTF.backgroundColor=[UIColor clearColor];
    amoutTF.delegate = self;
    [amoutTF addTarget:self action:@selector(updateLabelUsingContentsOfTextField:) forControlEvents:UIControlEventEditingChanged];
    amoutTF.keyboardAppearance = UIBarStyleBlack;
    [self addSubview:amoutTF];
}

//
//-(void) catid1
//{
//    ArabicConverter *converter = [[ArabicConverter alloc] init];
//    UIFont * boldFont3;
//    if([appDelegate.culture isEqualToString:@"ar"])
//        boldFont3=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
//    else
//        boldFont3=[UIFont systemFontOfSize:14];
//    
//    
//    
//    
//    //    projectNameTF = [[UITextField alloc] init];
//    //    projectNameTF.font = boldFont3;
//    //    if ([appDelegate.culture isEqualToString:@"ar"])
//    //    {
//    //        projectNameTF.text = [converter convertArabic: @""];
//    //        projectNameTF.placeholder=[converter convertArabic:NSLocalizedStringFromTable(@"project_name_lbl",appDelegate.culture, @"")];
//    //        if (cont == TRUE)
//    //            projectNameTF.frame=CGRectMake(100,20,200,25);
//    //        else
//    //           projectNameTF.frame=CGRectMake(10,20,290,25);
//    //        projectNameTF.textAlignment = NSTextAlignmentRight;
//    //    }
//    //    else
//    //    {
//    //        projectNameTF.text = @"";
//    //        projectNameTF.placeholder=NSLocalizedStringFromTable(@"project_name_lbl",appDelegate.culture, @"");
//    //        if (cont == TRUE)
//    //            projectNameTF.frame=CGRectMake(10,20,200,25);
//    //        else
//    //            projectNameTF.frame=CGRectMake(10,20,290,25);
//    //        projectNameTF.textAlignment = NSTextAlignmentLeft;
//    //    }
//    //    projectNameTF.returnKeyType=UIReturnKeyDefault;
//    //    projectNameTF.borderStyle = UITextBorderStyleLine;
//    //    projectNameTF.textColor=[UIColor blackColor];
//    //    projectNameTF.keyboardType = UIKeyboardTypeDefault;
//    //    projectNameTF.autocorrectionType = UITextAutocorrectionTypeNo;
//    //    projectNameTF.backgroundColor=[UIColor whiteColor];
//    //    projectNameTF.delegate = self;
//    //    projectNameTF.keyboardAppearance = UIBarStyleBlack;
//    //    [self addSubview:projectNameTF];
//    
//    
//    //    projectNoteTF = [[UITextField alloc] init];
//    //    projectNoteTF.font = boldFont3;
//    //    if ([appDelegate.culture isEqualToString:@"ar"])
//    //    {
//    //        projectNoteTF.text = [converter convertArabic: @""];
//    //        projectNoteTF.placeholder=[converter convertArabic:NSLocalizedStringFromTable(@"project_note_lbl",appDelegate.culture, @"")];
//    //        if (cont == TRUE)
//    //            projectNoteTF.frame=CGRectMake(100,50,200,25);
//    //        else
//    //            projectNoteTF.frame=CGRectMake(10,50,290,25);
//    //        projectNoteTF.textAlignment = NSTextAlignmentRight;
//    //    }
//    //    else
//    //    {
//    //        projectNoteTF.text = @"";
//    //        projectNoteTF.placeholder=NSLocalizedStringFromTable(@"project_note_lbl",appDelegate.culture, @"");
//    //        if (cont == TRUE)
//    //        projectNoteTF.frame=CGRectMake(10,50,200,25);
//    //        else
//    //            projectNoteTF.frame=CGRectMake(10,50,290,25);
//    //        projectNoteTF.textAlignment = NSTextAlignmentLeft;
//    //    }
//    //
//    //    projectNoteTF.returnKeyType=UIReturnKeyDefault;
//    //    projectNoteTF.borderStyle = UITextBorderStyleLine;
//    //    projectNoteTF.textColor=[UIColor blackColor];
//    //    projectNoteTF.keyboardType = UIKeyboardTypeDefault;
//    //    projectNoteTF.autocorrectionType = UITextAutocorrectionTypeNo;
//    //    projectNoteTF.backgroundColor=[UIColor whiteColor];
//    //    projectNoteTF.delegate = self;
//    //    projectNoteTF.keyboardAppearance = UIBarStyleBlack;
//    //    [self addSubview:projectNoteTF];
//    
//    if (cont == TRUE)
//    {
//        UIImageView * fieldImage = [[UIImageView alloc] init];
//        if ([appDelegate.culture isEqualToString:@"ar"])
//            fieldImage.frame = CGRectMake(10,25,82,41);
//        else
//            fieldImage.frame = CGRectMake(215,25,82,41);
//        [fieldImage setImage:[UIImage imageNamed:@"donate-textfield_bg"]];
//        [self addSubview:fieldImage];
//        
//        
//        NSString * placeholder = @"";
//        if (quant == TRUE)
//            placeholder = NSLocalizedStringFromTable(@"units_lbl",appDelegate.culture, @"");
//        else if (cont == TRUE)
//            placeholder = NSLocalizedStringFromTable(@"shares_lbl",appDelegate.culture, @"");
//        else
//            placeholder = @"";
//        
//        UIFont * boldFont2;
//        if([appDelegate.culture isEqualToString:@"ar"])
//            boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:20];
//        else
//            boldFont2=[UIFont systemFontOfSize:20];
//        amoutTF = [[UITextField alloc] init];
//        amoutTF.font = boldFont2;
//        if ([appDelegate.culture isEqualToString:@"ar"])
//        {
//            amoutTF.text = [converter convertArabic: @""];
//            amoutTF.placeholder=[converter convertArabic:placeholder];
//            amoutTF.frame=CGRectMake(10,33,82,41);
//        }
//        else
//        {
//            amoutTF.text = @"";
//            amoutTF.placeholder=placeholder;
//            amoutTF.frame=CGRectMake(210,33,82,41);
//        }
//        amoutTF.textAlignment = UITextAlignmentCenter;
//        amoutTF.returnKeyType=UIReturnKeyDefault;
//        amoutTF.borderStyle = UITextBorderStyleNone;
//        amoutTF.textColor=[UIColor blackColor];
//        amoutTF.keyboardType = UIKeyboardTypeNumberPad;
//        amoutTF.autocorrectionType = UITextAutocorrectionTypeNo;
//        amoutTF.backgroundColor=[UIColor clearColor];
//        amoutTF.delegate = self;
//        [amoutTF addTarget:self action:@selector(updateLabelUsingContentsOfTextField:) forControlEvents:UIControlEventEditingChanged];
//        amoutTF.keyboardAppearance = UIBarStyleBlack;
//        [self addSubview:amoutTF];
//    }
//    
//    
//}


- (void)updateLabelUsingContentsOfTextField:(id)sender {
//    
//    if (quant == TRUE)
//    {
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        int value = [((UITextField *)sender).text intValue];
        int total = value * cost;
        NSString* myNewString = [NSString stringWithFormat:@"%i", total];
        NSString * temp = [myNewString stringByAppendingString:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
        if ([appDelegate.culture isEqualToString:@"ar"])
            totalAmount.text = [converter convertArabic:temp];
        else
            totalAmount.text = temp;
//    }
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
        
        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:textString];
        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
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
