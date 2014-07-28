//
//  TeamViewController.m
//  sportsbuddy
//
//  Created by Wenting Shi on 7/24/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "TeamViewController.h"
#import "TeamTableViewCell.h"

@interface TeamViewController ()

@end

@implementation TeamViewController

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
    
    NSDictionary *testTeam1 = [NSDictionary dictionaryWithObjectsAndKeys:@"UNDEFEATED", @"name",
                               @"Soccer", @"type",@"Team_default.png", @"image", nil];
    NSDictionary *testTeam2 = [NSDictionary dictionaryWithObjectsAndKeys:@"SHADOW", @"name",
                               @"Basketball", @"type",@"Team_default.png", @"image", nil];
    NSDictionary *testTeam3 = [NSDictionary dictionaryWithObjectsAndKeys:@"TERMINATOR", @"name",
                               @"Tennis", @"type",@"Team_default.png", @"image", nil];
    
    // load some fake teams for now
    self.myTeams = [NSMutableArray arrayWithObjects:testTeam1, testTeam2, testTeam3, nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.myTeams count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    cell.backgroundColor = [UIColor colorWithRed:205.0 / 255 green:0.0/255 blue:0.0/255 alpha:1];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"TeamTableCell";
    TeamTableViewCell *tablecell = (TeamTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary *team = [self.myTeams objectAtIndex:indexPath.row];
    
    tablecell.teamName.text = [team objectForKey:@"name"];
    UIFont *font = [UIFont boldSystemFontOfSize:21.0];
    [tablecell.teamName setFont:font];

    tablecell.sportsType.text = [team objectForKey:@"type"];
    UIImage *image = [UIImage imageNamed:[team objectForKey:@"image"]];
    [tablecell.teamImage setImage:image];
    
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
