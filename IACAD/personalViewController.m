//
//  personalViewController.m
//  IACAD
//
//  Created by John Emil on 8/26/13.
//  Copyright (c) 2013 John Emil. All rights reserved.
//

#import "personalViewController.h"
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
#import "BlockAlertView.h"
#import "IACADGetCatalogPersonDetails.h"
#import "IACADGetCatalogPersonDetailsResponse.h"
#import "IACADCatalogPersonDetail.h"
#import "IACADCatalogPerson.h"
#import "COKeyValuePair.h"
#import "IACADDonateToCatalogPerson.h"
#import "IACADDonateToCatalogPersonResponse.h"
#import "IACADDonateCatalogResult.h"
#import "COKeyValuePair.h"
#import "donateGridListViewController.h"


@interface personalViewController ()

@end

@implementation personalViewController

@synthesize donateGridListViewController;

#define ImageTag 101
#define DonationDescTag 102
#define DonationLabelTag 103

-(id)init:(IACADCatalogPerson *)item :(donateGridListViewController *)donateListViewController {
	if(self = [super init])
	{
        _item = item;
        self.donateGridListViewController = donateListViewController;
        isPaymentScreenOpened = false;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    IACADGetCatalogPersonDetails *input = [[IACADGetCatalogPersonDetails alloc] init];
    input.culture = appDelegate.culture;
    input.charityId = _item.CharityId;
    input.personId = _item.ID;
    
    IACADServiceClient *serviceClient = [[IACADServiceClient alloc] init];
    [serviceClient GetCatalogPersonDetailsAsyncIsPost:YES input:input caller:self];
    
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(hidePopover)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:tap];
    
    /////////////////////////
    
//    IACADGetCharityName *request = [[IACADGetCharityName alloc] init];
//    request.culture = appDelegate.culture;
//    request.charityId = _itemDetails.CharityId;
//    IACADServiceClient *client = [[IACADServiceClient alloc] init];
//    [client GetCharityNameAsyncIsPost:YES input:request caller:self];
    
    
    
    if ([appDelegate.culture isEqualToString:@"ar"])
    {
        UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        self.titleLbl.text = [converter convertArabic:_item.FullName];
        self.titleLbl.font = boldFont;
        
        UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
        self.orgLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"donationType_lbl",appDelegate.culture, @"")];
        self.orgLbl.font = boldFont2;
        
        self.countryLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"")];
        self.countryLbl.font = boldFont2;
        
        self.orgString.font = boldFont2;
        
        self.countryString.font = boldFont2;
    }
    else
    {
        self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
        UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
        [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        self.donateButton.frame = CGRectMake(258, self.donateButton.frame.origin.y, self.donateButton.frame.size.width, self.donateButton.frame.size.height);
        [self.donateButton setImage:[UIImage imageNamed:@"donnateButton_en2.png"] forState:UIControlStateNormal];
        
        self.titleLbl.text = _item.FullName;
        
        self.orgLbl.text = NSLocalizedStringFromTable(@"donationType_lbl",appDelegate.culture, @"");
        self.orgLbl.textAlignment = NSTextAlignmentLeft;
        self.orgLbl.frame = CGRectMake(24, self.orgLbl.frame.origin.y, self.orgLbl.frame.size.width, self.orgLbl.frame.size.height);
        
        self.countryLbl.text = NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"");
        self.countryLbl.textAlignment = NSTextAlignmentLeft;
        self.countryLbl.frame = CGRectMake(24, self.countryLbl.frame.origin.y, self.countryLbl.frame.size.width, self.countryLbl.frame.size.height);
        
        self.orgString.frame = CGRectMake(110, self.orgString.frame.origin.y, self.orgString.frame.size.width, self.orgString.frame.size.height);
        self.orgString.textAlignment = NSTextAlignmentLeft;
        
        self.countryString.frame = CGRectMake(110, self.countryString.frame.origin.y, self.countryString.frame.size.width, self.countryString.frame.size.height);
        self.countryString.textAlignment = NSTextAlignmentLeft;
        
        [self.greenImgBG setImage:[UIImage imageNamed:@"green_text_field_en.png"]];
    }
    

    
    
    AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 68)];
    AC.center=self.view.center;
    AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [AC startLoading];
    [self.view addSubview:AC];
}

