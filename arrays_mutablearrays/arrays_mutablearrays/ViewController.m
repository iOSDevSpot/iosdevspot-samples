//
//  ViewController.m
//  arrays_mutablearrays
//
//  Created by Fernando Ribeiro on 11/6/12.
//  Copyright (c) 2012 Fernando Bass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSArray *frutas = [[NSArray alloc] initWithObjects:@"Maca",@"Goiaba",@"Abacaxi",@"Limao", nil];
    NSLog(@"%@", [frutas objectAtIndex:2]);
    
    NSLog(@"Quantidade de frutas %u", frutas.count);
    
    
    NSArray *iDevices = @[@"iPhone", @"iPad", @"iMac"];
    
    NSLog(@"%@", iDevices);
    NSLog(@"%@", [iDevices objectAtIndex:1]);
    NSLog(@"%u", iDevices.count);
    
    NSMutableArray *carros = [NSMutableArray array];
    
    [carros addObject:@"Corolla"];
    [carros addObject:@"Fusca"];
    [carros addObject:@"Vectra"];
    [carros addObject:@"Golf"];
    
    
    NSLog(@"%@", carros);
    
    [carros removeObjectAtIndex:2];
    [carros insertObject:@"Omega" atIndex:2];
    
    NSLog(@"%@", carros);
    
    NSLog(@"Quantidade de carros %u", carros.count);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
