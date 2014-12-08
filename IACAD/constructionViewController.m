//
//  constructionViewController.m
//  IACAD
//
//  Created by Ahmed Azab on 8/26/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "constructionViewController.h"
#import "IACADCatalogDonationItem.h"
#import "ArabicConverter.h"
#import <QuartzCore/QuartzCore.h>
#import "AsyncImageView.h"
#import "LoginViewController.h"
#import "IIViewDeckController.h"
#import "IACADGetCharityName.h"
#import "IACADGetCharityNameResponse.h"
#import "IACADCharity.h"
#import "CustomizedACView.h"
#import "IACADDonateCatalogResult.h"
#import "IACADDonateToCatalogProject.h"
#import "IACADDonateToCatalogProjectResponse.h"
#import "BlockAlertView.h"

@interface constructionViewController ()

@end

@implementation constructionViewController

-(id)init:(IACADCatalogDonationItem *) item :(BOOL)isQ {
	if(self = [super init])
	{
        itemDetails = item;
        isQant = isQ;
        remainingStock = itemDetails.RemainingStock;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    charityName = @"";
    AsyncImageView * asyncImageView = [[AsyncImageView alloc] init];
    asyncImageView.frame = CGRectMake(26,16, 251,132);
    NSString * imageURL;
    imageURL = [NSString stringWithFormat:@"http://iacadcld.linkdev.com/Handlers/ShowImage.ashx?Guidid=%@&objectType=donationitem",itemDetails.ImageId];
    NSURL *url = [NSURL URLWithString:imageURL];
    asyncImageView.activityIndicatorStyle = UIActivityIndicatorViewStyleGray;
    [asyncImageView setImageURL:url];
    asyncImageView.backgroundColor=[UIColor clearColor];
    [self.scrollView addSubview:asyncImageView];
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:itemDetails.Name];
        self.titleLbl.font = boldFont;
        
        UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        self.orgLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"asembly_name",appDelegate.culture, @"")];
        self.orgLbl.font = boldFont2;
        
        self.countryLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"")];
        self.countryLbl.font = boldFont2;
        
        self.orgString.text = [converter convertArabic:charityName];
        self.orgString.font = boldFont2;
        
        self.countryString.text = [converter convertArabic:itemDetails.CountryName];
        self.countryString.font = boldFont2;
    }
    else
    {
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        self.donateButton.frame = CGRectMake(258, self.donateButton.frame.origin.y, self.donateButton.frame.size.width, self.donateButton.frame.size.height);
        [self.donateButton setImage:[UIImage imageNamed:@"donnateButton_en2.png"] forState:UIControlStateNormal];
        
        self.titleLbl.text = itemDetails.Name;
        
         self.orgLbl.text = NSLocalizedStringFromTable(@"asembly_name",appDelegate.culture, @"");
        self.orgLbl.textAlignment = NSTextAlignmentLeft;
        self.orgLbl.frame = CGRectMake(24, self.orgLbl.frame.origin.y, self.orgLbl.frame.size.width, self.orgLbl.frame.size.height);
        
        self.countryLbl.text = NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"");
        self.countryLbl.textAlignment = NSTextAlignmentLeft;
        self.countryLbl.frame = CGRectMake(24, self.countryLbl.frame.origin.y, self.countryLbl.frame.size.width, self.countryLbl.frame.size.height);
        
        self.orgString.text = charityName;
        self.orgString.frame = CGRectMake(110, self.orgString.frame.origin.y, self.orgString.frame.size.width, self.orgString.frame.size.height);
        self.orgString.textAlignment = NSTextAlignmentLeft;
        
        self.countryString.text = itemDetails.CountryName;
        self.countryString.frame = CGRectMake(110, self.countryString.frame.origin.y, self.countryString.frame.size.width, self.countryString.frame.size.height);
        self.countryString.textAlignment = NSTextAlignmentLeft;
        
         [self.greenImgBG setImage:[UIImage imageNamed:@"green_text_field_en.png"]];
        
    }
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(hidePopover)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:tap];
    
    /////////////////////////
    
    IACADGetCharityName *request = [[IACADGetCharityName alloc] init];
    request.culture = appDelegate.culture;
    request.charityId = itemDetails.CharityId;
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetCharityNameAsyncIsPost:YES input:request caller:self];
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
    
    ////////////////////////
    
    float height;
    
    if (itemDetails.CategoryId == 1 || itemDetails.CategoryId == 4)
        height = [self categoryType1];

    
    if (itemDetails.CategoryId == 3)
        height = [self categoryType3];
    
    if (itemDetails.CategoryId == 2)
    {
        ////////// PERSON
    }

    
    if (itemDetails.CategoryId == 1 || itemDetails.CategoryId == 3 || itemDetails.CategoryId == 4)
    {
        [self showStockData:height];
    }
}