- (void)GetCatalogPersonDetailsCallback:(IACADGetCatalogPersonDetailsResponse *)response error:(NSError *)error {
    
    [AC stopLoading];
    
    if(response != nil && response.GetCatalogPersonDetailsResult != nil) {
        
        self.donateButton.enabled = true;
        self.donateButton.alpha = 1;
        
        _itemDetails = response.GetCatalogPersonDetailsResult;
        
        
        charityName = @"";
        AsyncImageView * asyncImageView = [[AsyncImageView alloc] init];
        asyncImageView.frame = CGRectMake(26,16, 251,132);
        NSString * imageURL;
        imageURL = [NSString stringWithFormat:@"http://www.ecp.ae/Handlers/ShowImage.ashx?Guidid=%@&objectType=generalpersonfile", _itemDetails.GenrealPersonsPhotoFileID];
        NSURL *url = [NSURL URLWithString:imageURL];
        asyncImageView.activityIndicatorStyle = UIActivityIndicatorViewStyleGray;
        [asyncImageView setImageURL:url];
        asyncImageView.backgroundColor=[UIColor clearColor];
        [self.scrollView addSubview:asyncImageView];
        
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:18];
            ArabicConverter *converter = [[ArabicConverter alloc] init];
            self.titleLbl.text = [converter convertArabic:_itemDetails.FullName];
            self.titleLbl.font = boldFont;
            
            UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            self.orgLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"donationType_lbl",appDelegate.culture, @"")];
            self.orgLbl.font = boldFont2;
            
            self.countryLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"")];
            self.countryLbl.font = boldFont2;
            
            self.orgString.text = [converter convertArabic:_itemDetails.DonationTypesName];
            self.orgString.font = boldFont2;
            
            self.countryString.text = [converter convertArabic:_itemDetails.CountryName];
            self.countryString.font = boldFont2;
        }
        else
        {
            self.backButton.frame = CGRectMake(5, self.backButton.frame.origin.y, self.backButton.frame.size.width, self.backButton.frame.size.height);
            UIImage *buttonImage = [UIImage imageNamed:@"back_enButton.png"];
            [self.backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
            
            self.donateButton.frame = CGRectMake(258, self.donateButton.frame.origin.y, self.donateButton.frame.size.width, self.donateButton.frame.size.height);
            [self.donateButton setImage:[UIImage imageNamed:@"donnateButton_en2.png"] forState:UIControlStateNormal];
            
            self.titleLbl.text = _itemDetails.FullName;
            
            self.orgLbl.text = NSLocalizedStringFromTable(@"donationType_lbl",appDelegate.culture, @"");
            self.orgLbl.textAlignment = NSTextAlignmentLeft;
            self.orgLbl.frame = CGRectMake(24, self.orgLbl.frame.origin.y, self.orgLbl.frame.size.width, self.orgLbl.frame.size.height);
            
            self.countryLbl.text = NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"");
            self.countryLbl.textAlignment = NSTextAlignmentLeft;
            self.countryLbl.frame = CGRectMake(24, self.countryLbl.frame.origin.y, self.countryLbl.frame.size.width, self.countryLbl.frame.size.height);
            
            self.orgString.text = _itemDetails.DonationTypesName;
            self.orgString.frame = CGRectMake(110, self.orgString.frame.origin.y, self.orgString.frame.size.width, self.orgString.frame.size.height);
            self.orgString.textAlignment = NSTextAlignmentLeft;
            
            self.countryString.text = _itemDetails.CountryName;
            self.countryString.frame = CGRectMake(110, self.countryString.frame.origin.y, self.countryString.frame.size.width, self.countryString.frame.size.height);
            self.countryString.textAlignment = NSTextAlignmentLeft;
            
            [self.greenImgBG setImage:[UIImage imageNamed:@"green_text_field_en.png"]];
        }
    
        
        
        if ([_itemDetails.SearchKey compare:@"PoorFamilies" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            
            [self loadPoorFamilies];
        }
        else if ([_itemDetails.SearchKey compare:@"Students" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            
            [self loadStudents];
        }
        else if ([_itemDetails.SearchKey compare:@"Orphans" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            
            [self loadOrphans];
        }
        else if ([_itemDetails.SearchKey compare:@"Teachers" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            
            [self loadTeachers];
        }
        else if ([_itemDetails.SearchKey compare:@"GeneralPersons" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            
            [self loadGeneralPersons];
        }
        [self.detailsTable reloadData];
        
        [self.detailsTable setBackgroundColor:[UIColor clearColor]];
        
        CGSize size = self.detailsTable.contentSize;
        CGRect rect = self.detailsTable.frame;
        [self.detailsTable setFrame:CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height)];
        
        self.detailsTable.separatorColor = [UIColor clearColor];
        
        [self.scrollView setContentSize: CGSizeMake(self.scrollView.contentSize.width, rect.origin.y + size.height + 10)];
        
        self.bgImage.frame = CGRectMake(0,35,307, self.scrollView.contentSize.height - 35);
    }
    else {
        CATransition* transition = [CATransition animation];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        if ([appDelegate.culture isEqualToString:@"ar"])
            transition.subtype = kCATransitionFromRight;
        else
            transition.subtype = kCATransitionFromLeft;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController popViewControllerAnimated:NO];
        
        [self.donateGridListViewController reloadTableview];
    }
}

- (void) GetCharityNameCallback:(IACADGetCharityNameResponse *)response error:(NSError *)error
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

- (void)loadPoorFamilies {
    
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    
    _detailsToDisplay = [[NSMutableArray alloc] init];
    
    COKeyValuePair *detailsFieldData = [[COKeyValuePair alloc]
                                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"name_lbl",appDelegate.culture, @"")]
                                        value:[converter convertArabic:_itemDetails.FullName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"asembly_name",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.CharityName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Nationality_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.NationalityCountryName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Cost_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.FormattedDonationCost]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"FamilyMembers_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: [NSString stringWithFormat:@"%d", _itemDetails.FamilyMembers]]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"SonsNumber_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: [NSString stringWithFormat:@"%d", _itemDetails.SonsNumber]]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"DaughtersNumber_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: [NSString stringWithFormat:@"%d", _itemDetails.DaughtersNumber]]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"MonthlyIncome_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: [NSString stringWithFormat:@"%.2f", _itemDetails.MonthlyIncome]]];
    [_detailsToDisplay addObject:detailsFieldData];
}

