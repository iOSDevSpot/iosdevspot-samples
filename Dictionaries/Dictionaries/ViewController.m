//
//  ViewController.m
//  Dictionaries
//
//  Created by Fernando Ribeiro on 11/13/12.
//  Copyright (c) 2012 Fernando Bass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
//    NSDictionary *pessoa = [[NSDictionary alloc] initWithObjectsAndKeys:@"Fernando",@"nome",@"26",@"idade", nil];
    
    NSDictionary *pessoa = @{@"nome" : @"Fernando", @"idade" : @"26"};
    
    NSLog(@"%@", pessoa);
    NSLog(@"%@", [pessoa objectForKey:@"nome"]);
    
    NSMutableDictionary *carro = [NSMutableDictionary dictionary];
    [carro setValue:@"Gol" forKey:@"Modelo"];
    [carro setValue:@"VW" forKey:@"Marca"];
    
    NSLog(@"%@", carro);
    NSLog(@"%@", [carro objectForKey:@"Marca"]);
    
    [carro setValue:@"1.6" forKey:@"Potencia"];
    
    NSLog(@"%@", carro);
    
    [carro removeObjectForKey:@"Marca"];
    
    NSLog(@"%@", carro);    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