-(void) GetCharityNameCallback:(IACADGetCharityNameResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    
    charityName = response.GetCharityNameResult;
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.orgString.text = [converter convertArabic:charityName];
        self.orgString.font = boldFont2;
    }
    else
    {
       UIFont * boldFont2=[UIFont systemFontOfSize:14];
        self.orgString.text = charityName;
        self.orgString.font = boldFont2;
    }
}

-(float) categoryType3
{
    float height=0.0;
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    UIFont * boldFont2;
    if([appDelegate.culture isEqualToString:@"ar"])
        boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
    else
        boldFont2=[UIFont systemFontOfSize:14];
   
/*    if (itemDetails.IsContribution == TRUE)
        costLabel = NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"");
    else
        costLabel = NSLocalizedStringFromTable(@"cost_lbl",appDelegate.culture, @"");
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.costLbl.text = [converter convertArabic:costLabel];
        if (itemDetails.IsContribution == TRUE)
            self.costLbl.frame = CGRectMake(179, self.costLbl.frame.origin.y, self.costLbl.frame.size.width+25, self.costLbl.frame.size.height);
    }
    else
    {
        self.costLbl.text = costLabel;
        self.costLbl.textAlignment = NSTextAlignmentLeft;
        if (itemDetails.IsContribution == FALSE)
            self.costLbl.frame = CGRectMake(24, self.costLbl.frame.origin.y, self.costLbl.frame.size.width, self.costLbl.frame.size.height);
        else
            self.costLbl.frame = CGRectMake(24, self.costLbl.frame.origin.y, self.costLbl.frame.size.width+40, self.costLbl.frame.size.height);
    }
    self.costLbl.font = boldFont2;
    self.costLbl.alpha = 1;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.costString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Cost] stringValue]];
        if (itemDetails.IsContribution == TRUE)
            self.costString.frame = CGRectMake(self.costString.frame.origin.x-35, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
    }
    else
    {
        self.costString.text = [[NSNumber numberWithInt:itemDetails.Cost] stringValue];
        self.costString.textAlignment = NSTextAlignmentLeft;
        if (itemDetails.IsContribution == FALSE)
            self.costString.frame= CGRectMake(70, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
        else
            self.costString.frame= CGRectMake(115, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
    }
    self.costString.font = boldFont2;
    self.costString.alpha = 1;
*/
    
    // Mina
    if ([appDelegate.culture isEqualToString:@"ar"])
        self.typeLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"project_type_lbl",appDelegate.culture, @"")];
    else
    {
        self.typeLbl.text = NSLocalizedStringFromTable(@"project_type_lbl",appDelegate.culture, @"");
        self.typeLbl.frame = CGRectMake(24, self.typeLbl.frame.origin.y, self.typeLbl.frame.size.width, self.typeLbl.frame.size.height);
        self.typeLbl.textAlignment = NSTextAlignmentLeft;
    }
    
    self.typeLbl.font = boldFont2;
    self.typeLbl.alpha = 1;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        self.typeString.text = [converter convertArabic:itemDetails.DonationTypeName];
    else
    {
        self.typeString.text = itemDetails.DonationTypeName;
        self.typeString.textAlignment = NSTextAlignmentLeft;
        self.typeString.frame = CGRectMake(120, self.typeLbl.frame.origin.y, self.typeString.frame.size.width, self.typeString.frame.size.height);
    }
    self.typeString.font = boldFont2;
    self.typeString.alpha = 1;
    
    
    NSString * costLabel = @"";
        if (itemDetails.IsContribution == TRUE)
     costLabel = NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"");
     else
     costLabel = NSLocalizedStringFromTable(@"cost_lbl",appDelegate.culture, @"");
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.costLbl.text = [converter convertArabic:costLabel];
        
        if (itemDetails.IsContribution == TRUE)
            self.costLbl.frame = CGRectMake(179, 238, 78+25, 29);
        else
        self.costLbl.frame = CGRectMake(204, 310,78, 29);
        
    }
    else
    {
        self.costLbl.text = costLabel;
        if (itemDetails.IsContribution == FALSE)
            self.costLbl.frame = CGRectMake(24, 310, 78, 29);
        else
            self.costLbl.frame = CGRectMake(24, 310, 78+40, 29);
        self.costLbl.frame = CGRectMake(24, 310,78, 29);
        self.costLbl.textAlignment = NSTextAlignmentLeft;
    }
    self.costLbl.font = boldFont2;
    self.costLbl.alpha = 1;
    
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
         self.costString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Cost] stringValue]];
        if (itemDetails.IsContribution == TRUE)
            self.costString.frame = CGRectMake(29-35, 310, 192, 29);
        else
        self.costString.frame = CGRectMake(29,310,162, 29);
    }
    else
    {
        self.costString.text = [[NSNumber numberWithInt:itemDetails.Cost] stringValue];
        if (itemDetails.IsContribution == FALSE)
            self.costString.frame= CGRectMake(100, 310, 192, 29);
        else
            self.costString.frame= CGRectMake(145, 280, 192, 29);
        self.costString.textAlignment = NSTextAlignmentLeft;
    }
    self.costString.font = boldFont2;
    self.costString.alpha = 1;
    
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.descLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"desc_lbl",appDelegate.culture, @"")];
        self.descLbl.frame = CGRectMake(204, 347,78, 29);
    }
    else
    {
        self.descLbl.text = NSLocalizedStringFromTable(@"desc_lbl",appDelegate.culture, @"");;
        self.descLbl.frame = CGRectMake(24, 347,100, 29);
        self.descLbl.textAlignment = NSTextAlignmentLeft;
    }
    self.descLbl.font = boldFont2;
    self.descLbl.alpha = 1;
    
    
   NSString * desc = itemDetails.Description;
    
    self.descString.font = boldFont2;
    self.descString.alpha = 1;
    
    CGSize labelsize;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        labelsize=[desc sizeWithFont:self.descString.font constrainedToSize:CGSizeMake(192, 300) lineBreakMode:NSLineBreakByWordWrapping];
        self.descString.frame = CGRectMake(30, 353, 192, labelsize.height);
        self.descString.text = [converter convertArabic:desc];
    }
    else
    {
        labelsize = [desc sizeWithFont:self.descString.font constrainedToSize:CGSizeMake(172, 300) lineBreakMode:NSLineBreakByWordWrapping];
        self.descString.frame = CGRectMake(110, 353, 172, labelsize.height);
        self.descString.text = desc;
        self.descString.textAlignment = NSTextAlignmentLeft;
    }
    
    
    UILabel * lblTime = [[UILabel alloc]init];
    if([appDelegate.culture isEqualToString:@"ar"])
    {
        lblTime.frame = CGRectMake(133,370 + labelsize.height,150,29);
        lblTime.text = [converter convertArabic:NSLocalizedStringFromTable(@"time_lbl",appDelegate.culture, @"")];
        lblTime.textAlignment = NSTextAlignmentRight;
    }
    else
    {
        lblTime.frame = CGRectMake(24,370 + labelsize.height,150,29);
        lblTime.text = NSLocalizedStringFromTable(@"time_lbl",appDelegate.culture, @"");
        lblTime.textAlignment = NSTextAlignmentLeft;
    }
    lblTime.font = boldFont2;
    lblTime.backgroundColor=[UIColor clearColor];
    lblTime.textColor=[UIColor colorWithRed:28/255.f
                                      green:153/255.f
                                       blue:80/255.f
                                      alpha:1.0];
    [self.scrollView addSubview:lblTime];
    
    UILabel * lblTimeString = [[UILabel alloc]init];
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        lblTimeString.frame = CGRectMake(24,370 + labelsize.height,120,29);
        lblTimeString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.InitialDuration] stringValue]];
        lblTimeString.textAlignment = NSTextAlignmentRight;
    }
    else
    {
        lblTimeString.frame = CGRectMake(155,370 + labelsize.height,120,29);
        lblTimeString.text = [[NSNumber numberWithInt:itemDetails.InitialDuration] stringValue];
        
        //itemDetails.CharityName
        lblTimeString.textAlignment = NSTextAlignmentLeft;
    }
    
    lblTimeString.font = boldFont2;
    lblTimeString.backgroundColor=[UIColor clearColor];
    lblTimeString.textColor=[UIColor blackColor];
    [self.scrollView addSubview:lblTimeString];
    
    
    
    
    [self.scrollView setContentSize:CGSizeMake(307,450+labelsize.height)];
    self.bgImage.frame = CGRectMake(0,35,307, 420+labelsize.height);
    
    height = labelsize.height;
    
    
    
    
    return height;
}

