//
//  EnToArNum.m
//  Yallakora
//
//  Created by Amira Thabet on 5/20/12.
//  Copyright (c) 2012 LINK Development. All rights reserved.
//

#import "EnToArNum.h"

@implementation EnToArNum


-(id) init
{
    return self;
}


-(NSString *) convertString: (NSString *) engDate
{
    engDate = [engDate lowercaseString];
    
    engDate = [engDate stringByReplacingOccurrencesOfString:@"january"
                                                 withString:@"يناير"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"february"
                                                 withString:@"فبراير"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"march"
                                                 withString:@"مارس"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"april"
                                                 withString:@"أبريل"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"may"
                                                 withString:@"مايو"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"june"
                                                 withString:@"يونيو"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"july"
                                                 withString:@"يوليو"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"august"
                                                 withString:@"أغسطس"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"september"
                                                 withString:@"سبتمبر"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"october"
                                                 withString:@"أكتوبر"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"november"
                                                 withString:@"نوفمبر"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"december"
                                                 withString:@"ديسمبر"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"am"
                                                 withString:@"ص"];
    engDate = [engDate stringByReplacingOccurrencesOfString:@"pm"
                                                 withString:@"م"];
    
    return engDate;
    
}

-(NSString *) convertNumber: (NSString *) number
{
    number = [number stringByReplacingOccurrencesOfString:@"1"
                                                 withString:@"١"];
    number = [number stringByReplacingOccurrencesOfString:@"2"
                                                 withString:@"٢"];
    number = [number stringByReplacingOccurrencesOfString:@"3"
                                                 withString:@"٣"];
    number = [number stringByReplacingOccurrencesOfString:@"4"
                                                 withString:@"٤"];
    number = [number stringByReplacingOccurrencesOfString:@"5"
                                                 withString:@"٥"];
    number = [number stringByReplacingOccurrencesOfString:@"6"
                                                 withString:@"٦"];
    number = [number stringByReplacingOccurrencesOfString:@"7"
                                                 withString:@"٧"];
    number = [number stringByReplacingOccurrencesOfString:@"8"
                                                 withString:@"٨"];
    number = [number stringByReplacingOccurrencesOfString:@"9"
                                                 withString:@"٩"];
    number = [number stringByReplacingOccurrencesOfString:@"0"
                                                 withString:@"٠"];
    
    return number;
}



@end
