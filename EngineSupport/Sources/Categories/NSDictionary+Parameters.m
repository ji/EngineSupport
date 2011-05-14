//
//  NSDictionary+Parameters.m
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+Parameters.h"

@implementation NSDictionary (Parameters)

- (ParameterType)parameterType
{
    return [[self valueForKey:KEY_PARAMETER_TYPE] intValue];
}

- (NSString *)parameterName
{
    return [self valueForKey:KEY_PARAMETER_NAME];
}

- (id)parameterValue
{
    return [self valueForKey:KEY_PARAMETER_VALUE];
}

@end