-(float) categoryType1
{
    float height=0.0;
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    UIFont * boldFont2;
    if ([appDelegate.culture isEqualToString:@"ar"])
        boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
    else
        boldFont2=[UIFont systemFontOfSize:14];
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        self.typeLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"project_type_lbl",appDelegate.culture, @"")];
    else
    {
        self.typeLbl.text = NSLocalizedStringFromTable(@"project_type_lbl",appDelegate.culture, @"");
        self.typeLbl.frame = CGRectMake(24, self.typeLbl.frame.origin.y, self.typeLbl.frame.size.width, self.typeLbl.frame.size.height);
        self.typeLbl.textAlignment = NSTextAlignmentLeft;
    }
    
    self.typeLbl.font = boldFont2;
    self.typeLbl.alpha = 1;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        self.typeString.text = [converter convertArabic:itemDetails.DonationTypeName];
    else
    {
        self.typeString.text = itemDetails.DonationTypeName;
        self.typeString.textAlignment = NSTextAlignmentLeft;
        self.typeString.frame = CGRectMake(120, self.typeString.frame.origin.y, self.typeString.frame.size.width, self.typeString.frame.size.height);
    }
    self.typeString.font = boldFont2;
    self.typeString.alpha = 1;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        self.spaceLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"area_lbl",appDelegate.culture, @"")];
    else
    {
        self.spaceLbl.text = NSLocalizedStringFromTable(@"area_lbl",appDelegate.culture, @"");
        self.spaceLbl.textAlignment = NSTextAlignmentLeft;
        self.spaceLbl.frame = CGRectMake(24, self.spaceLbl.frame.origin.y, self.spaceLbl.frame.size.width, self.spaceLbl.frame.size.height);
    }
    self.spaceLbl.font = boldFont2;
    self.spaceLbl.alpha = 1;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        self.spaceString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Area] stringValue]];
    else
    {
        self.spaceString.text = [[NSNumber numberWithInt:itemDetails.Area] stringValue];
        self.spaceString.textAlignment = NSTextAlignmentLeft;
        // X = 70
        self.spaceString.frame = CGRectMake(self.spaceLbl.frame.size.width + 20,self.spaceString.frame.origin.y , self.spaceString.frame.size.width, self.spaceString.frame.size.height);
    }
    self.spaceString.font = boldFont2;
    self.spaceString.alpha = 1;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        self.sizeLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"capacity_lbl",appDelegate.culture, @"")];
    else
    {
        self.sizeLbl.text = NSLocalizedStringFromTable(@"capacity_lbl",appDelegate.culture, @"");
        self.sizeLbl.textAlignment = NSTextAlignmentLeft;
        self.sizeLbl.frame = CGRectMake(24, self.sizeLbl.frame.origin.y, self.sizeLbl.frame.size.width, self.sizeLbl.frame.size.height);
    }
    self.sizeLbl.font = boldFont2;
    self.sizeLbl.alpha = 1;
    
    if([appDelegate.culture isEqualToString:@"ar"])
        self.sizeString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Capacity] stringValue]];
    else
    {
        self.sizeString.text = [[NSNumber numberWithInt:itemDetails.Capacity] stringValue];
        self.sizeString.textAlignment = NSTextAlignmentLeft;
        self.sizeString.frame = CGRectMake(95, self.sizeString.frame.origin.y, self.sizeString.frame.size.width, self.sizeString.frame.size.height);
    
    }
    self.sizeString.font = boldFont2;
    self.sizeString.alpha = 1;
    
    NSString * costLabel = @"";
    if (itemDetails.IsContribution == TRUE)
        costLabel = NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"");
    else
        costLabel = NSLocalizedStringFromTable(@"cost_lbl",appDelegate.culture, @"");
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.costLbl.text = [converter convertArabic:costLabel];
        if (itemDetails.IsContribution == TRUE)
          self.costLbl.frame = CGRectMake(179, self.costLbl.frame.origin.y, self.costLbl.frame.size.width+25, self.costLbl.frame.size.height);
    }
    else
    {
        self.costLbl.text = costLabel;
        self.costLbl.textAlignment = NSTextAlignmentLeft;
         if (itemDetails.IsContribution == FALSE)
        self.costLbl.frame = CGRectMake(24, self.costLbl.frame.origin.y, self.costLbl.frame.size.width, self.costLbl.frame.size.height);
        else
           self.costLbl.frame = CGRectMake(24, self.costLbl.frame.origin.y, self.costLbl.frame.size.width+40, self.costLbl.frame.size.height);
    }
    self.costLbl.font = boldFont2;
    self.costLbl.alpha = 1;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
    self.costString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Cost] stringValue]];
        if (itemDetails.IsContribution == TRUE)
            self.costString.frame = CGRectMake(self.costString.frame.origin.x-35, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
    }
    else
    {
        self.costString.text = [[NSNumber numberWithInt:itemDetails.Cost] stringValue];
        self.costString.textAlignment = NSTextAlignmentLeft;
        if (itemDetails.IsContribution == FALSE)
        self.costString.frame= CGRectMake(self.costLbl.frame.size.width + 20, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
        else
            self.costString.frame= CGRectMake(115, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
    }
    self.costString.font = boldFont2;
    self.costString.alpha = 1;
    
    if ([appDelegate.culture isEqualToString:@"ar"])
        self.descLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"desc_lbl",appDelegate.culture, @"")];
    else
    {
        self.descLbl.text = NSLocalizedStringFromTable(@"desc_lbl",appDelegate.culture, @"");
        self.descLbl.textAlignment = NSTextAlignmentLeft;
        self.descLbl.frame = CGRectMake(24, self.descLbl.frame.origin.y, self.descLbl.frame.size.width, self.descLbl.frame.size.height);
    }
    self.descLbl.font = boldFont2;
    self.descLbl.alpha = 1;
    
    NSString * desc = itemDetails.Description;
   
   
    self.descString.font = boldFont2;
    self.descString.alpha = 1;
    
    CGSize labelsize;
    
     labelsize = [desc sizeWithFont:boldFont2 constrainedToSize:_descString.frame.size lineBreakMode:NSLineBreakByWordWrapping];
    

    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        self.descString.frame = CGRectMake(30, self.descLbl.frame.origin.y, 192, labelsize.height + 10);
        self.descString.text = [converter convertArabic:desc];
        [_descString setTextAlignment:NSTextAlignmentRight];
    }
    else
    {
        self.descString.frame = CGRectMake(110, self.descLbl.frame.origin.y, 192, labelsize.height + 10);
        self.descString.text = desc;
        self.descString.textAlignment = NSTextAlignmentLeft;
    }
    