- (void)loadStudents {
    
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    
    _detailsToDisplay = [[NSMutableArray alloc] init];
    
    COKeyValuePair *detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"asembly_name",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.CharityName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Nationality_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.NationalityCountryName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"name_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.FullName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Gender_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.GenderText]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Age_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:[self constructAge:_itemDetails.AgeMonths years:_itemDetails.AgeYears]]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Cost_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.FormattedDonationCost]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"StudentMaritalStatus_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.StudentMaritalStatus]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"StudentWork_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.StudentWork]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"StudentCertificateCertificateName_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.StudentCertificateCertificateName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    
    ///DAY
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d/MM/yyyy"];
    NSString *date = [dateFormatter stringFromDate:_itemDetails.StudentCertificateDate];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"StudentCertificateDate_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: date]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"StudentsSponsorshipTypeName_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.StudentsSponsorshipTypeName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"StudentScholarshipGradeName_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.StudentScholarshipGradeName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    //    ----------------------------
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"CityName_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.CityName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"InstitutionAddress_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.StudentInstitutionName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"EducationCost_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.EducationCost]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"UniversityName_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: _itemDetails.UniversityName]];
    [_detailsToDisplay addObject:detailsFieldData];
}

- (void)loadOrphans {
    
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    
    _detailsToDisplay = [[NSMutableArray alloc] init];
    
    COKeyValuePair *detailsFieldData = [[COKeyValuePair alloc]
                                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"name_lbl",appDelegate.culture, @"")]
                                        value:[converter convertArabic:_itemDetails.FullName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"asembly_name",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.CharityName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Nationality_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.NationalityCountryName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Gender_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.GenderText]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Age_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:[self constructAge:_itemDetails.AgeMonths years:_itemDetails.AgeYears]]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Cost_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.FormattedDonationCost]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Health_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.HealthText]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"StudyLevel_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.StudyLevelText]];
    [_detailsToDisplay addObject:detailsFieldData];
}

- (void)loadTeachers {
    
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    
    _detailsToDisplay = [[NSMutableArray alloc] init];
    
    COKeyValuePair *detailsFieldData = [[COKeyValuePair alloc]
                                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"name_lbl",appDelegate.culture, @"")]
                                        value:[converter convertArabic:_itemDetails.FullName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"asembly_name",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.CharityName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Nationality_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.NationalityCountryName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Gender_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.GenderText]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Age_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:[self constructAge:_itemDetails.AgeMonths years:_itemDetails.AgeYears]]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Cost_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.FormattedDonationCost]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"TeacherMaritalStatus_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.TeacherMaritalStatusText]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"TeacherEducationType_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.TeacherEducationType]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"TeacherEducatinoPlace_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.TeacherEducatinoPlace]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"TeacherChildrenCount_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic: [NSString stringWithFormat:@"%d", _itemDetails.TeacherChildrenCount]]];
    [_detailsToDisplay addObject:detailsFieldData];
}

- (void)loadGeneralPersons {
    
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    
    _detailsToDisplay = [[NSMutableArray alloc] init];
    
    COKeyValuePair *detailsFieldData = [[COKeyValuePair alloc]
                                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"name_lbl",appDelegate.culture, @"")]
                                        value:[converter convertArabic:_itemDetails.FullName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"asembly_name",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.CharityName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Nationality_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.NationalityCountryName]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Gender_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.GenderText]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Age_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:[self constructAge:_itemDetails.AgeMonths years:_itemDetails.AgeYears]]];
    [_detailsToDisplay addObject:detailsFieldData];
    
    
    detailsFieldData = [[COKeyValuePair alloc]
                        initWithKey:[converter convertArabic:NSLocalizedStringFromTable(@"Cost_lbl",appDelegate.culture, @"")]
                        value:[converter convertArabic:_itemDetails.FormattedDonationCost]];
    [_detailsToDisplay addObject:detailsFieldData];
}

- (NSString *)constructAge:(int)pMonths years:(int)pYears {
    if (pYears > 0) {
        return [NSString stringWithFormat:NSLocalizedStringFromTable(@"AgeYearFormat", appDelegate.culture, @""), pYears];
    }
    else {
        return [NSString stringWithFormat:NSLocalizedStringFromTable(@"AgeMonthFormat", appDelegate.culture, @""), pMonths];
    }
}

