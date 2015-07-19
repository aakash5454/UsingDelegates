//
//  Remainder.m
//  UsingDelegates
//
//  Created by Sky on 7/18/15.
//  Copyright (c) 2015 com.sky. All rights reserved.
//

#import "Remainder.h"

@implementation Remainder

-(instancetype)initRemaniderWithDetails:(NSDictionary*)dictionary
{
    self = [super init];
    if (!self)   
    {
        return  nil;
    }
    
        _name = dictionary[@"name"];
        _date = dictionary[@"date"];
        _detailDescription = dictionary[@"description"];
        _status = dictionary[@"status"];
    return self;
}

@end


