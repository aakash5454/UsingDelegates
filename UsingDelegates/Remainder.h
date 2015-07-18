//
//  Remainder.h
//  UsingDelegates
//
//  Created by Sky on 7/18/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Remainder : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *detailDescription;
@property (strong, nonatomic) NSString *status;

-(instancetype)initRemaniderWithDetails:(NSDictionary*)dictionary;

@end

#import "Remainder.h"