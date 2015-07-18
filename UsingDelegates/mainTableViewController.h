//
//  mainTableViewController.h
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "savingRemainderProtocol.h"
#import "Remainder.h"

@interface mainTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, savingRemainderProtocol>

@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) Remainder *remainder;

@end
