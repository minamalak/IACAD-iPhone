//
//  SecretQuestionViewController.m
//  IACAD
//
//  Created by Mina Malak on 12/2/14.
//  Copyright (c) 2014 Ahmed Azab. All rights reserved.
//

#import "SecretQuestionViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ArabicConverter.h"
#import "CustomizedACView.h"
#import "IIViewDeckController.h"
//#import "IACADCountry.h"
//#import "IACADGetCountries.h"
//#import "IACADGetCountriesResponse.h"
#import "IACADListSecretQuestions.h"
#import "IACADListSecretQuestionsResponse.h"
#import "NewuserViewController.h"
#import "ChangePasswordViewController.h"

@interface SecretQuestionViewController ()

@end

@implementation SecretQuestionViewController

-(id)init :(id)del{
    if(self = [super init])
    {
        delegate = del;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"choose_question",appDelegate.culture, @"")];
        self.titleLbl.font = boldFont;
    }
    else
    {
        self.titleLbl.text = NSLocalizedStringFromTable(@"choose_question",appDelegate.culture, @"");
        
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    }
    
//    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
//    AC.center=self.view.center;
//    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
//    [AC startLoading];
//    [self.view addSubview:AC];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(detectTapGesture)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    [self fillTable];
    
//    IACADListSecretQuestions * request = [[IACADListSecretQuestions alloc]init];
//    request.culture = appDelegate.culture;
//    
//    IACADServiceClient * client = [[IACADServiceClient alloc]init];
//    [client ListSecretQuestionsAsyncIsPost:YES input:request caller:self];
}

//-(void)ListSecretQuestionsCallback:(IACADListSecretQuestionsResponse *)response error:(NSError *)error
//{
//    [AC stopLoading];
//    [questionsList removeAllObjects];
//    questionsList = nil;
//    questionsList = [[NSMutableArray alloc]init];
//    questionsList = response.ListSecretQuestionsResult;
//    if ([questionsList count]>0)
//        [self fillTable];
//}

-(void) fillTable
{
    self.questionsListTable.alpha = 1;
    self.questionsListTable.dataSource = self;
    self.questionsListTable.delegate = self;
    [self.questionsListTable reloadData];
}


#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    
    NSString * item = [_questionsList objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
        UIImageView * bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,312,50)];
        [bgImage setImage:[UIImage imageNamed:@"browse_listbg.png"]];
        [cell.contentView addSubview:bgImage];
        
        
        
        UILabel *donationDesc = [[UILabel alloc] init];
        UIFont *boldFont=[UIFont systemFontOfSize:14];
        donationDesc.font = boldFont;
        donationDesc.frame=CGRectMake(15, 0, 280,50);
        donationDesc.backgroundColor = [UIColor clearColor];
//        donationDesc.lineBreakMode = UILineBreakModeWordWrap;
        donationDesc.textColor = [UIColor colorWithRed:137/255.f
                                                 green:137/255.f
                                                  blue:137/255.f
                                                 alpha:1.0];
        donationDesc.tag = 30;
        if ([appDelegate.culture isEqualToString:@"ar"])
            donationDesc.textAlignment = NSTextAlignmentRight;
        else
            donationDesc.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:donationDesc];
    }
    
    UILabel *lbl5 = (UILabel *)[cell.contentView viewWithTag:30];
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        lbl5.text = [converter convertArabic: item];
    }
    else
        lbl5.text = item;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_questionsList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath {
    
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        NSString * item  = [_questionsList objectAtIndex:indexPath.row];
        [delegate questionSelected:item];
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromRight;
        else
            transition.subtype = kCATransitionFromLeft;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];
    
}

- (IBAction)backMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else
    {
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromRight;
        else
            transition.subtype = kCATransitionFromLeft;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController popViewControllerAnimated:NO];
    }
}


-(void)detectTapGesture {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
