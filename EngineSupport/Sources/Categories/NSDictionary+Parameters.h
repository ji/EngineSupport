//
//  NSDictionary+Parameters.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KEY_PARAMETER_TYPE          @"Parameters::Key::ParameterType"
#define KEY_PARAMETER_NAME          @"Parameters::Key::ParameterName"
#define KEY_PARAMETER_DESCRIPTION   @"Parameters::Key::ParameterDescription"
#define KEY_PARAMETER_VALUE         @"Parameters::Key::ParameterValue"

typedef enum {
    ParameterTypeBool,
    ParameterTypeNumber,
    ParameterTypeUnknown
} ParameterType;

@interface NSDictionary (Parameters)

- (ParameterType)parameterType;
- (NSString *)parameterName;
- (id)parameterValue;

@end
