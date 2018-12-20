//
//  ViewController.m
//  JSONDataDemo
//
//  Created by Je Min Son on 12/20/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

#import "HomeViewController.h"
#import "PeopleDetailViewController.h"

#define JSON_FILE_URL @"https://raw.githubusercontent.com/Binpress/learn-objective-c-in-24-Days/master/Working%20With%20Web%20Data/JSONRead.json"

@interface HomeViewController ()
@property (strong, nonatomic) NSArray *names;
@property (strong, nonatomic) NSArray *data;
@end

@implementation HomeViewController
@synthesize names;
@synthesize data;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"JSON Reader";
    
    
    // Download JSON
    NSURL *JSONUrl = [NSURL URLWithString:JSON_FILE_URL];
    NSData *JSONData = [NSData dataWithContentsOfURL:JSONUrl];
    
    // Parse JSON
    NSArray *jsonResult = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:nil];
    self.data = jsonResult;
    NSMutableArray *_names = [NSMutableArray array];
    
    for (id item in jsonResult) {
        [_names addObject:[NSString stringWithFormat:@"%@ %@", item[@"fname"], item[@"lname"]]];
    }
    self.names = _names;
}

#pragma mark - Table view data souce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CellIndentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    
    cell.textLabel.text = self.names[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PeopleDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PeopleDetailViewController"];

    detailViewController.details = self.data[indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:NO];
}

@end


