//
//  FilterView.m
//  IACAD
//
//  Created by Ahmed Azab on 8/19/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "PersonalFilterView.h"
#import "IACADCharity.h"
#import "ArabicConverter.h"
#import <QuartzCore/QuartzCore.h>
//#import "IACADGetCountries.h"
//#import "IACADGetCountriesResponse.h"
#import "IACADCountry.h"
#import "IACADGetCharitiesByDonationType.h"
#import "IACADGetCharitiesByDonationTypeResponse.h"
//#import "IACADGetCatalogCountries.h"
//#import "IACADGetCatalogCountriesResponse.h"
#import "IACADGetCatalogPersonCountries.h"
#import "IACADGetCatalogPersonCountriesResponse.h"



@implementation PersonalFilterView

- (id)initWithFrame:(CGRect)frame  :(id)del :(int)charityid :(int)countryid :(int)donateid :(NSString *)charIndex :(NSString *)counIndex
{
    self = [super initWithFrame:frame];
    if (self) {
       
        delegate = del;
        charityID = charityid;
        countryID = countryid;
        donateID = donateid;
        charityName = charIndex;
        countryName = counIndex;
        self.backgroundColor = [UIColor clearColor];
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        filterType = @"";
       
        UIImageView * barImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,304,70)];
        if([appDelegate.culture isEqualToString:@"ar"])
        [barImage setImage:[UIImage imageNamed:@"filterBar.png"]];
        else
        [barImage setImage:[UIImage imageNamed:@"filterBar_en.png"]];
        [self addSubview:barImage];
        
        arrowleft = [[UIImageView alloc] initWithFrame:CGRectMake(130,21,9,9)];
        [arrowleft setImage:[UIImage imageNamed:@"filter_arrow_down.png"]];
        [self addSubview:arrowleft];
        
        arrowright = [[UIImageView alloc] initWithFrame:CGRectMake(280,21,9,9)];
        [arrowright setImage:[UIImage imageNamed:@"filter_arrow_down.png"]];
        [self addSubview:arrowright];
        
        ArabicConverter *converter = [[ArabicConverter alloc] init];
        UIFont *boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
            boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
        else
            boldFont=[UIFont systemFontOfSize:12];
        
        UILabel * charityLbl = [[UILabel alloc]initWithFrame:CGRectMake(0,8,152,35)];
        charityLbl.textAlignment = UITextAlignmentCenter;
        charityLbl.backgroundColor=[UIColor clearColor];
        charityLbl.textColor=[UIColor whiteColor];
        charityLbl.font = boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
         charityLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"")];
        else
            charityLbl.text = NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"");
        [self addSubview:charityLbl];
        
        charity2Lbl = [[UILabel alloc]initWithFrame:CGRectMake(0,35,152,35)];
        charity2Lbl.textAlignment = UITextAlignmentCenter;
        charity2Lbl.backgroundColor=[UIColor clearColor];
        charity2Lbl.textColor=[UIColor colorWithRed:178/255.f
                                              green:205/255.f
                                               blue:30/255.f
                                              alpha:1.0];
        charity2Lbl.font = boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
        charity2Lbl.text = [converter convertArabic:charityName];
        else
        charity2Lbl.text = charityName;
        [self addSubview:charity2Lbl];
        
        UILabel * countryLbl = [[UILabel alloc]initWithFrame:CGRectMake(152,8,152,35)];
        countryLbl.textAlignment = UITextAlignmentCenter;
        countryLbl.backgroundColor=[UIColor clearColor];
        countryLbl.textColor=[UIColor whiteColor];
        countryLbl.font = boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
            countryLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"")];
        else
            countryLbl.text = NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"");
        [self addSubview:countryLbl];
        
        country2Lbl = [[UILabel alloc]initWithFrame:CGRectMake(152,35,152,35)];
        country2Lbl.textAlignment = UITextAlignmentCenter;
        country2Lbl.backgroundColor=[UIColor clearColor];
        country2Lbl.textColor=[UIColor colorWithRed:178/255.f
                                              green:205/255.f
                                               blue:30/255.f
                                              alpha:1.0];
        country2Lbl.font = boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
        country2Lbl.text = [converter convertArabic:countryName];
        else
            country2Lbl.text = countryName;
        [self addSubview:country2Lbl];
        
        
        UIImage *trans1= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
        UIButton * copFilter =[[UIButton alloc]init];
        copFilter.frame = CGRectMake(0,10,152,60);
        [copFilter setBackgroundImage:trans1 forState:UIControlStateNormal];
        [copFilter addTarget:self action:@selector(loadCopFilter) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:copFilter];
        
        UIImage *trans2= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
        UIButton * countryFilter =[[UIButton alloc]init];
        countryFilter.frame = CGRectMake(152,10,152,60);
        [countryFilter setBackgroundImage:trans2 forState:UIControlStateNormal];
        [countryFilter addTarget:self action:@selector(loadCountryFilter) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:countryFilter];
        
        
        firstcellImage = [[UIImageView alloc] initWithFrame:CGRectMake(-8,70,320,31)];
        [firstcellImage setImage:[UIImage imageNamed:@"filter_list_01.png"]];
        [self addSubview:firstcellImage];
        firstcellImage.alpha = 0;
        
        rtable = [[UITableView alloc] initWithFrame:CGRectMake(3,90,298,self.frame.size.height-100)];
        rtable.backgroundColor = [UIColor colorWithRed:69/255.f
                                                 green:68/255.f
                                                  blue:68/255.f
                                                 alpha:1.0];
        
        rtable.showsVerticalScrollIndicator = NO;
        rtable.separatorStyle = NO;
        [self addSubview:rtable];
        rtable.alpha = 0;
        [rtable.layer setCornerRadius:10.0];
        
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(detectTapGesture)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        tap.delegate = (id <UIGestureRecognizerDelegate>) self;
        [self addGestureRecognizer:tap];
        
        
    }
    return self;
}

