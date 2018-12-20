//
//  PeopleDetailViewController.m
//  JSONDataDemo
//
//  Created by Je Min Son on 12/20/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

#import "PeopleDetailViewController.h"

@interface PeopleDetailViewController ()

@end


@implementation PeopleDetailViewController
@synthesize details;

- (NSString *) name {
    return [NSString stringWithFormat:@"%@ %@", self.details[@"fname"], self.details[@"lname"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self name];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = [self name];
            cell.detailTextLabel.text = @"Name";
            break;
        case 1:
            cell.textLabel.text = self.details[@"phone"];
            cell.detailTextLabel.text = @"Phone";
            break;
        default:
            // Email goes here!
            break;
    }
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

@end
