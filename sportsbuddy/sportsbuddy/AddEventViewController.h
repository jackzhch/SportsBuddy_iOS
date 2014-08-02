//
//  AddEventViewController.h
//  sportsbuddy
//
//  Created by DoodleJack on 7/29/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventItem.h"

@interface AddEventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *eventType;
@property (weak, nonatomic) IBOutlet UITextField *eventLat;
@property (weak, nonatomic) IBOutlet UITextField *eventLng;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UITextField *eventNotes;
@property (weak, nonatomic) IBOutlet UILabel *maxPeople;
@property (weak, nonatomic) IBOutlet UIDatePicker *eventDate;
@property (weak, nonatomic) IBOutlet UISwitch *eventVisibility;

@property EventItem *eventItem;

- (IBAction)unwindToMap:(UIStoryboardSegue *)segue;

@end
