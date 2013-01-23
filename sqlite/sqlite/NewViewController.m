//
//  NewViewController.m
//  sqlite
//
//  Created by Fernando Ribeiro on 1/21/13.
//  Copyright (c) 2013 Fernando Bass. All rights reserved.
//

#import "NewViewController.h"
#import "SCSQLite.h"

@interface NewViewController ()
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
- (IBAction)save:(id)sender;

@end

@implementation NewViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    BOOL isSave = [SCSQLite executeSQL:@"insert into usuarios (name, email) values ('%@', '%@')", self.nameTextField.text, self.emailTextField.text];
    
    if (isSave) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro..." message:@"Erro ao salvar registro" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alert show];
    }
    
}
@end




