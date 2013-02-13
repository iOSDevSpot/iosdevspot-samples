//
//  ViewController.m
//  AppNetwork
//
//  Created by Fernando Ribeiro on 2/5/13.
//  Copyright (c) 2013 Fernando Bass. All rights reserved.
//

#import "TweetsController.h"
#import "AFNetworking.h"
#import "Tweet.h"
#import "DCKeyValueObjectMapping.h"

@interface TweetsController ()
{
    NSArray *tweets;
}
@end

@implementation TweetsController

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://search.twitter.com/search.json?q=iosdevspot"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        tweets = [JSON objectForKey:@"results"];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Falha ao carregar a request %@", [error description]);
    }];
    
    [operation start];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[Tweet class]];
    
    NSDictionary *dic = [tweets objectAtIndex:indexPath.row];
    
    Tweet *tweet = [parser parseDictionary:dic];
    
    cell.textLabel.text = tweet.from_user;
    cell.detailTextLabel.text = tweet.text;
        
    [cell.imageView setImageWithURL:tweet.profile_image_url placeholderImage:[UIImage imageNamed:@"icon.png"]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[Tweet class]];
    
    NSDictionary *dic = [tweets objectAtIndex:indexPath.row];
    
    Tweet *tweet = [parser parseDictionary:dic];
    
    CGSize size = [tweet.text
                   sizeWithFont:[UIFont systemFontOfSize:14]
                   constrainedToSize:CGSizeMake(320, CGFLOAT_MAX)];
    
    return size.height + 44;
}

@end
