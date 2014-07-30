//
//  EventDetailViewController.m
//  sportsbuddy
//
//  Created by DoodleJack on 7/29/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "EventDetailViewController.h"

@interface EventDetailViewController ()
- (void)configureView;
@end

@implementation EventDetailViewController

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
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

// update view
- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailInfo) {
        
        //NSArray *allKeys = [self.detailInfo allKeys];
        //NSArray *allValues=[self.detailInfo allValues];

        NSArray *allKeys = self.detailInfo;
        //NSArray *allValues = self.event;
        self.eventType.text =  allKeys[0];
        self.eventTime.text=allKeys[1];
    }
}

@end
