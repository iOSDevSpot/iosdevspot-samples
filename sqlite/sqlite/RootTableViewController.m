//
//  RootTableViewController.m
//  sqlite
//
//  Created by Fernando Ribeiro on 1/21/13.
//  Copyright (c) 2013 Fernando Bass. All rights reserved.
//

#import "RootTableViewController.h"
#import "SCSQLite.h"
#import "DetailViewController.h"

@interface RootTableViewController ()
{
    NSArray *results;
}
@end

@implementation RootTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    results = [SCSQLite selectRowSQL:@"Select * from usuarios"];
    [self.tableView reloadData];
    [super viewWillAppear:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *user = [results objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [user objectForKey:@"name"];
    cell.detailTextLabel.text = [user objectForKey:@"email"];
    
    return cell;
}

#pragma mark - UIStoryBoardSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        detailViewController.user = [results objectAtIndex:indexPath.row];
    }
}

@end
