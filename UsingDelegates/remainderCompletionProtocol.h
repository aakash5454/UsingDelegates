//
//  remainderCompletionProtocol.h
//  UsingDelegates
//
//  Created by Sky on 7/13/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol reminderCompletionProtocol <NSObject>
@required
-(void)addingCheckMark: (NSArray*) items; 
@end
