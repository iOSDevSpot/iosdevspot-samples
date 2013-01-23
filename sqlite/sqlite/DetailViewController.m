//
//  ViewController.m
//  sqlite
//
//  Created by Fernando Ribeiro on 1/21/13.
//  Copyright (c) 2013 Fernando Bass. All rights reserved.
//

#import "DetailViewController.h"
#import "SCSQLite.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
- (IBAction)delete:(id)sender;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    self.nameLabel.text = [self.user valueForKey:@"name"];
    self.emailLabel.text = [self.user valueForKey:@"email"];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)delete:(id)sender {
    BOOL isDeleted = [SCSQLite executeSQL:@"delete from usuarios where email = '%@'", [self.user valueForKey:@"email"]];
    
    if (isDeleted) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Erro ao deletar registro" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }
}
@end