-(void) loadCopFilter
{
    filterType = @"org";
    rtable.alpha = 0;
    firstcellImage.alpha = 0;
    IACADGetCharitiesByDonationType * request = [[IACADGetCharitiesByDonationType alloc]init];
    request.culture = appDelegate.culture;
    request.donationTypeId = donateID;
    
    [arrowleft setImage:[UIImage imageNamed:@"filter_arrow_up.png"]];
    [arrowright setImage:[UIImage imageNamed:@"filter_arrow_down.png"]];
    [firstcellImage setImage:[UIImage imageNamed:@"filter_list_01.png"]];
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetCharitiesByDonationTypeAsyncIsPost:YES input:request caller:self];
}



-(void) loadCountryFilter
{
    
    filterType = @"con";
    rtable.alpha = 0;
    firstcellImage.alpha = 0;
    IACADGetCatalogPersonCountries * request = [[IACADGetCatalogPersonCountries alloc]init];
    request.culture = appDelegate.culture;
    request.donationTypeId = donateID;
    
    [arrowleft setImage:[UIImage imageNamed:@"filter_arrow_down.png"]];
    [arrowright setImage:[UIImage imageNamed:@"filter_arrow_up.png"]];
    [firstcellImage setImage:[UIImage imageNamed:@"filter_list_10.png"]];
    
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetCatalogPersonCountriesAsyncIsPost:YES input:request caller:self];
}

-(void) GetCharitiesByDonationTypeCallback:(IACADGetCharitiesByDonationTypeResponse *)response error:(NSError *)error
{
    [charitiesList removeAllObjects];
    charitiesList = nil;
    charitiesList = [[NSMutableArray alloc]init];
    charitiesList = response.GetCharitiesByDonationTypeResult;
    
    IACADCharity * item1 = [[IACADCharity alloc]init];
    item1.Name = NSLocalizedStringFromTable(@"all_charities",appDelegate.culture, @"");
    item1.ID = 0;
    [charitiesList insertObject:item1 atIndex:0];
    
    if ([charitiesList count]>0)
        [self viewTable];
}


