//
//  EventDetailViewController.h
//  sportsbuddy
//
//  Created by DoodleJack on 7/29/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *detailItem;
@property (strong, nonatomic) NSMutableArray *detailInfo;


@property (weak, nonatomic) IBOutlet UILabel *eventType;
@property (weak, nonatomic) IBOutlet UILabel *eventTime;
@property (weak, nonatomic) IBOutlet UILabel *eventLocation;
@property (weak, nonatomic) IBOutlet UILabel *eventMaxNum;

@end
