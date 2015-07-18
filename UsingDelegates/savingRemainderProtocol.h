//
//  savingRemainderProtocol.h
//  UsingDelegates
//
//  Created by Sky on 7/11/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Remainder.h"

@protocol savingRemainderProtocol <NSObject>


-(void)addingNameInDictArray:(Remainder*)remainder;

-(void)addingCheckMark: (NSArray*) items;

@end