//    if (!itemDetails.IsQuantitative && !itemDetails.IsContribution) {
//        UILabel * lblTime = [[UILabel alloc]init];
//        if([appDelegate.culture isEqualToString:@"ar"])
//        {
//            lblTime.frame = CGRectMake(133,440+labelsize.height,150,29);
//            lblTime.text = [converter convertArabic:NSLocalizedStringFromTable(@"time_lbl",appDelegate.culture, @"")];
//            lblTime.textAlignment = NSTextAlignmentRight;
//        }
//        else
//        {
//            lblTime.frame = CGRectMake(24,440+labelsize.height,150,29);
//            lblTime.text = NSLocalizedStringFromTable(@"time_lbl",appDelegate.culture, @"");
//            lblTime.textAlignment = NSTextAlignmentLeft;
//        }
//        lblTime.font = boldFont2;
//        lblTime.backgroundColor=[UIColor clearColor];
//        lblTime.textColor=[UIColor colorWithRed:28/255.f
//                                          green:153/255.f
//                                           blue:80/255.f
//                                          alpha:1.0];
//        [self.scrollView addSubview:lblTime];
//        
//        UILabel * lblTimeString = [[UILabel alloc]init];
//        if ([appDelegate.culture isEqualToString:@"ar"])
//        {
//            lblTimeString.frame = CGRectMake(24,440+labelsize.height,120,29);
//            lblTimeString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.InitialDuration] stringValue]];
//            lblTimeString.textAlignment = NSTextAlignmentRight;
//        }
//        else
//        {
//            lblTimeString.frame = CGRectMake(155,440+labelsize.height,120,29);
//            lblTimeString.text = [[NSNumber numberWithInt:itemDetails.InitialDuration] stringValue];
//            
//            //itemDetails.CharityName
//            lblTimeString.textAlignment = NSTextAlignmentLeft;
//        }
//        
//        lblTimeString.font = boldFont2;
//        lblTimeString.backgroundColor=[UIColor clearColor];
//        lblTimeString.textColor=[UIColor blackColor];
//        [self.scrollView addSubview:lblTimeString];
//    }
    
    
    [self.scrollView setContentSize:CGSizeMake(307,450+labelsize.height)];
    self.bgImage.frame = CGRectMake(0,35,307, 420+labelsize.height);
    
    height = labelsize.height;
    
    return height;
}


