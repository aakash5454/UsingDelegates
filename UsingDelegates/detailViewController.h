//
//  detailViewController.h
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "savingRemainderProtocol.h"
#import "Remainder.h"

@interface detailViewController : UIViewController

@property (nonatomic, weak) id<savingRemainderProtocol>  savingRemainderDelegate;
@property (nonatomic, strong) NSMutableArray *dictArray;
@property (nonatomic, strong) NSIndexPath *myIndexPath;
@property (nonatomic, strong) Remainder *remainder;

@end
