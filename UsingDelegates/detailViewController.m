//
//  detailViewController.m
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import "detailViewController.h"
#import "remainderCompletionProtocol.h"

@interface detailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *namesTextbox;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextbox;
- (IBAction)cancelButtonTapped:(id)sender;

@end

static NSIndexPath *indexPath;
@implementation detailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData:0];
}

-(void)loadData: (id) sender
{
    indexPath = (NSIndexPath*) sender;
    NSMutableDictionary *tempD = [[NSMutableDictionary alloc]init];
    tempD = [self.dictArray objectAtIndex:indexPath.row];
    self.namesTextbox.text = [tempD objectForKey:@"name"];
    self.descriptionTextbox.text = [tempD objectForKey:@"description"];
}

- (IBAction)completeButtonTapped:(id)sender
{
    NSMutableDictionary *tempD = [[NSMutableDictionary alloc]init];
    tempD = [self.dictArray objectAtIndex:indexPath.row];
    [tempD setObject:@"YES" forKey:@"status"];
    NSLog(@"the new dict is: %@", tempD);
//  [self.dictArray addObject:tempD];
    [self.dictArray replaceObjectAtIndex:indexPath.row withObject:tempD];
    [self.reminderCompletionDelegate addingCheckMark:self.dictArray];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
