//
//  DiscussionDetailViewController.m
//  sportsbuddy
//
//  Created by Wenting Shi on 7/26/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "DiscussionDetailViewController.h"
#import "ReplyTableViewCell.h"

@interface DiscussionDetailViewController ()

@end

@implementation DiscussionDetailViewController

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
    
    // set delegate
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    // Do any additional setup after loading the view.
    
    NSDictionary *testReply1 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"User.png", @"image",
                               @"Jason", @"username",
                               @"July 24th", @"date",
                               @"Hi, I'd be happy to offer some advice. My suggestion is...",@"replyMsg",nil];
    
    NSDictionary *testReply2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"User.png", @"image",
                                @"Tim", @"username",
                                @"July 23th", @"date",
                                @"Hi, I'd be happy to offer some advice. My suggestion is...",@"replyMsg",nil];
    
    NSDictionary *testReply3 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"User.png", @"image",
                                @"Peter", @"username",
                                @"July 22th", @"date",
                                @"Hi, I'd be happy to offer some advice. My suggestion is...",@"replyMsg",nil];
    
    NSDictionary *testReply4 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"User.png", @"image",
                                @"Jackson", @"username",
                                @"July 21th", @"date",
                                @"Hi, I'd be happy to offer some advice. My suggestion is...",@"replyMsg",nil];
    
    NSDictionary *testReply5 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"User.png", @"image",
                                @"Kevin", @"username",
                                @"July 20th", @"date",
                                @"Hi, I'd be happy to offer some advice. My suggestion is...",@"replyMsg",nil];
    
    self.replyMsgs = [NSMutableArray arrayWithObjects:testReply1,testReply2,testReply3, testReply4, testReply5, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAddReplyPressed:(UIButton *)sender {
    // Present modal view
    [self performSegueWithIdentifier:@"addReply" sender:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.replyMsgs count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    cell.backgroundColor = [UIColor colorWithRed:205.0 / 255 green:0.0/255 blue:0.0/255 alpha:1];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"ReplyCell";
    ReplyTableViewCell *tablecell = (ReplyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary * dict = [self.replyMsgs objectAtIndex:indexPath.row];
    
    // reply
    tablecell.replyMsg.text = [dict objectForKey:@"replyMsg"];
    UIFont *contentFont = [UIFont systemFontOfSize:15.0];
    [tablecell.replyMsg setFont:contentFont];
    
    // username
    tablecell.userName.text = [dict objectForKey:@"username"];
    
    // date
    tablecell.replyDate.text = [dict objectForKey:@"date"];
    
    // user thumbnail
    UIImage *userImage = [UIImage imageNamed:[dict objectForKey:@"image"]];
    [tablecell.userImage setImage:userImage];
    
    return tablecell;
    
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
