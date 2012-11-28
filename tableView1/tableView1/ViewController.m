//
//  ViewController.m
//  tableView1
//
//  Created by Fernando Ribeiro on 11/27/12.
//  Copyright (c) 2012 Fernando Bass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *carros;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    carros = @[@"Gol", @"Fusca", @"Opala", @"Civic", @"Corolla", @"Ferrari"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return carros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [carros objectAtIndex:indexPath.row];
    
    return cell;
}

@end





