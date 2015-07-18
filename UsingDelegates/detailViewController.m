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
#import "savingRemainderProtocol.h"
#import "Remainder.h"

@interface detailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *namesTextbox;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextbox;

- (IBAction)cancelButtonTapped:(id)sender;

@end

@implementation detailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData:self.myIndexPath.row];
}

-(void)loadData: (NSInteger) fromIndexPath
{
    self.remainder = [self.dictArray objectAtIndex:fromIndexPath];
    self.namesTextbox.text = self.remainder.name;
    self.descriptionTextbox.text = self.remainder.date;
}

- (IBAction)completeButtonTapped:(id)sender
{
    self.remainder = [self.dictArray objectAtIndex:self.myIndexPath.row];
    self.remainder.status = @"YES";
    [self.dictArray replaceObjectAtIndex:self.myIndexPath.row withObject:self.remainder];
    [self.savingRemainderDelegate addingCheckMark:self.dictArray];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
