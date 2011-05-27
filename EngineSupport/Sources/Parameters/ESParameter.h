//
//  ESParameter.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 5/17/11.
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

@interface ESParameter : NSObject <NSCoding> {
    NSMutableDictionary *parameterDictionary;
    NSString *parameterIdentifier;
}

@property (nonatomic, retain) NSMutableDictionary *parameterDictionary;

@property (nonatomic, readonly) ParameterType parameterType;
@property (nonatomic, readonly) NSString *parameterName;
@property (nonatomic, assign)   id parameterValue;
@property (nonatomic, readonly) NSString *parameterDescription;
@property (nonatomic, retain) NSString *parameterIdentifier;

+ (ESParameter *)parameterWithDictionary:(NSDictionary *)_dictionary;

@end
