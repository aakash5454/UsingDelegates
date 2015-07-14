//
//  detailViewController.h
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "remainderCompletionProtocol.h"

@interface detailViewController : UIViewController

@property (nonatomic, weak) id<reminderCompletionProtocol>  reminderCompletionDelegate;
@property (nonatomic, strong) NSMutableArray *dictArray;

@end
