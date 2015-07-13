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

@end

static NSIndexPath *indexPath;
@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData:0];
}

-(void)loadData: (id) sender
{
    indexPath = (NSIndexPath*) sender;
    self.namesTextbox.text = self.namesArray[indexPath.row];
}
- (IBAction)completeButtonTapped:(id)sender
{
    [self.remainderCompletionDelegate addingCheckMark:self.namesArray[indexPath.row]];
    [self dismissViewControllerAnimated:YES completion:nil];
        
}

@end
