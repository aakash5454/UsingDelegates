//
//  mainTableViewController.h
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "savingRemainderProtocol.h"
#import "remainderCompletionProtocol.h"

//@protocol savingRemainderProtocol;
//@protocol remainderCompletionProtocol;



@interface mainTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, savingRemainderProtocol, reminderCompletionProtocol>


@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) NSString *dateString;

@end
