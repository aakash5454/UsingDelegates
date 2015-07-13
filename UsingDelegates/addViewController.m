//
//  addViewController.m
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import "addViewController.h"
#import "mainTableViewController.h"

@interface addViewController ()

@property (nonatomic, strong) NSMutableArray *namesArray;

@property (weak, nonatomic) IBOutlet UITextField *nameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *dateTextBox;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextBox;

- (IBAction)CancelTapped:(id)sender;
- (IBAction)saveTapped:(id)sender;

@end

@implementation addViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - IBActions
- (IBAction)CancelTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveTapped:(id)sender
{
    self.namesArray = [[NSMutableArray alloc]init];
    [self.namesArray addObject:self.nameTextBox.text];
    [self.savingRemainderDelegate addingNameInNamesArray:self.namesArray];
    [self dismissViewControllerAnimated:YES completion:nil];
    //~~~> WHy cannot I pass information using classic segues?
    // [self performSegueWithIdentifier:@"mainToAddId" sender:self];
    
}

@end