-(void) showStockData:(float)labelsize
{
    float height;
    height = labelsize;
    
    float yPostion = 440.0;
    
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    
    UIFont *boldFont2;
    if([appDelegate.culture isEqualToString:@"ar"])
        boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
    else
        boldFont2=[UIFont systemFontOfSize:14];
    
    int tempHeight = 0;
       if (itemDetails.CategoryId == 3)
        tempHeight = -110;
    else
        tempHeight = 0;
        
    
   if (itemDetails.IsContribution == YES)
        
    {
        yPostion = 519.0;
       UILabel * stockRemainLbl = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            stockRemainLbl.frame = CGRectMake(163,445+height+tempHeight,120,29);
            stockRemainLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"remain_share_lbl",appDelegate.culture, @"")];
            stockRemainLbl.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            stockRemainLbl.frame = CGRectMake(24,445+height+tempHeight,140,29);
            stockRemainLbl.text = NSLocalizedStringFromTable(@"remain_share_lbl",appDelegate.culture, @"");
            stockRemainLbl.textAlignment = NSTextAlignmentLeft;
        }
        
        stockRemainLbl.font = boldFont2;
        stockRemainLbl.backgroundColor=[UIColor clearColor];
        stockRemainLbl.textColor=[UIColor colorWithRed:28/255.f
                                                 green:153/255.f
                                                  blue:80/255.f
                                                 alpha:1.0];
        [self.scrollView addSubview:stockRemainLbl];
        
        UILabel * stockRemainString = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            stockRemainString.frame = CGRectMake(24,445+height+tempHeight,135,29);
            stockRemainString.text = [converter convertArabic:[[NSNumber numberWithInt:remainingStock] stringValue]];
            stockRemainString.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            stockRemainString.frame = CGRectMake(155,445+height+tempHeight,135,29);
            stockRemainString.text = [[NSNumber numberWithInt:remainingStock] stringValue];
            stockRemainString.textAlignment = NSTextAlignmentLeft;
        }
        
        stockRemainString.font = boldFont2;
        stockRemainString.backgroundColor=[UIColor clearColor];
        stockRemainString.textColor=[UIColor blackColor];
        [self.scrollView addSubview:stockRemainString];
        
        
        UILabel * stockTotalLbl = [[UILabel alloc]init];
        if([appDelegate.culture isEqualToString:@"ar"])
        {
            stockTotalLbl.frame = CGRectMake(163,482+height+tempHeight,120,29);
            stockTotalLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"total_share_lbl",appDelegate.culture, @"")];
            stockTotalLbl.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            stockTotalLbl.frame = CGRectMake(24,482+height+tempHeight,120,29);
            stockTotalLbl.text = NSLocalizedStringFromTable(@"total_share_lbl",appDelegate.culture, @"");
            stockTotalLbl.textAlignment = NSTextAlignmentLeft;
        }
        stockTotalLbl.font = boldFont2;
        stockTotalLbl.backgroundColor=[UIColor clearColor];
        stockTotalLbl.textColor=[UIColor colorWithRed:28/255.f
                                                green:153/255.f
                                                 blue:80/255.f
                                                alpha:1.0];
        [self.scrollView addSubview:stockTotalLbl];
        
        UILabel * stockTotalString = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            stockTotalString.frame = CGRectMake(24,482+height+tempHeight,140,29);
            stockTotalString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.TotalStock] stringValue]];
            stockTotalString.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            stockTotalString.frame = CGRectMake(115,482+height+tempHeight,140,29);
            stockTotalString.text = [[NSNumber numberWithInt:itemDetails.TotalStock] stringValue];
            
            //itemDetails.CharityName
            stockTotalString.textAlignment = NSTextAlignmentLeft;
        }
        
        stockTotalString.font = boldFont2;
        stockTotalString.backgroundColor=[UIColor clearColor];
        stockTotalString.textColor=[UIColor blackColor];
        [self.scrollView addSubview:stockTotalString];
        
      /*  UILabel * stockPriceLbl = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            stockPriceLbl.frame = CGRectMake(163,519+height+tempHeight,120,29);
            stockPriceLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"")];
            stockPriceLbl.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            stockPriceLbl.frame = CGRectMake(24,519+height+tempHeight,120,29);
            stockPriceLbl.text = NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"");
            stockPriceLbl.textAlignment = NSTextAlignmentLeft;
        }
        stockPriceLbl.font = boldFont2;
        stockPriceLbl.backgroundColor=[UIColor clearColor];
        stockPriceLbl.textColor=[UIColor colorWithRed:28/255.f
                                                green:153/255.f
                                                 blue:80/255.f
                                                alpha:1.0];
        [self.scrollView addSubview:stockPriceLbl];
        
        UILabel * stockPriceString = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            stockPriceString.frame = CGRectMake(24,519+height+tempHeight,160,29);
            stockPriceString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.StockPrice] stringValue]];
            stockPriceString.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            stockPriceString.frame = CGRectMake(110,519+height+tempHeight,160,29);
            stockPriceString.text = [[NSNumber numberWithInt:itemDetails.StockPrice] stringValue];
            stockPriceString.textAlignment = NSTextAlignmentLeft;
        }
        stockPriceString.font = boldFont2;
        stockPriceString.backgroundColor=[UIColor clearColor];
        stockPriceString.textColor=[UIColor blackColor];
        [self.scrollView addSubview:stockPriceString]; */
    }
    
    
        UILabel * lblTime = [[UILabel alloc]init];
        if([appDelegate.culture isEqualToString:@"ar"])
        {
            lblTime.frame = CGRectMake(133,yPostion+height+tempHeight,150,29);
            lblTime.text = [converter convertArabic:NSLocalizedStringFromTable(@"time_lbl",appDelegate.culture, @"")];
            lblTime.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            lblTime.frame = CGRectMake(24,yPostion+height+tempHeight,150,29);
            lblTime.text = NSLocalizedStringFromTable(@"time_lbl",appDelegate.culture, @"");
            lblTime.textAlignment = NSTextAlignmentLeft;
        }
        lblTime.font = boldFont2;
        lblTime.backgroundColor=[UIColor clearColor];
        lblTime.textColor=[UIColor colorWithRed:28/255.f
                                                green:153/255.f
                                                 blue:80/255.f
                                                alpha:1.0];
    if (itemDetails.CategoryId != 3) {
        [self.scrollView addSubview:lblTime];
    }
    
        UILabel * lblTimeString = [[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            lblTimeString.frame = CGRectMake(24,yPostion+height+tempHeight,120,29);
            lblTimeString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.InitialDuration] stringValue]];
            lblTimeString.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            lblTimeString.frame = CGRectMake(155,yPostion+height+tempHeight,120,29);
            lblTimeString.text = [[NSNumber numberWithInt:itemDetails.InitialDuration] stringValue];
            
            //itemDetails.CharityName
            lblTimeString.textAlignment = NSTextAlignmentLeft;
        }
        
        lblTimeString.font = boldFont2;
        lblTimeString.backgroundColor=[UIColor clearColor];
        lblTimeString.textColor=[UIColor blackColor];
    if (itemDetails.CategoryId != 3) {
        [self.scrollView addSubview:lblTimeString];
    }

        [self.scrollView setContentSize:CGSizeMake(307,yPostion+height+tempHeight + 40)];
        self.bgImage.frame = CGRectMake(0,35,307, yPostion+height+tempHeight + 10);
    
    if (itemDetails.CategoryId == 3) {
        self.bgImage.frame = CGRectMake(0,35,307, yPostion+height+tempHeight + 50);
    }
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setOrgLbl:nil];
    [self setCountryLbl:nil];
    [self setOrgString:nil];
    [self setCountryString:nil];
    [self setTitleLbl:nil];
    [self setTypeLbl:nil];
    [self setSpaceLbl:nil];
    [self setCostLbl:nil];
    [self setSizeLbl:nil];
    [self setDescLbl:nil];
    [self setFasLbl:nil];
    [self setScrollView:nil];
    [self setTypeString:nil];
    [self setSpaceString:nil];
    [self setSizeString:nil];
    [self setCostString:nil];
    [self setFasString:nil];
    [self setDescString:nil];
    [self setBgImage:nil];
    [super viewDidUnload];
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

