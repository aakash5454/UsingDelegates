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
NSIndexPath *ClickedindexPath;
@implementation mainTableViewController

#pragma mark - Other Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dictArray = [[NSMutableArray alloc]init];
}

#pragma mark - Protocol Methods
-(void)addingNameInDictArray:(Remainder*)remainder
{
    [self.dictArray addObject:remainder];
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
    return self.dictArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    self.remainder = [self.dictArray objectAtIndex:indexPath.row];
    if ([self.remainder.status isEqualToString:@"YES"])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    cell.textLabel.text = self.remainder.name;
    cell.detailTextLabel.text = self.remainder.date;
    return cell;
}

#pragma mark - Table view Delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Done from StoryBoard
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"mainToDetailId"])
    {
        UITableViewCell *cell = (UITableViewCell*) sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        NSLog(@"%@",indexPath.description);
        UINavigationController *navVC = (UINavigationController *)segue.destinationViewController;
        detailViewController *detailVC = [navVC.viewControllers firstObject];
        detailVC.dictArray = self.dictArray;
        detailVC.myIndexPath = indexPath;

        detailVC.remainder = self.remainder;
        detailVC.savingRemainderDelegate = self;  // Q: //Who is delagating who?
    }
    else if ([segue.identifier isEqualToString:@"mainToAddId"])
    {
        UINavigationController *navVC = (UINavigationController *)segue.destinationViewController;
        addViewController *addTVC = [navVC.viewControllers firstObject];
        addTVC.savingRemainderDelegate = self;
    }
}

@end
