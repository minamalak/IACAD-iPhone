//
//  FilterView.m
//  IACAD
//
//  Created by Ahmed Azab on 8/19/13.
//  Copyright (c) 2013 Ahmed Azab. All rights reserved.
//

#import "FilterView.h"
#import "IACADCharity.h"
#import "ArabicConverter.h"
#import <QuartzCore/QuartzCore.h>
#import "IACADGetCountries.h"
#import "IACADGetCountriesResponse.h"
#import "IACADCountry.h"
#import "IACADGetCharitiesByDonationType.h"
#import "IACADGetCharitiesByDonationTypeResponse.h"
#import "IACADGetCatalogCountries.h"
#import "IACADGetCatalogCountriesResponse.h"
#import "CustomizedACView.h"



@implementation FilterView

- (id)initWithFrame:(CGRect)frame  :(id)del :(int)charityid :(NSMutableArray *)countryid :(int)donateid :(NSString *)charIndex :(NSString *)counIndex
{
    self = [super initWithFrame:frame];
    if (self) {
        delegate = del;
        charityID = charityid;
        countryID = countryid;
        donateID = donateid;
        charityName = charIndex;
        countryName = counIndex;
        //        counID = countryid;
        //        [counID removeAllObjects];
        counID = [NSMutableArray new];
        self.backgroundColor = [UIColor clearColor];
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        arraySelected = [NSMutableArray new];
        
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
        charityLbl.textAlignment = NSTextAlignmentCenter;
        charityLbl.backgroundColor=[UIColor clearColor];
        charityLbl.textColor=[UIColor whiteColor];
        charityLbl.font = boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
            charityLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"")];
        else
            charityLbl.text = NSLocalizedStringFromTable(@"charities_lbl",appDelegate.culture, @"");
        [self addSubview:charityLbl];
        
        charity2Lbl = [[UILabel alloc]initWithFrame:CGRectMake(0,35,152,35)];
        charity2Lbl.textAlignment = NSTextAlignmentCenter;
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
        countryLbl.textAlignment = NSTextAlignmentCenter;
        countryLbl.backgroundColor=[UIColor clearColor];
        countryLbl.textColor=[UIColor whiteColor];
        countryLbl.font = boldFont;
        if ([appDelegate.culture isEqualToString:@"ar"])
            countryLbl.text = [converter convertArabic:NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"")];
        else
            countryLbl.text = NSLocalizedStringFromTable(@"country_lbl",appDelegate.culture, @"");
        [self addSubview:countryLbl];
        
        country2Lbl = [[UILabel alloc]initWithFrame:CGRectMake(152,35,152,35)];
        country2Lbl.textAlignment = NSTextAlignmentCenter;
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
        copFilter =[[UIButton alloc]init];
        copFilter.frame = CGRectMake(0,10,152,60);
        [copFilter setBackgroundImage:trans1 forState:UIControlStateNormal];
        [copFilter addTarget:self action:@selector(loadCopFilter) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:copFilter];
        
        UIImage *trans2= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trans" ofType:@"png"]];
        countryFilter =[[UIButton alloc]init];
        countryFilter.frame = CGRectMake(152,10,152,60);
        [countryFilter setBackgroundImage:trans2 forState:UIControlStateNormal];
        [countryFilter addTarget:self action:@selector(loadCountryFilter) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:countryFilter];
        
        
        firstcellImage = [[UIImageView alloc] initWithFrame:CGRectMake(-8,70,320,31)];
        [firstcellImage setImage:[UIImage imageNamed:@"filter_list_01.png"]];
        [self addSubview:firstcellImage];
        firstcellImage.alpha = 0;
        
        
        // Mina
        viewFiltersButtons = [[UIView alloc]initWithFrame:CGRectMake(3, 90, 298, 60)];
        viewFiltersButtons.backgroundColor = [UIColor colorWithRed:69/255.f
                                                             green:68/255.f
                                                              blue:68/255.f
                                                             alpha:1.0];
        [viewFiltersButtons setAlpha:0];
        [self addSubview:viewFiltersButtons];
        
        UIButton * btnOK =[[UIButton alloc]init];
        btnOK.frame = CGRectMake(5,0,80,30);
        if ([appDelegate.culture isEqualToString:@"ar"]) {
            [btnOK setImage:[UIImage imageNamed:@"select_ar.png"] forState:UIControlStateNormal];
        }
        else {
            [btnOK setImage:[UIImage imageNamed:@"select_en.png"] forState:UIControlStateNormal];
        }
        [btnOK addTarget:self action:@selector(startFilteration) forControlEvents:UIControlEventTouchUpInside];
        [viewFiltersButtons addSubview:btnOK];
        
        UIButton * btnCancel =[[UIButton alloc]init];
        btnCancel.frame = CGRectMake(208,0,80,30);
        if ([appDelegate.culture isEqualToString:@"ar"]) {
            [btnCancel setImage:[UIImage imageNamed:@"cancel_ar.png"] forState:UIControlStateNormal];
        }
        else {
            [btnCancel setImage:[UIImage imageNamed:@"cancel_en.png"] forState:UIControlStateNormal];
        }
        [btnCancel addTarget:self action:@selector(cancelFilteration) forControlEvents:UIControlEventTouchUpInside];
        [viewFiltersButtons addSubview:btnCancel];
        
        UILabel *lblChooseCountryHeader = [[UILabel alloc]initWithFrame:CGRectMake(55, 0, 173, 30)];
        [lblChooseCountryHeader setText:@"Choose Country"];
        [lblChooseCountryHeader setBackgroundColor:[UIColor clearColor]];
        [lblChooseCountryHeader setTextColor:[UIColor whiteColor]];
        [lblChooseCountryHeader setTextAlignment:NSTextAlignmentCenter];
        //        [viewFiltersButtons addSubview:lblChooseCountryHeader];
        
        
        rtable = [[UITableView alloc] initWithFrame:CGRectMake(3,90,298,self.frame.size.height-100)];
        rtable.backgroundColor = [UIColor colorWithRed:69/255.f
                                                 green:68/255.f
                                                  blue:68/255.f
                                                 alpha:1.0];
        
        rtable.showsVerticalScrollIndicator = NO;
        [rtable setTintColor:[UIColor grayColor]];
        rtable.separatorStyle = NO;
        [self addSubview:rtable];
        rtable.alpha = 0;
        [rtable.layer setCornerRadius:10.0];
        
        
        // Mina
        AC =[[CustomizedACView alloc]initWithFrame:CGRectMake(self.center.x, self.center.y, 100, 68)];
        AC.center=self.center;
        AC.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        [AC stopLoading];
        [self addSubview:AC];
        
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(detectTapGesture)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        tap.delegate = (id <UIGestureRecognizerDelegate>) self;
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(IBAction)cancelFilteration
{
    [delegate hideFilterView];
}

