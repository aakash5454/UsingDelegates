//
//  detailViewController.m
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//
//
//  //~~~> Q: Ask sir about dealing with indexPath approach?

#import "detailViewController.h"
#import "remainderCompletionProtocol.h"

@interface detailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *namesTextbox;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextbox;

- (IBAction)cancelButtonTapped:(id)sender;
@end

NSMutableDictionary *tempDictionary;
@implementation detailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData:self.myIndexPath.row];
    tempDictionary = [[NSMutableDictionary alloc]init];
}

-(void)loadData: (NSInteger) fromIndexPath
{
    tempDictionary = [self.dictArray objectAtIndex:fromIndexPath];
    self.namesTextbox.text = [tempDictionary objectForKey:@"name"];
    self.descriptionTextbox.text = [tempDictionary objectForKey:@"description"];
}

- (IBAction)completeButtonTapped:(id)sender
{
    tempDictionary = [self.dictArray objectAtIndex:self.myIndexPath.row];
    [tempDictionary setObject:@"YES" forKey:@"status"];
    NSLog(@"the new dict is: %@", tempDictionary);
    [self.dictArray replaceObjectAtIndex:self.myIndexPath.row withObject:tempDictionary];
    [self.reminderCompletionDelegate addingCheckMark:self.dictArray];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
