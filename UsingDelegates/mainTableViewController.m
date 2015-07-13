//
//  mainTableViewController.m
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import "mainTableViewController.h"
#import "detailViewController.h"
#import "addViewController.h"


@interface mainTableViewController ()
@property (nonatomic, strong) NSMutableArray *namesArray;
@end

@implementation mainTableViewController

#pragma mark - Other Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Protocol Methods
-(void)addingNameInNamesArray: (NSMutableArray*) namesArray
{
    self.namesArray = namesArray;
//~~~~~> q:1 How to decide where to reload data? This was like trial and error.
//~~~~>  q:2 how can I access self.tableView in this method? I have as such not declared a table view property.
    [self.tableView reloadData];
    NSLog(@"mainTableVieController self.namesArray:%@", self.namesArray);
}

-(void)addingCheckMark: (NSMutableArray*) items
{
    self.namesArray = items;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"%lu", (unsigned long)self.namesArray.count);
    return self.namesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
   // Configure the cell...
   // NSLog(@"self.namesArray in cell for row at indexpath %@", self.namesArray);
    
    cell.textLabel.text = self.namesArray[indexPath.row];
    cell.detailTextLabel.text = self.dateString;
    return cell;
}

#pragma mark - Table view Delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // ~~~> verify: No need to write this because segue written from story board.
    //[self performSegueWithIdentifier:@"mainToDetailId" sender:nil];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"mainToDetailId"])
    {
        UINavigationController *navVC = (UINavigationController *)segue.destinationViewController;
        detailViewController *detailVC = [navVC.viewControllers firstObject];
        detailVC.namesArray = self.namesArray;
        [detailVC viewDidLoad];
    }
    
    else if ([segue.identifier isEqualToString:@"mainToAddId"])
        {
            UINavigationController *navVC = (UINavigationController *)segue.destinationViewController;
            addViewController *addTVC = [navVC.viewControllers firstObject];
            addTVC.savingRemainderDelegate = self;
        }
}


@end