-(IBAction)startFilteration
{
    if (counID.count == charitiesList.count) {
        [counID removeAllObjects];
        [counID addObject:[NSNumber numberWithInt:0]];
    }
    //    [delegate reloadPersonalTableview:charID counID:counID charindex:charityName counindex:countryName];
    
    [delegate reloadTableview:charID :counID :charityName :countryName];
}

-(IBAction) loadCopFilter
{
    filterType = @"org";
    rtable.alpha = 0;
    firstcellImage.alpha = 0;
    viewFiltersButtons.alpha = 0;
    IACADGetCharitiesByDonationType * request = [[IACADGetCharitiesByDonationType alloc]init];
    request.culture = appDelegate.culture;
    request.donationTypeId = donateID;
    
    [arrowleft setImage:[UIImage imageNamed:@"filter_arrow_up.png"]];
    [arrowright setImage:[UIImage imageNamed:@"filter_arrow_down.png"]];
    [firstcellImage setImage:[UIImage imageNamed:@"filter_list_01.png"]];
    
    [copFilter setEnabled:NO];
    [countryFilter setEnabled:NO];
//    [self addGestureRecognizer:tap];
    [self removeGestureRecognizer:tap];
    
    [AC startLoading];
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetCharitiesByDonationTypeAsyncIsPost:YES input:request caller:self];
}



-(IBAction) loadCountryFilter
{
    filterType = @"con";
    rtable.alpha = 0;
    firstcellImage.alpha = 0;
    [viewFiltersButtons setAlpha:0];
    IACADGetCatalogCountries * request = [[IACADGetCatalogCountries alloc]init];
    request.culture = appDelegate.culture;
    request.donationTypeId = donateID;
    
    [arrowleft setImage:[UIImage imageNamed:@"filter_arrow_down.png"]];
    [arrowright setImage:[UIImage imageNamed:@"filter_arrow_up.png"]];
    [firstcellImage setImage:[UIImage imageNamed:@"filter_list_10.png"]];
    
    [copFilter setEnabled:NO];
    [countryFilter setEnabled:NO];
    [self removeGestureRecognizer:tap];
    
    [AC startLoading];
    IACADServiceClient *client = [[IACADServiceClient alloc] init];
    [client GetCatalogCountriesAsyncIsPost:YES input:request caller:self];
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
    
    [copFilter setEnabled:YES];
    [countryFilter setEnabled:YES];
    [self addGestureRecognizer:tap];
    [AC stopLoading];
}


