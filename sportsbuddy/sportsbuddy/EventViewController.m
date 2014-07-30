//
//  EventViewController.m
//  sportsbuddy
//
//  Created by DoodleJack on 7/29/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "EventViewController.h"
#import "EventDetailViewController.h"

@interface EventViewController (){
    NSArray *event;
    NSArray *date;
    //NSDictionary *eventDetail;
    NSArray *location;
    NSArray *maxNum;
    NSArray *latitude;
    NSArray *longitude;
}

@end

@implementation EventViewController

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
    self.title=@"Nearby Events";
    
    self.eventDetailViewController = (EventDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    event = [NSArray arrayWithObjects:
             
             @"Black Tie Gala at Longue Vue Club in Verona",
             @"PVGP Historic Races at Pitt Race Complex",
             @"Walnut Street Car Show",
             @"Car Cruise at Waterfront in Homestead",
             @"Downtown Parade & Car Display",
             @"Grand Prix Tune-Up Party",
             @"Countryside Tour to Coventry Inn, Indiana PA",
             @"Schenley Park International Car Show & Vintage Race",
             @"Schenley Park Race Day/Opening Ceremoni/Vintage Races",
             nil];
    date = [NSArray arrayWithObjects:
            
            @"July 11 (7 pm – 11 pm)",
            @"July 12 & 13 (9 am – 5 pm)",
            @"July 14 (5 pm- 9 pm)",
            @"July 15 (5 pm – 10 pm)",
            @"July 16 (11 am – 2 pm)",
            @"July 16 (6 pm– 9 pm)",
            @"July 17 (9:00 am – 3:00 pm)",
            @"July 19 (9:30 am – 5 pm)",
            @"July 20 (9:30 am – 5 pm)",
            nil];
    //eventDetail = [NSDictionary dictionaryWithObjects:date
      //                                        forKeys:event];
    
    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//    
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
//    
//    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// totoal rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [event count];
}

// cell style set up
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *notDefaultTableIdentifier = @"NotDefaultCell";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:notDefaultTableIdentifier];
        
        //instead of UITableViewCellStyleDefault , use initWithStyle:UITableViewCellStyleSubtitle
        
    }
    
    // event Date in each cell's title
    cell.textLabel.text = [date objectAtIndex:indexPath.row];
    //add event name in each cell's subtitle
    cell.detailTextLabel.text=[event objectAtIndex:indexPath.row];
    
    //add thumb nail on the left in each cell
    cell.imageView.image = [UIImage imageNamed:@"USA.png"];
    // add detail info indicator on the right in each cell
    // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    
    return cell;
}


// select a row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.eventDetailViewController.detailInfo = [[NSMutableArray alloc] initWithArray:@[event[indexPath.row], date[indexPath.row]]];
//    [NSMutableDictionary dictionaryWithObject:date[indexPath.row] forKey:event[indexPath.row]];
//    self.eventDetailViewController.eventTime =
//    self.eventDetailViewController.eventType
//    self.eventDetailViewController.eventMaxNum
//    self.eventDetailViewController.eventLocation
    
    
	//[self.navigationController pushViewController:self.detailViewController animated:YES];
    
    
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"showDetail"])
        
    { //[segue destinationViewController];

        self.eventDetailViewController = [segue destinationViewController];

        // Pass any objects to the view controller here, like...
        // [self.detailViewController setMyObjectHere:object];
    }
    
}

@end
