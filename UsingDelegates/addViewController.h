//
//  addViewController.h
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "savingRemainderProtocol.h"


@interface addViewController : UIViewController

@property (nonatomic, weak) id<savingRemainderProtocol> savingRemainderDelegate;

@end