- (IBAction)donateMethod:(id)sender {
    
    if (appDelegate.login == 0)
    {
        LoginViewController * loginUser = [[LoginViewController alloc]init:1 :self];
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionReveal;
        transition.subtype = kCATransitionFromTop;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:loginUser animated:NO];
    }
    else
    {
        [self showConfrimPopover];
    }
}

-(void)showConfrimPopover {
    if (confirmView == nil)
    {
        BOOL quant = isQant;
        
        if (itemDetails.CategoryId == 1 || itemDetails.CategoryId == 4)
        {
            int numberofStocks = 0;
            if (itemDetails.IsContribution == TRUE)
                numberofStocks = remainingStock;
            confirmView = [[confirmDonationView alloc] initWithFrame:CGRectMake(7,40,304,145):self:quant:itemDetails.Cost:itemDetails.IsContribution:numberofStocks:itemDetails.CategoryId];
            [self.view addSubview:confirmView];
        }
        else if (quant == TRUE || itemDetails.IsContribution == TRUE) {
            int numberofStocks = 0;
            if (itemDetails.IsContribution == TRUE)
                numberofStocks = remainingStock;
            confirmView = [[confirmDonationView alloc] initWithFrame:CGRectMake(7,40,304,145):self:quant:itemDetails.Cost:itemDetails.IsContribution:numberofStocks:itemDetails.CategoryId];
            [self.view addSubview:confirmView];
        }
        else {
            [self getTotalAmount:0 :@"" :@""];
        }
    }
    else
    {
        confirmView.alpha = 0;
        confirmView = nil;
        [confirmView removeFromSuperview];
    }
}

