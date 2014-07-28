//
//  DiscussionViewController.m
//  sportsbuddy
//
//  Created by Wenting Shi on 7/24/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "DiscussionViewController.h"

@interface DiscussionViewController ()

@end

@implementation DiscussionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// launch modal view for creating new discussion post
- (IBAction)newPostButtonPressed:(UIBarButtonItem *)sender {
    // Present modal view
    [self performSegueWithIdentifier:@"newPost" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view.
    NSDictionary *testPost1 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"User.png", @"image",
                               @"Alex", @"username",
                               @"July 26th", @"date",
                               @"How to Improve Tennis Skill?", @"title",
                               @"I am new to tennis and would like to seek some advice on...",@"content",nil];
    
    NSDictionary *testPost2 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"User.png", @"image",
                               @"Jason", @"username",
                               @"July 24th", @"date",
                               @"How to Improve Soccer Skill?", @"title",
                               @"I am new to soccer and would like to seek some advice on...",@"content",nil];
    
    NSDictionary *testPost3 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"User.png", @"image",
                               @"Elizabeth", @"username",
                               @"July 23th", @"date",
                               @"How to Improve Swimming Skill?", @"title",
                               @"I am new to swimming and would like to seek some advice on...",@"content",nil];
    
    NSDictionary *testPost4 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"User.png", @"image",
                               @"Jack", @"username",
                               @"July 21th", @"date",
                               @"How to Improve Basketball Skill?", @"title",
                               @"I am new to basketball and would like to seek some advice on...",@"content",nil];
    
    
    self.postsArray = [NSMutableArray arrayWithObjects:testPost1,testPost2, testPost3, testPost4, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.postsArray count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    cell.backgroundColor = [UIColor colorWithRed:205.0 / 255 green:0.0/255 blue:0.0/255 alpha:1];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"TableCellID";
    DiscussionTableViewCell *tablecell = (DiscussionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary * dict = [self.postsArray objectAtIndex:indexPath.row];
    
    // title
    tablecell.cellTitle.text = [dict objectForKey:@"title"];
    UIFont *mainTitleFont = [UIFont boldSystemFontOfSize:17.0];
    [tablecell.cellTitle setFont:mainTitleFont];
    
    // content
    tablecell.cellContent.text = [dict objectForKey:@"content"];
    UIFont *contentFont = [UIFont boldSystemFontOfSize:15.0];
    [tablecell.cellTitle setFont:contentFont];

    // username
    tablecell.cellUsername.text = [dict objectForKey:@"username"];

    // date
    tablecell.cellDate.text = [dict objectForKey:@"date"];

    // user thumbnail
    UIImage *userImage = [UIImage imageNamed:[dict objectForKey:@"image"]];
    [tablecell.cellImage setImage:userImage];
    
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