//-(float) categoryType3
//{
//    float height=0.0;
//    ArabicConverter *converter = [[ArabicConverter alloc] init];
//    UIFont * boldFont2;
//    if([appDelegate.culture isEqualToString:@"ar"])
//        boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
//    else
//        boldFont2=[UIFont systemFontOfSize:14];
//    
//    /*    if (itemDetails.IsContribution == TRUE)
//     costLabel = NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"");
//     else
//     costLabel = NSLocalizedStringFromTable(@"cost_lbl",appDelegate.culture, @"");
//     
//     if ([appDelegate.culture isEqualToString:@"ar"])
//     {
//     self.costLbl.text = [converter convertArabic:costLabel];
//     if (itemDetails.IsContribution == TRUE)
//     self.costLbl.frame = CGRectMake(179, self.costLbl.frame.origin.y, self.costLbl.frame.size.width+25, self.costLbl.frame.size.height);
//     }
//     else
//     {
//     self.costLbl.text = costLabel;
//     self.costLbl.textAlignment = NSTextAlignmentLeft;
//     if (itemDetails.IsContribution == FALSE)
//     self.costLbl.frame = CGRectMake(24, self.costLbl.frame.origin.y, self.costLbl.frame.size.width, self.costLbl.frame.size.height);
//     else
//     self.costLbl.frame = CGRectMake(24, self.costLbl.frame.origin.y, self.costLbl.frame.size.width+40, self.costLbl.frame.size.height);
//     }
//     self.costLbl.font = boldFont2;
//     self.costLbl.alpha = 1;
//     
//     if ([appDelegate.culture isEqualToString:@"ar"])
//     {
//     self.costString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Cost] stringValue]];
//     if (itemDetails.IsContribution == TRUE)
//     self.costString.frame = CGRectMake(self.costString.frame.origin.x-35, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
//     }
//     else
//     {
//     self.costString.text = [[NSNumber numberWithInt:itemDetails.Cost] stringValue];
//     self.costString.textAlignment = NSTextAlignmentLeft;
//     if (itemDetails.IsContribution == FALSE)
//     self.costString.frame= CGRectMake(70, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
//     else
//     self.costString.frame= CGRectMake(115, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
//     }
//     self.costString.font = boldFont2;
//     self.costString.alpha = 1;
//     
//     
//     */
//    
////    NSString * costLabel = @"";
////    if (itemDetails.IsContribution == TRUE)
////        costLabel = NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"");
////    else
////        costLabel = NSLocalizedStringFromTable(@"cost_lbl",appDelegate.culture, @"");
//    
//    return height;
//}
//
//-(float) categoryType1
//{
//    float height=0.0;
//    ArabicConverter *converter = [[ArabicConverter alloc] init];
//    UIFont * boldFont2;
//    if ([appDelegate.culture isEqualToString:@"ar"])
//        boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
//    else
//        boldFont2=[UIFont systemFontOfSize:14];
//    
//    if ([appDelegate.culture isEqualToString:@"ar"])
//        self.typeLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"project_type_lbl",appDelegate.culture, @"")];
//    else
//    {
//        self.typeLbl.text = NSLocalizedStringFromTable(@"project_type_lbl",appDelegate.culture, @"");
//        self.typeLbl.frame = CGRectMake(24, self.typeLbl.frame.origin.y, self.typeLbl.frame.size.width, self.typeLbl.frame.size.height);
//        self.typeLbl.textAlignment = NSTextAlignmentLeft;
//    }
//    
//    self.typeLbl.font = boldFont2;
//    self.typeLbl.alpha = 1;
//    
//    if ([appDelegate.culture isEqualToString:@"ar"])
//        self.typeString.text = [converter convertArabic:itemDetails.DonationTypeName];
//    else
//    {
//        self.typeString.text = itemDetails.DonationTypeName;
//        self.typeString.textAlignment = NSTextAlignmentLeft;
//        self.typeString.frame = CGRectMake(120, self.typeString.frame.origin.y, self.typeString.frame.size.width, self.typeString.frame.size.height);
//    }
//    self.typeString.font = boldFont2;
//    self.typeString.alpha = 1;
//    
//    if ([appDelegate.culture isEqualToString:@"ar"])
//        self.spaceLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"area_lbl",appDelegate.culture, @"")];
//    else
//    {
//        self.spaceLbl.text = NSLocalizedStringFromTable(@"area_lbl",appDelegate.culture, @"");
//        self.spaceLbl.textAlignment = NSTextAlignmentLeft;
//        self.spaceLbl.frame = CGRectMake(24, self.spaceLbl.frame.origin.y, self.spaceLbl.frame.size.width, self.spaceLbl.frame.size.height);
//    }
//    self.spaceLbl.font = boldFont2;
//    self.spaceLbl.alpha = 1;
//    
//    if ([appDelegate.culture isEqualToString:@"ar"])
//        self.spaceString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Area] stringValue]];
//    else
//    {
//        self.spaceString.text = [[NSNumber numberWithInt:itemDetails.Area] stringValue];
//        self.spaceString.textAlignment = NSTextAlignmentLeft;
//        self.spaceString.frame = CGRectMake(70,self.spaceString.frame.origin.y , self.spaceString.frame.size.width, self.spaceString.frame.size.height);
//    }
//    self.spaceString.font = boldFont2;
//    self.spaceString.alpha = 1;
//    
//    if ([appDelegate.culture isEqualToString:@"ar"])
//        self.sizeLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"capacity_lbl",appDelegate.culture, @"")];
//    else
//    {
//        self.sizeLbl.text = NSLocalizedStringFromTable(@"capacity_lbl",appDelegate.culture, @"");
//        self.sizeLbl.textAlignment = NSTextAlignmentLeft;
//        self.sizeLbl.frame = CGRectMake(24, self.sizeLbl.frame.origin.y, self.sizeLbl.frame.size.width, self.sizeLbl.frame.size.height);
//    }
//    self.sizeLbl.font = boldFont2;
//    self.sizeLbl.alpha = 1;
//    
//    if([appDelegate.culture isEqualToString:@"ar"])
//        self.sizeString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Capacity] stringValue]];
//    else
//    {
//        self.sizeString.text = [[NSNumber numberWithInt:itemDetails.Capacity] stringValue];
//        self.sizeString.textAlignment = NSTextAlignmentLeft;
//        self.sizeString.frame = CGRectMake(95, self.sizeString.frame.origin.y, self.sizeString.frame.size.width, self.sizeString.frame.size.height);
//        
//    }
//    self.sizeString.font = boldFont2;
//    self.sizeString.alpha = 1;
//    
//    NSString * costLabel = @"";
//    if (itemDetails.IsContribution == TRUE)
//        costLabel = NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"");
//    else
//        costLabel = NSLocalizedStringFromTable(@"cost_lbl",appDelegate.culture, @"");
//    
//    if ([appDelegate.culture isEqualToString:@"ar"])
//    {
//        self.costLbl.text = [converter convertArabic:costLabel];
//        if (itemDetails.IsContribution == TRUE)
//            self.costLbl.frame = CGRectMake(179, self.costLbl.frame.origin.y, self.costLbl.frame.size.width+25, self.costLbl.frame.size.height);
//    }
//    else
//    {
//        self.costLbl.text = costLabel;
//        self.costLbl.textAlignment = NSTextAlignmentLeft;
//        if (itemDetails.IsContribution == FALSE)
//            self.costLbl.frame = CGRectMake(24, self.costLbl.frame.origin.y, self.costLbl.frame.size.width, self.costLbl.frame.size.height);
//        else
//            self.costLbl.frame = CGRectMake(24, self.costLbl.frame.origin.y, self.costLbl.frame.size.width+40, self.costLbl.frame.size.height);
//    }
//    self.costLbl.font = boldFont2;
//    self.costLbl.alpha = 1;
//    
//    if ([appDelegate.culture isEqualToString:@"ar"])
//    {
//        self.costString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.Cost] stringValue]];
//        if (itemDetails.IsContribution == TRUE)
//            self.costString.frame = CGRectMake(self.costString.frame.origin.x-35, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
//    }
//    else
//    {
//        self.costString.text = [[NSNumber numberWithInt:itemDetails.Cost] stringValue];
//        self.costString.textAlignment = NSTextAlignmentLeft;
//        if (itemDetails.IsContribution == FALSE)
//            self.costString.frame= CGRectMake(70, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
//        else
//            self.costString.frame= CGRectMake(115, self.costString.frame.origin.y, self.costString.frame.size.width, self.costString.frame.size.height);
//    }
//    self.costString.font = boldFont2;
//    self.costString.alpha = 1;
//    
//    if ([appDelegate.culture isEqualToString:@"ar"])
//        self.descLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"desc_lbl",appDelegate.culture, @"")];
//    else
//    {
//        self.descLbl.text = NSLocalizedStringFromTable(@"desc_lbl",appDelegate.culture, @"");
//        self.descLbl.textAlignment = NSTextAlignmentLeft;
//        self.descLbl.frame = CGRectMake(24, self.descLbl.frame.origin.y, self.descLbl.frame.size.width, self.descLbl.frame.size.height);
//    }
//    self.descLbl.font = boldFont2;
//    self.descLbl.alpha = 1;
//    
//    NSString * desc = itemDetails.Description;
//    
//    
//    self.descString.font = boldFont2;
//    self.descString.alpha = 1;
//    
//    CGSize labelsize;
//    labelsize=[desc sizeWithFont:self.descString.font constrainedToSize:CGSizeMake(192, 300) lineBreakMode:UILineBreakModeWordWrap];
//    if ([appDelegate.culture isEqualToString:@"ar"])
//    {
//        self.descString.frame = CGRectMake(30, 432, 192, labelsize.height);
//        self.descString.text = [converter convertArabic:desc];
//    }
//    else
//    {
//        self.descString.frame = CGRectMake(110, 432, 192, labelsize.height);
//        self.descString.text = desc;
//        self.descString.textAlignment = NSTextAlignmentLeft;
//    }
//    
//    
//    [self.scrollView setContentSize:CGSizeMake(307,450+labelsize.height)];
//    self.bgImage.frame = CGRectMake(0,35,307, 420+labelsize.height);
//    
//    height = labelsize.height;
//    
//    return height;
//}
//
//
//-(void) showStockData:(float)labelsize
//{
//    float height;
//    height = labelsize;
//    
//    ArabicConverter *converter = [[ArabicConverter alloc] init];
//    
//    UIFont *boldFont2;
//    if([appDelegate.culture isEqualToString:@"ar"])
//        boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
//    else
//        boldFont2=[UIFont systemFontOfSize:14];
//    
//    int tempHeight = 0;
//    if (itemDetails.CategoryId == 3)
//        tempHeight = -110;
//    else
//        tempHeight = 0;
//    
//    
//    if (itemDetails.IsContribution == YES)
//        
//    {
//        UILabel * stockRemainLbl = [[UILabel alloc]init];
//        if ([appDelegate.culture isEqualToString:@"ar"])
//        {
//            stockRemainLbl.frame = CGRectMake(163,445+height+tempHeight,120,29);
//            stockRemainLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"remain_share_lbl",appDelegate.culture, @"")];
//            stockRemainLbl.textAlignment = NSTextAlignmentRight;
//        }
//        else
//        {
//            stockRemainLbl.frame = CGRectMake(24,445+height+tempHeight,140,29);
//            stockRemainLbl.text = NSLocalizedStringFromTable(@"remain_share_lbl",appDelegate.culture, @"");
//            stockRemainLbl.textAlignment = UITextAlignmentLeft;
//        }
//        
//        stockRemainLbl.font = boldFont2;
//        stockRemainLbl.backgroundColor=[UIColor clearColor];
//        stockRemainLbl.textColor=[UIColor colorWithRed:28/255.f
//                                                 green:153/255.f
//                                                  blue:80/255.f
//                                                 alpha:1.0];
//        [self.scrollView addSubview:stockRemainLbl];
//        
//        UILabel * stockRemainString = [[UILabel alloc]init];
//        if ([appDelegate.culture isEqualToString:@"ar"])
//        {
//            stockRemainString.frame = CGRectMake(24,445+height+tempHeight,135,29);
//            stockRemainString.text = [converter convertArabic:[[NSNumber numberWithInt:remainingStock] stringValue]];
//            stockRemainString.textAlignment = NSTextAlignmentRight;
//        }
//        else
//        {
//            stockRemainString.frame = CGRectMake(155,445+height+tempHeight,135,29);
//            stockRemainString.text = [[NSNumber numberWithInt:remainingStock] stringValue];
//            stockRemainString.textAlignment = NSTextAlignmentLeft;
//        }
//        
//        stockRemainString.font = boldFont2;
//        stockRemainString.backgroundColor=[UIColor clearColor];
//        stockRemainString.textColor=[UIColor blackColor];
//        [self.scrollView addSubview:stockRemainString];
//        
//        
//        UILabel * stockTotalLbl = [[UILabel alloc]init];
//        if([appDelegate.culture isEqualToString:@"ar"])
//        {
//            stockTotalLbl.frame = CGRectMake(163,482+height+tempHeight,120,29);
//            stockTotalLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"total_share_lbl",appDelegate.culture, @"")];
//            stockTotalLbl.textAlignment = NSTextAlignmentRight;
//        }
//        else
//        {
//            stockTotalLbl.frame = CGRectMake(24,482+height+tempHeight,120,29);
//            stockTotalLbl.text = NSLocalizedStringFromTable(@"total_share_lbl",appDelegate.culture, @"");
//            stockTotalLbl.textAlignment = NSTextAlignmentLeft;
//        }
//        stockTotalLbl.font = boldFont2;
//        stockTotalLbl.backgroundColor=[UIColor clearColor];
//        stockTotalLbl.textColor=[UIColor colorWithRed:28/255.f
//                                                green:153/255.f
//                                                 blue:80/255.f
//                                                alpha:1.0];
//        [self.scrollView addSubview:stockTotalLbl];
//        
//        UILabel * stockTotalString = [[UILabel alloc]init];
//        if ([appDelegate.culture isEqualToString:@"ar"])
//        {
//            stockTotalString.frame = CGRectMake(24,482+height+tempHeight,140,29);
//            stockTotalString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.TotalStock] stringValue]];
//            stockTotalString.textAlignment = NSTextAlignmentRight;
//        }
//        else
//        {
//            stockTotalString.frame = CGRectMake(115,482+height+tempHeight,140,29);
//            stockTotalString.text = [[NSNumber numberWithInt:itemDetails.TotalStock] stringValue];
//            stockTotalString.textAlignment = NSTextAlignmentLeft;
//        }
//        
//        stockTotalString.font = boldFont2;
//        stockTotalString.backgroundColor=[UIColor clearColor];
//        stockTotalString.textColor=[UIColor blackColor];
//        [self.scrollView addSubview:stockTotalString];
//        
//        /*  UILabel * stockPriceLbl = [[UILabel alloc]init];
//         if ([appDelegate.culture isEqualToString:@"ar"])
//         {
//         stockPriceLbl.frame = CGRectMake(163,519+height+tempHeight,120,29);
//         stockPriceLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"")];
//         stockPriceLbl.textAlignment = NSTextAlignmentRight;
//         }
//         else
//         {
//         stockPriceLbl.frame = CGRectMake(24,519+height+tempHeight,120,29);
//         stockPriceLbl.text = NSLocalizedStringFromTable(@"share_price_lbl",appDelegate.culture, @"");
//         stockPriceLbl.textAlignment = NSTextAlignmentLeft;
//         }
//         stockPriceLbl.font = boldFont2;
//         stockPriceLbl.backgroundColor=[UIColor clearColor];
//         stockPriceLbl.textColor=[UIColor colorWithRed:28/255.f
//         green:153/255.f
//         blue:80/255.f
//         alpha:1.0];
//         [self.scrollView addSubview:stockPriceLbl];
//         
//         UILabel * stockPriceString = [[UILabel alloc]init];
//         if ([appDelegate.culture isEqualToString:@"ar"])
//         {
//         stockPriceString.frame = CGRectMake(24,519+height+tempHeight,160,29);
//         stockPriceString.text = [converter convertArabic:[[NSNumber numberWithInt:itemDetails.StockPrice] stringValue]];
//         stockPriceString.textAlignment = NSTextAlignmentRight;
//         }
//         else
//         {
//         stockPriceString.frame = CGRectMake(110,519+height+tempHeight,160,29);
//         stockPriceString.text = [[NSNumber numberWithInt:itemDetails.StockPrice] stringValue];
//         stockPriceString.textAlignment = NSTextAlignmentLeft;
//         }
//         stockPriceString.font = boldFont2;
//         stockPriceString.backgroundColor=[UIColor clearColor];
//         stockPriceString.textColor=[UIColor blackColor];
//         [self.scrollView addSubview:stockPriceString]; */
//        
//        [self.scrollView setContentSize:CGSizeMake(307,560+height+tempHeight)];
//        self.bgImage.frame = CGRectMake(0,35,307, 528+height+tempHeight);
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewDidUnload {
//    [self setOrgLbl:nil];
//    [self setCountryLbl:nil];
//    [self setOrgString:nil];
//    [self setCountryString:nil];
//    [self setTitleLbl:nil];
//    [self setTypeLbl:nil];
//    [self setSpaceLbl:nil];
//    [self setCostLbl:nil];
//    [self setSizeLbl:nil];
//    [self setDescLbl:nil];
//    [self setFasLbl:nil];
//    [self setScrollView:nil];
//    [self setTypeString:nil];
//    [self setSpaceString:nil];
//    [self setSizeString:nil];
//    [self setCostString:nil];
//    [self setFasString:nil];
//    [self setDescString:nil];
//    [self setBgImage:nil];
//    [super viewDidUnload];
//}

#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
	static NSString *MyIdentifier = @"MyIdentifier";
    
    
    COKeyValuePair *item = [_detailsToDisplay objectAtIndex:indexPath.row];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
        UILabel *fieldKeyLabel = [[UILabel alloc] init];
        UIFont *boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            fieldKeyLabel.font = boldFont;
            fieldKeyLabel.textAlignment = NSTextAlignmentRight;
            fieldKeyLabel.frame=CGRectMake(78, 2, 200,30);
        }
        else
        {
            boldFont =  [UIFont systemFontOfSize:14];
            fieldKeyLabel.font = boldFont;
            fieldKeyLabel.textAlignment = NSTextAlignmentLeft;
            fieldKeyLabel.frame=CGRectMake(10, 2, 200,30);
        }
        
        //28,153,80
        fieldKeyLabel.backgroundColor = [UIColor clearColor];
        fieldKeyLabel.numberOfLines = 2;
        fieldKeyLabel.lineBreakMode = UILineBreakModeWordWrap;
        fieldKeyLabel.textColor = [UIColor colorWithRed:28/255.f
                                                 green:153/255.f
                                                  blue:80/255.f
                                                 alpha:1.0];
        fieldKeyLabel.tag = DonationLabelTag;
        [cell.contentView addSubview:fieldKeyLabel];
        
        UILabel *fieldValueLabel = [[UILabel alloc] init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            NSString *string = (NSString *)item.key;
            CGSize size = [string sizeWithFont:boldFont constrainedToSize:fieldKeyLabel.frame.size lineBreakMode:NSLineBreakByWordWrapping];
            
            UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            fieldValueLabel.font = boldFont;
            fieldValueLabel.textAlignment = NSTextAlignmentRight;
            fieldValueLabel.frame=CGRectMake(10, 2, 307 - 50 - size.width, 30);
        }
        else
        {
            NSString *string = (NSString *)item.key;
            CGSize size = [string sizeWithFont:boldFont constrainedToSize:fieldKeyLabel.frame.size lineBreakMode:NSLineBreakByWordWrapping];
            NSLog(@"size.width %f", size.width);
            
            UIFont * boldFont =  [UIFont systemFontOfSize:14];
            fieldValueLabel.font = boldFont;
            fieldValueLabel.textAlignment = NSTextAlignmentLeft;
            fieldValueLabel.frame=CGRectMake(size.width + 25, 2, 307 - 25 - size.width, 30);
        }
        fieldValueLabel.backgroundColor = [UIColor clearColor];
        fieldValueLabel.numberOfLines = 2;
        fieldValueLabel.lineBreakMode = UILineBreakModeWordWrap;
        fieldValueLabel.textColor = [UIColor colorWithRed:137/255.f
                                                 green:137/255.f
                                                  blue:137/255.f
                                                 alpha:1.0];
        fieldValueLabel.tag = DonationDescTag;
        [cell.contentView addSubview:fieldValueLabel];
        
        [cell.contentView setBackgroundColor:[UIColor clearColor]];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    
    UILabel *lbl4 = (UILabel *)[cell.contentView viewWithTag:DonationLabelTag];
    lbl4.text = [converter convertArabic: (NSString *)item.key];
    
    UILabel *lbl5 = (UILabel *)[cell.contentView viewWithTag:DonationDescTag];
    lbl5.text = [converter convertArabic: (NSString *)item.value];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_detailsToDisplay != nil) {
        return _detailsToDisplay.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 34;
}