-(void)hidePopover
{
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    
    if (confirmView.amoutTF.isFirstResponder) {
        [confirmView.amoutTF resignFirstResponder];
    }
    if (confirmView.projectNameTF.isFirstResponder) {
        [confirmView.projectNameTF resignFirstResponder];
    }
    if (confirmView.projectNoteTF.isFirstResponder) {
        [confirmView.projectNoteTF resignFirstResponder];
    }
    confirmView.alpha = 0;
    confirmView = nil;
    [confirmView removeFromSuperview];
}

-(void) getTotalAmount:(int)value :(NSString *)proName :(NSString *)proNote
{
    [self hidePopover];
    //[self donateviaPortal];
    
    [AC startLoading];
    
    IACADDonateToCatalogProject *request = [[IACADDonateToCatalogProject alloc] init];
    request.culture = appDelegate.culture;
    request.charityId = itemDetails.CharityId;
    request.donorId = appDelegate.userID;
    request.externalEntityDonationItemsAssociationPerCharityId = itemDetails.ExternalEntityDonationItemsAssociationPerCharityId;
    request.projectName = proName;
    request.projectNotes = proNote;
    request.noOfItems = value;
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client DonateToCatalogProjectAsyncIsPost:YES input:request caller:self];
    
}

-(void) donateviaPortal
{
   
  /*  [AC startLoading];
    
    IACADDonateToCatalogProject *request = [[IACADDonateToCatalogProject alloc] init];
    request.culture = appDelegate.culture;
    request.charityId = itemDetails.CharityId;
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client DonateToCatalogProjectAsyncIsPost:YES input:request caller:self]; */
    
}

