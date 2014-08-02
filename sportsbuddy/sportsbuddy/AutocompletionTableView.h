//
//  AutocompletionTableView.h
//
//  Created by DoodleJack on 7/29/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutocompletionTableView : UITableView <UITableViewDataSource, UITableViewDelegate>
// Dictionary of NSStrings of your auto-completion terms
@property (nonatomic, strong) NSArray *suggestionsDictionary; 

// Dictionary of auto-completion options (check constants above)
@property (nonatomic, strong) NSDictionary *options;

// Call it for proper initialization
- (UITableView *)initWithTextField:(UITextField *)textField inViewController:(UIViewController *) parentViewController withOptions:(NSDictionary *)options;
@end
