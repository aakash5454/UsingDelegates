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
NSMutableDictionary *tempD;
@implementation addViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    tempD = [[NSMutableDictionary alloc]init];
    self.dictArray = [[NSMutableArray alloc]init];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
   
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

#pragma mark - IBActions
- (IBAction)CancelTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveTapped:(id)sender
{
    
    tempD = [self createAnRemainderDictionarywithName:self.nameTextBox.text withDate:self.dateTextBox.text withDescription:self.
             descriptionTextBox.text andStatus:@"No"];
//    NSLog(@"tempD :%@", tempD);
//    
//    [self.dictArray addObject:tempD];
    NSLog(@"self.dictArray: %@", self.dictArray);
    [self.savingRemainderDelegate addingNameInDictArray:tempD];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
