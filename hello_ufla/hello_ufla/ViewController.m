//
//  ViewController.m
//  hello_ufla
//
//  Created by Fernando Ribeiro on 12/12/12.
//  Copyright (c) 2012 Fernando Bass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)helloUFLA {

    
    NSString *message = @"Hello UFLA, Universidade Federal de Labras - MG";
    
    NSLog(@"%@", message);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Atenção" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];

    [alert show];
}

@end
