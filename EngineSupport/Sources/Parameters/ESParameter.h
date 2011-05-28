/************************************************************************************
 * Copyright (C) <2011> by <Yovoslav Ivanov>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ************************************************************************************/

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

typedef void(^UpdateOnParameterChange)(id _parameterValue);

@interface ESParameter : NSObject <NSCoding> {
    NSMutableDictionary *parameterDictionary;
    NSString *parameterIdentifier;
    
    UpdateOnParameterChange updater;
}

@property (nonatomic, retain) NSMutableDictionary *parameterDictionary;

@property (nonatomic, readonly) ParameterType parameterType;
@property (nonatomic, readonly) NSString *parameterName;
@property (nonatomic, assign)   id parameterValue;
@property (nonatomic, readonly) NSString *parameterDescription;
@property (nonatomic, retain) NSString *parameterIdentifier;
@property (nonatomic, assign) UpdateOnParameterChange updater;

+ (ESParameter *)parameterWithDictionary:(NSDictionary *)_dictionary;

@end