-(void) GetCatalogCountriesCallback:(IACADGetCatalogCountriesResponse *)response error:(NSError *)error
{
    [charitiesList removeAllObjects];
    charitiesList = nil;
    charitiesList = [[NSMutableArray alloc]init];
    charitiesList = response.GetCatalogCountriesResult;
    
    IACADCountry * item2 = [[IACADCountry alloc]init];
    item2.Name = NSLocalizedStringFromTable(@"all_Countries",appDelegate.culture, @"");
    item2.Id = 0;
    [charitiesList insertObject:item2 atIndex:0];
    
    if ([charitiesList count]>0)
        [self viewTable];
    
    [copFilter setEnabled:YES];
    [countryFilter setEnabled:YES];
    [self addGestureRecognizer:tap];
    [AC stopLoading];
}

-(void) viewTable
{
    rtable.alpha = 1;
    
//    [rtable removeFromSuperview];
//    rtable = [[UITableView alloc] initWithFrame:CGRectMake(3,90,298,self.frame.size.height-100)];
//    rtable.backgroundColor = [UIColor colorWithRed:69/255.f
//                                             green:68/255.f
//                                              blue:68/255.f
//                                             alpha:1.0];
//    
//    rtable.showsVerticalScrollIndicator = NO;
//    [rtable setTintColor:[UIColor grayColor]];
//    rtable.separatorStyle = NO;
//    [self addSubview:rtable];
//    [rtable.layer setCornerRadius:10.0];
    
    
    firstcellImage.alpha = 1;
    rtable.dataSource = self;
    rtable.delegate = self;
    
    if ([filterType isEqualToString:@"con"]) {
        viewFiltersButtons.alpha = 1;
        if ([charitiesList count] < 10)
            rtable.frame = CGRectMake(3,120,298,[charitiesList count] * 30);
        else
            rtable.frame = CGRectMake(3,120,298,self.frame.size.height-100);
    }
    else {
        if ([charitiesList count] < 12)
            rtable.frame = CGRectMake(3,90,298,[charitiesList count] * 30);
        else
            rtable.frame = CGRectMake(3,90,298,self.frame.size.height-100);
    }
    
    [rtable reloadData];
    
}