-(void) GetCatalogPersonCountriesCallback:(IACADGetCatalogPersonCountriesResponse *)response error:(NSError *)error
{
    [charitiesList removeAllObjects];
    charitiesList = nil;
    charitiesList = [[NSMutableArray alloc]init];
    charitiesList = response.GetCatalogPersonCountriesResult;
    
    IACADCountry * item2 = [[IACADCountry alloc]init];
    item2.Name = NSLocalizedStringFromTable(@"all_Countries",appDelegate.culture, @"");
    item2.Id = 0;
    [charitiesList insertObject:item2 atIndex:0];
    
    if ([charitiesList count]>0)
        [self viewTable];
}




-(void) viewTable
{
//    if ([filterType isEqualToString:@"org"])
//    {
//        IACADCharity * item1 = [[IACADCharity alloc]init];
//        item1.Name = NSLocalizedStringFromTable(@"all_charities",appDelegate.culture, @"");
//        item1.ID = 0;
//        [charitiesList insertObject:item1 atIndex:0];
// 
//    }
//    if ([filterType isEqualToString:@"con"])
//    {
//        IACADCountry * item2 = [[IACADCountry alloc]init];
//        item2.Name = NSLocalizedStringFromTable(@"all_Countries",appDelegate.culture, @"");
//        item2.Id = 0;
//        [charitiesList insertObject:item2 atIndex:0];
//    }
//    
    rtable.alpha = 1;
    firstcellImage.alpha = 1;
    rtable.dataSource = self;
    rtable.delegate = self;
    if ([charitiesList count] < 12)
        rtable.frame = CGRectMake(3,90,298,[charitiesList count] * 30);
    else
        rtable.frame = CGRectMake(3,90,298,self.frame.size.height-100);
    [rtable reloadData];
    
}

#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    
    IACADCharity * item1;
    IACADCountry * item2;
    
    if ([filterType isEqualToString:@"org"])
    {
        item1 = [charitiesList objectAtIndex:indexPath.row];
    }
    if ([filterType isEqualToString:@"con"])
    {
        item2 = [charitiesList objectAtIndex:indexPath.row];
    }
    
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
      
        
        
        UILabel *donationDesc = [[UILabel alloc] init];
        if([appDelegate.culture isEqualToString:@"ar"])
        {
            UIFont *boldFont=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:14];
            donationDesc.font = boldFont;
            donationDesc.textAlignment = NSTextAlignmentRight;
        }
        else
        {
            UIFont * boldFont = boldFont=[UIFont systemFontOfSize:14];
            donationDesc.font = boldFont;
            donationDesc.textAlignment = NSTextAlignmentLeft;
        }
        
        donationDesc.frame=CGRectMake(5, 3, 285,20);
        donationDesc.backgroundColor = [UIColor clearColor];
        donationDesc.lineBreakMode = UILineBreakModeWordWrap;
        donationDesc.textColor = [UIColor colorWithRed:273/255.f
                                                 green:240/255.f
                                                  blue:211/255.f
                                                 alpha:1.0];
        donationDesc.tag = 30;
        [cell.contentView addSubview:donationDesc];
              
        
    }
    
    UILabel *lbl5 = (UILabel *)[cell.contentView viewWithTag:30];
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    if ([filterType isEqualToString:@"org"])
         lbl5.text = [converter convertArabic: item1.Name];
    if ([filterType isEqualToString:@"con"])
          lbl5.text = [converter convertArabic: item2.Name];
  
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.backgroundColor = [UIColor clearColor];
    
    
	return cell;
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [charitiesList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 30;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ArabicConverter *converter = [[ArabicConverter alloc] init];
    int charID;
    int counID;
    IACADCharity * item1;
    IACADCountry * item2;
    
    if ([filterType isEqualToString:@"org"])
    {
      item1 =  [charitiesList objectAtIndex:indexPath.row];
        charID = item1.ID;
        counID = countryID;
        charityName = item1.Name;
        charity2Lbl.text = [converter convertArabic:charityName];
        
    }
    if ([filterType isEqualToString:@"con"])
    {
      item2 =  [charitiesList objectAtIndex:indexPath.row];
        charID = charityID;
        counID = item2.Id;
        countryName = item2.Name;
        country2Lbl.text = [converter convertArabic:countryName];
    }
    [delegate reloadTableview:charID:counID:charityName:countryName];
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    BOOL result = ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];
    return result;
}

-(void)detectTapGesture {
    [delegate hideFilterView];
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
