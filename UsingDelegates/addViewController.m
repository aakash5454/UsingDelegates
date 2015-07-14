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

@property (nonatomic, strong) NSMutableArray *dictArray;

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
    
   // [self.dictArray addObject:[self createAnRemainderDictionarywithName:self.nameTextBox.text withDate:self.dateTextBox.text withDescription:self.descriptionTextBox.text andStatus:status]];
    
}

-(NSMutableDictionary*) createAnRemainderDictionarywithName: (NSString*)name withDate:(NSString*)date withDescription:(NSString*)description andStatus:(NSString*)status
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    
    [dict setObject:name forKey:@"name"];
    [dict setObject:date forKey:@"date"];
    [dict setObject:description forKey:@"description"];
    [dict setObject:status forKey:@"status"];
    
    return dict;
}

-(void) savDataInDictionary
{
    
}
#pragma mark - IBActions
- (IBAction)CancelTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveTapped:(id)sender
{
    NSMutableDictionary *tempD = [[NSMutableDictionary alloc]init];
    tempD = [self createAnRemainderDictionarywithName:self.nameTextBox.text withDate:self.dateTextBox.text withDescription:self.
             descriptionTextBox.text andStatus:@"No"];
    NSLog(@"tempD :%@", tempD);
    
    self.dictArray = [[NSMutableArray alloc]init];
    [self.dictArray addObject:tempD];
    NSLog(@"self.dictArray: %@", self.dictArray);
    
    
    [self.savingRemainderDelegate addingNameInDictArray:self.dictArray];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
