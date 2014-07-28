//
//  TeamDetailViewController.m
//  sportsbuddy
//
//  Created by Wenting Shi on 7/27/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "TeamDetailViewController.h"

@interface TeamDetailViewController ()

@end

@implementation TeamDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView.delegate = self;
    
    [self.scrollView setCanCancelContentTouches:NO];
    
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = NO;
    
    CGFloat gap = 0;
    NSArray *memberNames = [NSArray arrayWithObjects:@"Gotze", @"Kroos", @"Klose", @"Muller",
                                                     @"Neuer", @"Boateng", @"Hummels", @"Ozil", nil];
    for (int i = 0; i < 8; i++) {
        
        // add member image
        UIImage *memberImage = [UIImage imageNamed:@"team_member.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:memberImage];
        CGRect imageRect = imageView.frame;
        imageRect.size.height = 90;
        imageRect.size.width = 110;
        imageRect.origin.x = gap;
        imageRect.origin.y = 0;
        imageView.frame = imageRect;
        
        // add member name label
        CGRect labelRect = CGRectMake(gap + 33, imageRect.size.height, imageRect.size.width, 30);
        UILabel *memberName = [[UILabel alloc] initWithFrame:labelRect];
        memberName.text = memberNames[i];
        [self.scrollView addSubview:imageView];
        [self.scrollView addSubview:memberName];
        
        gap += imageView.frame.size.width;
    }
    
    self.scrollView.contentSize = CGSizeMake(gap, [self.scrollView bounds].size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
