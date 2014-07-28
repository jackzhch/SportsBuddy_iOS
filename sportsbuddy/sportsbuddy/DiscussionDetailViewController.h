//
//  DiscussionDetailViewController.h
//  sportsbuddy
//
//  Created by Wenting Shi on 7/26/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscussionDetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *replyMsgs;

@end
