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
@property (nonatomic, strong) NSMutableArray *dictArray;
@end

@implementation mainTableViewController

#pragma mark - Other Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Protocol Methods
-(void)addingNameInDictArray: (NSMutableArray*) dictArray
{
    self.dictArray = dictArray;
    [self.tableView reloadData];
    NSLog(@"mainTableVieController self.dictArray:%@", self.dictArray);
}

-(void)addingCheckMark: (NSMutableArray*) items
{
    self.dictArray = items;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // NSLog(@" self.dictArray.count %@",self.dictArray);
    return self.dictArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSMutableDictionary *tempD = [[NSMutableDictionary alloc]init];
    tempD = [self.dictArray objectAtIndex:indexPath.row];
    
    if ([[tempD objectForKey:@"status"] isEqualToString:@"YES"])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    cell.textLabel.text = [tempD objectForKey:@"name"];
    cell.detailTextLabel.text = [tempD objectForKey:@"date"];

    return cell;
}

#pragma mark - Table view Delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"mainToDetailId"])
    {
        UINavigationController *navVC = (UINavigationController *)segue.destinationViewController;
        detailViewController *detailVC = [navVC.viewControllers firstObject];
        detailVC.dictArray = self.dictArray;
        detailVC.reminderCompletionDelegate = self;
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