#pragma mark - Table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    IACADCharity * item1;
    IACADCountry * item2;
    
    UIImageView *imgCheckmark = (UIImageView *)[cell.contentView viewWithTag:2];
    if ([filterType isEqualToString:@"org"])
    {
        item1 = [charitiesList objectAtIndex:indexPath.row];
        imgCheckmark.hidden = YES;
    }
    if ([filterType isEqualToString:@"con"])
    {
        item2 = [charitiesList objectAtIndex:indexPath.row];
        
        
        if ([arraySelected containsObject:indexPath])
        {
            imgCheckmark.hidden = NO;
        }
        else
        {
            imgCheckmark.hidden = YES;
        }
    }
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
        
        if ([filterType isEqualToString:@"con"])
        {
            UIImageView *imageCheck;
            if ([appDelegate.culture isEqualToString:@"ar"]) {
                imageCheck = [[UIImageView alloc]initWithFrame:CGRectMake(5, 3, 16, 14)];
            }
            else {
                imageCheck = [[UIImageView alloc]initWithFrame:CGRectMake(270, 3, 16, 14)];
            }
            
            [imageCheck setImage:[UIImage imageNamed:@"GreenTickMark.png"]];
            imageCheck.tag = 2;
            imageCheck.hidden = YES;
            
            if (countryID.count == 1 && [countryID objectAtIndex:0] == [NSNumber numberWithInt:0]) {
                if (indexPath.row == 0) {
                    imageCheck.hidden = NO;
                    [arraySelected addObject:indexPath];
                    [counID addObject:[NSNumber numberWithInt:[[charitiesList objectAtIndex:indexPath.row] Id]]];
                }
            }
            
            else if ([countryID objectAtIndex:0] != [NSNumber numberWithInt:0]) {
                for (int i = 0; i < countryID.count; i ++) {
                    if ([countryID objectAtIndex:i] == [NSNumber numberWithInt:[[charitiesList objectAtIndex:indexPath.row] Id]]) {
                        imageCheck.hidden = NO;
                        [arraySelected addObject:indexPath];
                        [counID addObject:[NSNumber numberWithInt:[[charitiesList objectAtIndex:indexPath.row] Id]]];
                    }
                }
            }
            else {
                imageCheck.hidden = NO;
                [arraySelected addObject:indexPath];
                [counID addObject:[NSNumber numberWithInt:[[charitiesList objectAtIndex:indexPath.row] Id]]];
                
            }
            [cell.contentView addSubview:imageCheck];
            
        }
        
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
        //        donationDesc.lineBreakMode = UILineBreakModeWordWrap;
        donationDesc.textColor = [UIColor colorWithRed:273/255.f
                                                 green:240/255.f
                                                  blue:211/255.f
                                                 alpha:1.0];
        donationDesc.tag = 30;
        [cell.contentView addSubview:donationDesc];
        
        UIImageView *imageSeparator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 29, 285, 2)];
        [imageSeparator setImage:[UIImage imageNamed:@"seperator.png"]];
        [cell.contentView addSubview:imageSeparator];
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
    //    int charID;
    //    int counID;
    IACADCharity * item1;
    IACADCountry * item2;
    
    
    if ([filterType isEqualToString:@"org"])
    {
        item1 =  [charitiesList objectAtIndex:indexPath.row];
        charID = item1.ID;
        //        counID = countryID;
        charityName = item1.Name;
        charity2Lbl.text = [converter convertArabic:charityName];
        
    }
    if ([filterType isEqualToString:@"con"])
    {
        item2 = [charitiesList objectAtIndex:indexPath.row];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        if (indexPath.row == 0) {
            [arraySelected removeAllObjects];
            [counID removeAllObjects];
            for (int i = 0; i < [charitiesList count]; i ++) {
                NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0] ;
                [arraySelected addObject:index];
                [counID addObject:[NSNumber numberWithInt:[[charitiesList objectAtIndex:i] Id]]];
            }
        }
        else if ([arraySelected containsObject:indexPath])
        {
            if (arraySelected.count != 1) {
                [arraySelected removeObject:indexPath];
                NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0] ;
                [arraySelected removeObject:index];
                [counID removeObject:[NSNumber numberWithInt:item2.Id]];
                item2 = [charitiesList objectAtIndex:0];
                [counID removeObject:[NSNumber numberWithInt:item2.Id]];
            }
        }
        else
        {
            [arraySelected addObject:indexPath];
            [counID addObject:[NSNumber numberWithInt:item2.Id]];
            NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0] ;
            [arraySelected removeObject:index];
            item2 = [charitiesList objectAtIndex:0];
            [counID removeObject:[NSNumber numberWithInt:item2.Id]];
            if (arraySelected.count == charitiesList.count - 1) {
                NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
                [arraySelected addObject:index];
            }
        }
        
        
        charID = charityID;
        if (arraySelected.count == charitiesList.count || indexPath.row == 0) {
            if ([appDelegate.culture isEqualToString:@"ar"]) {
                countryName = [converter convertArabic:@"كل البلاد"];
            }
            else {
                countryName = [converter convertArabic:@"All Countries"];
            }
        }
        else if (indexPath.row != 0 && arraySelected.count != 1) {
            if ([appDelegate.culture isEqualToString:@"ar"]) {
                countryName = [NSString stringWithFormat:@"%i بلاد", arraySelected.count];                    }
            else {
                countryName = [NSString stringWithFormat:@"%i Countries", arraySelected.count];                    }                   }
        else {
            for (int i = 0; i < charitiesList.count; i ++) {
                if ([NSNumber numberWithInt:[[charitiesList objectAtIndex:i] Id]] == [counID objectAtIndex:0]) {
                    item2 = [charitiesList objectAtIndex:i];
                    break;
                }
            }
            countryName = item2.Name;
        }
        country2Lbl.text = [converter convertArabic:countryName];
        
        [tableView reloadData];
    }
    
    if ([filterType isEqualToString:@"org"])
    {
        if (counID.count == charitiesList.count) {
            [counID removeAllObjects];
            [counID addObject:[NSNumber numberWithInt:0]];
        }
        //        [delegate reloadPersonalTableview:charID counID:countryID charindex:charityName counindex:countryName];
        
        [delegate reloadTableview:charID :countryID :charityName :countryName];
    }
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