- (IBAction)backMethod:(id)sender {
    if ([self.viewDeckController isAnySideOpen])
    {
        [self.viewDeckController closeRightView];
        [self.viewDeckController closeLeftView];
    }
    else if (isPaymentScreenOpened) {
        
        self.scrollView.alpha = 1;
        self.webView.alpha = 0;
        self.webView.delegate = self;
        
        [self makeBodyBackgoundTransparent];
        
        isPaymentScreenOpened = false;
        
        
        
        IACADGetCatalogPersonDetails *input = [[IACADGetCatalogPersonDetails alloc] init];
        input.culture = appDelegate.culture;
        input.charityId = _item.CharityId;
        input.personId = _item.ID;
        
        IACADServiceClient *serviceClient = [[IACADServiceClient alloc] init];
        [serviceClient GetCatalogPersonDetailsAsyncIsPost:YES input:input caller:self];
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
        LoginViewController * loginUser = [[LoginViewController alloc]init:1];
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

- (void)showConfrimPopover
{
    if (confirmView == nil)
    {
//        if (_itemDetails.CategoryId == 1)
//        {
//            int numberofStocks = 0;
//            if (_itemDetails.IsContribution == TRUE)
//                numberofStocks = remainingStock;
//            confirmView = [[confirmDonationView alloc] initWithFrame:CGRectMake(7,40,304,145):self:quant:itemDetails.Cost:itemDetails.IsContribution:numberofStocks:itemDetails.CategoryId];
//            [self.view addSubview:confirmView];
//        }
//        else{
        
//                int numberofStocks = 0;
//                if (_itemDetails.IsContribution == TRUE)
//                    numberofStocks = remainingStock;
                confirmView = [[confirmPersonalDonationView alloc] initWithFrame:CGRectMake(7,40,304,145):self:_itemDetails.DonationCost];
                [self.view addSubview:confirmView];
//            }
//        }
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
//    if (confirmView.projectNameTF.isFirstResponder) {
//        [confirmView.projectNameTF resignFirstResponder];
//    }
//    if (confirmView.projectNoteTF.isFirstResponder) {
//        [confirmView.projectNoteTF resignFirstResponder];
//    }
    confirmView.alpha = 0;
    confirmView = nil;
    [confirmView removeFromSuperview];
}

-(void) getTotalAmount:(int)value :(NSString *)proName :(NSString *)proNote
{
    [self hidePopover];
    //[self donateviaPortal];
    
    [AC startLoading];
    
    IACADDonateToCatalogPerson *request = [[IACADDonateToCatalogPerson alloc] init];
    request.culture = appDelegate.culture;
    request.charityId = _itemDetails.CharityId;
    request.donorId = appDelegate.userID;
    request.personId = _itemDetails.ID;
    request.monthlyCost = _itemDetails.DonationCost;
    request.noOfMonths = value;
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client DonateToCatalogPersonAsyncIsPost:YES input:request caller:self];
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

- (void)DonateToCatalogPersonCallback:(IACADDonateToCatalogPersonResponse *)response error:(NSError *)error
{
    [AC stopLoading];
    IACADDonateCatalogResult *returnResponse = response.DonateToCatalogPersonResult;
    // NSLog(@"return URL %@",returnResponse);
    if (returnResponse.IsValid == YES)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:returnResponse.RedirectUrl]];
//        [self viewWebview:returnResponse.RedirectUrl];
    }
    else
    {
//        remainingStock = returnResponse.RemainingStock;
        BlockAlertView * alert = [BlockAlertView alertWithTitle:NSLocalizedStringFromTable(@"message_title",appDelegate.culture, @"") message:returnResponse.ErrorMessage];
        [alert setCancelButtonWithTitle:NSLocalizedStringFromTable(@"done_lbl",appDelegate.culture, @"") block:nil];
        [alert show];
    }
    
}

-(void) viewWebview: (NSString *)htmlString
{
    isPaymentScreenOpened = true;
    
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


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    float currentVersion = 7.0;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion) {
        self.view.frame = CGRectMake(0, 20, 320, self.view.frame.size.height-40);
        self.tabbarImg.frame  =  CGRectMake(0, -20,320,66);
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return ! ([touch.view isKindOfClass:[UIControl class]]);
}





@end
