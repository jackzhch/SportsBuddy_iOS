//
//  EventViewController.h
//  sportsbuddy
//
//  Created by DoodleJack on 7/29/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class EventDetailViewController ;

@interface EventViewController : UIViewController<UITableViewDelegate>

@property (strong, nonatomic) EventDetailViewController *eventDetailViewController;

@end


//@class DetailViewController;
//@interface EventViewController : UITableViewController

//CoreData
//@interface EventViewController : UITableViewController <NSFetchedResultsControllerDelegate>
//
//@property (strong, nonatomic) DetailViewController *detailViewController;
//
////CoreData
//@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
//@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@end




