//
//  confirmDonationView.m
//  IACAD
//
//  Created by Ahmed Azab on 9/2/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "confirmDonationView.h"
#import "ArabicConverter.h"
#import "BlockAlertView.h"
#import "constructionViewController.h"


@implementation confirmDonationView
@synthesize amoutTF,projectNoteTF,projectNameTF;

- (id)initWithFrame:(CGRect)frame  :(id)del :(BOOL)qua :(double)cot :(BOOL)con :(int)numofSt :(int)catID
{
    self = [super initWithFrame:frame];
    if (self) {
        delegate = del;
        quant = qua;
        cont = con;
        cost = cot;
        remainingStocks = numofSt;
        categoryID = catID;
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
        UILabel * buttonLbl = [[UILabel alloc]initWithFrame:CGRectMake(5,95,295,39)];
        if ([appDelegate.culture isEqualToString:@"ar"])
            buttonLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"confirm_donate_lbl",appDelegate.culture, @"")];
        else
            buttonLbl.text = NSLocalizedStringFromTable(@"confirm_donate_lbl",appDelegate.culture, @"");
        buttonLbl.textAlignment = NSTextAlignmentCenter;
        buttonLbl.backgroundColor=[UIColor clearColor];
        buttonLbl.textColor=[UIColor whiteColor];
        buttonLbl.font = boldFont;
        [self addSubview:buttonLbl];
        
        
        if (categoryID == 1 || categoryID == 4)
        {
            [self catid1];
        }
        else
        {
            [self AnotherCatID];
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(dismissKeyboard)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        tap.delegate = self;
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
    NSString * textString =  @"";
    if (quant == TRUE)
        textString = NSLocalizedStringFromTable(@"enter_number_units",appDelegate.culture, @"");
    else if (cont == TRUE)
        textString = NSLocalizedStringFromTable(@"enter_stock",appDelegate.culture, @"");
    else
        textString = @"";
    
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
    //    [self addSubview:textLbl];
    
    if (quant == TRUE)
    {
        UIFont * boldFont6;
        if([appDelegate.culture isEqualToString:@"ar"])
            boldFont6=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
        else
            boldFont6=[UIFont systemFontOfSize:12];
        
        //        UILabel *  totalLbl = [[UILabel alloc]init];
        //        if ([appDelegate.culture isEqualToString:@"ar"])
        //        {
        //            totalLbl.frame = CGRectMake(10, 65, 280, 30);
        //            totalLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"total_value",appDelegate.culture, @"")];
        //            totalLbl.textAlignment = NSTextAlignmentRight;
        //        }
        //        else
        //        {
        //            totalLbl.frame = CGRectMake(10, 70, 280, 30);
        //            totalLbl.text = NSLocalizedStringFromTable(@"total_value",appDelegate.culture, @"");
        //            totalLbl.textAlignment = NSTextAlignmentLeft;
        //        }
        //        totalLbl.backgroundColor=[UIColor clearColor];
        //        totalLbl.textColor=[UIColor whiteColor];
        //        totalLbl.font = boldFont6;
        //        [self addSubview:totalLbl];
        //
        //        NSString * temp = [@"0" stringByAppendingString:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
        //
        //        totalAmount = [[UILabel alloc]init];
        //        if ([appDelegate.culture isEqualToString:@"ar"])
        //        {
        //            totalAmount.frame = CGRectMake(100,65,90,15);
        //            totalAmount.text = [converter convertArabic:temp];
        //            totalAmount.textAlignment = UITextAlignmentRight;
        //        }
        //        else
        //        {
        //            totalAmount.frame = CGRectMake(75,70,90,15);
        //            totalAmount.text = temp;
        //            totalAmount.textAlignment = NSTextAlignmentLeft;
        //        }
        //        totalAmount.tag = 10;
        //        totalAmount.backgroundColor=[UIColor clearColor];
        //        totalAmount.textColor=[UIColor whiteColor];
        //        totalAmount.font = boldFont6;
        //        [self addSubview:totalAmount];
        
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
    
    
    //    UIImageView * fieldImage = [[UIImageView alloc] init];
    //    if ([appDelegate.culture isEqualToString:@"ar"])
    //        fieldImage.frame = CGRectMake(10,25,82,41);
    //    else
    //        fieldImage.frame = CGRectMake(210,25,82,41);
    //    [fieldImage setImage:[UIImage imageNamed:@"donate-textfield_bg"]];
    //    [self addSubview:fieldImage];
    
    
    NSString * placeholder = @"";
    if (quant == TRUE)
        placeholder = NSLocalizedStringFromTable(@"units_lbl",appDelegate.culture, @"");
    else if (cont == TRUE)
        placeholder = NSLocalizedStringFromTable(@"shares_lbl",appDelegate.culture, @"");
    else
        placeholder = @"";
    
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
}


-(void) catid1
{
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    UIFont * boldFont3;
    if([appDelegate.culture isEqualToString:@"ar"])
        boldFont3=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
    else
        boldFont3=[UIFont systemFontOfSize:14];
    
    projectNameTF = [[UITextField alloc] init];
    projectNameTF.font = boldFont3;
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        projectNameTF.text = [converter convertArabic: @""];
        projectNameTF.placeholder=[converter convertArabic:NSLocalizedStringFromTable(@"project_name_lbl",appDelegate.culture, @"")];
        if (cont == TRUE)
            projectNameTF.frame=CGRectMake(100,20,200,30);
        else
            projectNameTF.frame=CGRectMake(10,20,290,30);
        projectNameTF.textAlignment = NSTextAlignmentRight;
    }
    else
    {
        projectNameTF.text = @"";
        projectNameTF.placeholder=NSLocalizedStringFromTable(@"project_name_lbl",appDelegate.culture, @"");
        if (cont == TRUE)
            projectNameTF.frame=CGRectMake(10,20,200,30);
        else
            projectNameTF.frame=CGRectMake(10,20,290,30);
        projectNameTF.textAlignment = NSTextAlignmentLeft;
    }
    projectNameTF.returnKeyType=UIReturnKeyDefault;
    projectNameTF.borderStyle = UITextBorderStyleLine;
    projectNameTF.textColor=[UIColor blackColor];
    projectNameTF.keyboardType = UIKeyboardTypeDefault;
    projectNameTF.autocorrectionType = UITextAutocorrectionTypeNo;
    projectNameTF.backgroundColor=[UIColor whiteColor];
    projectNameTF.delegate = self;
    projectNameTF.keyboardAppearance = UIBarStyleBlack;
    if (!cont) {
        [self addSubview:projectNameTF];
    }
    
    
    projectNoteTF = [[UITextField alloc] init];
    projectNoteTF.font = boldFont3;
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        projectNoteTF.text = [converter convertArabic: @""];
        projectNoteTF.placeholder=[converter convertArabic:NSLocalizedStringFromTable(@"project_note_lbl",appDelegate.culture, @"")];
        if (cont == TRUE)
            projectNoteTF.frame=CGRectMake(100,60,200,30);
        else
            projectNoteTF.frame=CGRectMake(10,60,290,30);
        projectNoteTF.textAlignment = NSTextAlignmentRight;
    }
    else
    {
        projectNoteTF.text = @"";
        projectNoteTF.placeholder=NSLocalizedStringFromTable(@"project_note_lbl",appDelegate.culture, @"");
        if (cont == TRUE)
            projectNoteTF.frame=CGRectMake(10,60,200,30);
        else
            projectNoteTF.frame=CGRectMake(10,60,290,30);
        projectNoteTF.textAlignment = NSTextAlignmentLeft;
    }
    
    projectNoteTF.returnKeyType=UIReturnKeyDefault;
    projectNoteTF.borderStyle = UITextBorderStyleLine;
    projectNoteTF.textColor=[UIColor blackColor];
    projectNoteTF.keyboardType = UIKeyboardTypeDefault;
    projectNoteTF.autocorrectionType = UITextAutocorrectionTypeNo;
    projectNoteTF.backgroundColor=[UIColor whiteColor];
    projectNoteTF.delegate = self;
    projectNoteTF.keyboardAppearance = UIBarStyleBlack;
    if (!cont) {
        [self addSubview:projectNoteTF];
    }
    
    if (cont == TRUE)
    {
        //        UIImageView * fieldImage = [[UIImageView alloc] init];
        //        if ([appDelegate.culture isEqualToString:@"ar"])
        //            fieldImage.frame = CGRectMake(10,25,82,41);
        //        else
        //            fieldImage.frame = CGRectMake(215,25,82,41);
        //        [fieldImage setImage:[UIImage imageNamed:@"donate-textfield_bg"]];
        //        [self addSubview:fieldImage];
        
        
        NSString * placeholder = @"";
        if (quant == TRUE)
            placeholder = NSLocalizedStringFromTable(@"units_lbl",appDelegate.culture, @"");
        else if (cont == TRUE)
            placeholder = NSLocalizedStringFromTable(@"shares_lbl",appDelegate.culture, @"");
        else
            placeholder = @"";
        
        UIFont * boldFont2;
        if([appDelegate.culture isEqualToString:@"ar"])
            boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        else
            boldFont2=[UIFont systemFontOfSize:14];
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
}