-(void) DonateToCatalogProjectCallback:(IACADDonateToCatalogProjectResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    IACADDonateCatalogResult * returnResponse = response.DonateToCatalogProjectResult;
   // NSLog(@"return URL %@",returnResponse);
    if (returnResponse.IsValid == YES)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:returnResponse.RedirectUrl]];
//        [self viewWebview:returnResponse.RedirectUrl];
    }
    else
    {
        remainingStock = returnResponse.RemainingStock;
//        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:returnResponse.ErrorMessage];
//        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
//        [alert show];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:returnResponse.ErrorMessage delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void) viewWebview: (NSString *)htmlString
{
    self.scrollView.alpha = 0;
    self.donateButton.enabled = FALSE;
    self.donateButton.alpha = 0;
    self.webView.alpha = 1;
    self.webView.delegate = self;
    
    [self makeBodyBackgoundTransparent];
    for (UIView* subView in [self.webView subviews])
    {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            for (UIView* shadowView in [subView subviews])
            {
                if ([shadowView isKindOfClass:[UIImageView class]]) {
                    [shadowView setHidden:YES];
                }
            }
        }
    }
    //  [self.webView loadHTMLString:htmlString baseURL:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:htmlString]]];
}

- (void)makeBodyBackgoundTransparent {
    for (UIView *subview in [self.webView subviews]) {
        [subview setOpaque:NO];
        [subview setBackgroundColor:[UIColor clearColor]];
    }
    [self.webView setOpaque:NO];
    [self.webView setBackgroundColor:[UIColor clearColor]];
}


-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    //  [AC stopLoading];
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    float currentVersion = 7.0;
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion) {
//        self.view.frame = CGRectMake(0, 20, 320, self.view.frame.size.height-40);
//        self.tabbarImg.frame  =  CGRectMake(0, -20,320,66);
//    }
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ! ([touch.view isKindOfClass:[UIControl class]]);
}

@end
