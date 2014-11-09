//
//  CustomizedACView.m

//

#import "CustomizedACView.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "AsyncImageView.h"
#import "ArabicConverter.h"

@implementation CustomizedACView
@synthesize ac;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        ac=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        ac.frame=CGRectMake(frame.size.width/2-8, frame.size.height/2-16,20 ,20 );
        [self addSubview:ac];
        LoadingString=[[UILabel alloc]init];
        if ([appDelegate.culture isEqualToString:@"ar"])
        {
            UIFont *boldFont2=[UIFont fontWithName:@"GESSTwoMedium-Medium" size:12];
            ArabicConverter *converter = [[ArabicConverter alloc] init];
            LoadingString.text =  [converter convertArabic:@"جاري التحميل"];
            LoadingString.font = boldFont2;
            LoadingString.frame=CGRectMake(15,frame.size.height/2+12,frame.size.width , 13);
        }
        else
        {
            UIFont *boldFont2 = [UIFont systemFontOfSize:12];
            LoadingString.text =  @"Loading";
            LoadingString.font = boldFont2;
            LoadingString.frame=CGRectMake(25,frame.size.height/2+12,frame.size.width , 13);
        }
        
        self.frame=frame;
        self.backgroundColor=[UIColor blackColor];
        self.alpha=0.8;
        self.layer.cornerRadius=8;
        
        // LoadingString.text = @"جاري التحميل";
        
        
        //LoadingString.font=[UIFont fontWithName:@"Verdana" size:12];
        
        LoadingString.textColor=[UIColor whiteColor];
        LoadingString.backgroundColor=[UIColor clearColor];
        
        
        
        
        
    }
    return self;
}

-(void)startLoading{
    
    [ac startAnimating];
    [self addSubview:ac];
    [self addSubview:LoadingString];
    self.alpha=0.8;
}
-(void)stopLoading{
    [ac stopAnimating];
    self.alpha=0;
}

@end
