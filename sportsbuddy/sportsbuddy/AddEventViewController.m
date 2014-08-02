//
//  AddEventViewController.m
//  sportsbuddy
//
//  Created by DoodleJack on 7/29/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "AddEventViewController.h"
#import "AutocompletionTableView.h"
#import "LocationSerachViewController.h"

@interface AddEventViewController ()
@property (nonatomic, strong) AutocompletionTableView *autoCompleter;

@end

@implementation AddEventViewController
@synthesize autoCompleter = _autoCompleter;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.eventType addTarget:self.autoCompleter action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setLocation:(UIButton *)sender {
}


- (IBAction)valueChanged:(UIStepper *)sender {
    
    double value = [sender value];
    [self.maxPeople setText:[NSString stringWithFormat:@"%d", (int)value]];
    
}

- (AutocompletionTableView *)autoCompleter
{
    if (!_autoCompleter)
    {
        NSMutableDictionary *options = [NSMutableDictionary dictionaryWithCapacity:2];
        _autoCompleter = [[AutocompletionTableView alloc] initWithTextField:self.eventType inViewController:self withOptions:options];
        _autoCompleter.suggestionsDictionary = [NSArray arrayWithObjects:@"badminton",@"soccer",@"table tennis",@"Tennis",@"basketball", @"football", nil];
    }
    return _autoCompleter;
}

// dismiss keyboard
- (IBAction)backgroundTap:(id)sender {
    [sender resignFirstResponder];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([touch view] != self.eventType && [touch view] != self.eventNotes) {
        [self.eventNotes resignFirstResponder];
        [self.eventType resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)unwindToMap:(UIStoryboardSegue *)segue
{
    LocationSerachViewController *source = [segue sourceViewController];
    //EventItem *newItem = source.eventItem;
    self.eventItem = source.eventItem;
    [self.eventNotes setText:[NSString stringWithFormat:@"%f",self.eventItem.coordinate.latitude]];

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    //if (self.textField.text.length) {
    CLLocationCoordinate2D coordinate;
    self.eventItem = [[EventItem alloc] init];
    self.eventItem.eventType = self.eventType.text;
    self.eventItem.latitude = [self.eventLat.text doubleValue];
    self.eventItem.longitude = [self.eventLng.text doubleValue];
    coordinate.latitude = self.eventItem.latitude;
    coordinate.longitude = self.eventItem.longitude;
    
    self.eventItem.coordinate = coordinate;
    self.eventItem.eventType = self.eventType.text;
    self.eventItem.eventNote = self.eventNotes.text;
    self.eventItem.eventTime = self.eventDate.date;
    self.eventItem.eventMaxNum = [self.maxPeople.text intValue];
    if ([self.eventVisibility isOn]) {
        self.eventItem.visibility = @"ON";
        NSLog(@"Switch is ON");
    } else{
        self.eventItem.visibility = @"OFF";
        NSLog(@"Switch is OFF");
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd,hh:mm"];
    NSLog(@"%@", [formatter stringFromDate:self.eventItem.eventTime]);
    
    
    //}
}


@end