- (void)updateLabelUsingContentsOfTextField:(id)sender {
    if (((UITextField *)sender).text.length < 8) {
        
        if (quant == TRUE)
        {
            //        ArabicConverter *converter = [[ArabicConverter alloc] init];
            double value = [((UITextField *)sender).text doubleValue];
            double total = value * cost;
            NSString* myNewString = [NSString stringWithFormat:@"%.2f", total];
            //        NSString * temp = [myNewString stringByAppendingString:NSLocalizedStringFromTable(@"dirham_lbl",appDelegate.culture, @"")];
            //        if ([appDelegate.culture isEqualToString:@"ar"]) {
            //            totalAmount.text = [converter convertArabic:temp];
            //        }
            //        else {
            //            totalAmount.text = temp;
            //        }
            
            if ([appDelegate.culture isEqualToString:@"ar"]) {
                [lblTotal setText:[NSString stringWithFormat:@"مجموع: %@ درهم إماراتي", myNewString]];
            }
            else {
                [lblTotal setText:[NSString stringWithFormat:@"total: %@ AED", myNewString]];
            }
        }
        else if (cont) {
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
    }
    else {
        UITextField *txt = ((UITextField *)sender);
        txt.text = [txt.text substringToIndex:[txt.text length]-1];
    }
    
}

-(void) confirmAction
{
    if (categoryID == 1 || categoryID == 4)
        [self confirmCat1];
    else
        [self confirmOtherCat];
}

-(void) confirmCat1
{
    if (!cont)
    {
        int value = 0;
        [delegate getTotalAmount:value:projectNameTF.text:projectNoteTF.text];
    }
    else
    {
        if (![amoutTF.text isEqualToString:@""]) {
            int value = [amoutTF.text intValue];
            [delegate getTotalAmount:value:projectNameTF.text:projectNoteTF.text];
        }
        else {
            NSString * textString = @"";
            if (quant == TRUE)
                textString = NSLocalizedStringFromTable(@"enter_number_units",appDelegate.culture, @"");
            else if (cont == TRUE)
                textString = NSLocalizedStringFromTable(@"stocks_empty",appDelegate.culture, @"");
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:textString delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

-(void) confirmOtherCat
{
    if ([amoutTF.text isEqualToString:@""])
    {
        NSString * textString = @"";
        if (quant == TRUE)
            textString = NSLocalizedStringFromTable(@"enter_number_units",appDelegate.culture, @"");
        else if (cont == TRUE)
            textString = NSLocalizedStringFromTable(@"enter_value",appDelegate.culture, @"");
        
        //        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:textString];
        //        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
        //        [alert show];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:textString delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        if (cont == TRUE)
        {
            int totalstock = [amoutTF.text intValue];
            if (totalstock > remainingStocks)
            {
                //remaining_share_message
                //                BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"remaining_share_message",appDelegate.culture, @"")];
                //                [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
                //                [alert show];
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:NSLocalizedStringFromTable(@"remaining_share_message",appDelegate.culture, @"") delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
                [alert show];
                {
                    int value = [amoutTF.text intValue];
                    [delegate getTotalAmount:value:@"":@""];
                }
            }
            else
            {
                int value = [amoutTF.text intValue];
                [delegate getTotalAmount:value:@"":@""];
            }
        }
        
    }
}

-(void)dismissKeyboard
{
    if (amoutTF.isFirstResponder) {
        [amoutTF resignFirstResponder];
    }
    if (projectNameTF.isFirstResponder) {
        [projectNameTF resignFirstResponder];
    }
    if (projectNoteTF.isFirstResponder) {
        [projectNoteTF resignFirstResponder];
    }
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
