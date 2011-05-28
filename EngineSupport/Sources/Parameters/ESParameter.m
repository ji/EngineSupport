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

#import "ESParameter.h"

#define ES_PARAMETER_DICTIONARY @"parameterDictionary"
#define ES_PARAMETER_IDENTIFIER @"parameterIdentifier"

@implementation ESParameter

@synthesize parameterDictionary;
@synthesize parameterType;
@synthesize parameterName;
@synthesize parameterValue;
@synthesize parameterDescription;
@synthesize parameterIdentifier;
@synthesize updater;

- (ParameterType)parameterType
{
    return [[self.parameterDictionary valueForKey:KEY_PARAMETER_TYPE] intValue];
}

- (NSString *)parameterName
{
    return [self.parameterDictionary valueForKey:KEY_PARAMETER_NAME];
}

- (id)parameterValue
{
    return [self.parameterDictionary valueForKey:KEY_PARAMETER_VALUE];
}

- (void)setParameterValue:(id)_parameterValue
{
    [self.parameterDictionary setValue:_parameterValue forKey:KEY_PARAMETER_VALUE];
    [[Parameters sharedInstance] archiveParameter:self withName:self.parameterIdentifier];
    self.updater(self.parameterValue);
}

- (NSString *)parameterDescription
{
    return [self.parameterDictionary valueForKey:KEY_PARAMETER_DESCRIPTION];
}


+ (ESParameter *)parameterWithDictionary:(NSDictionary *)_dictionary
{
    ESParameter *param = [[ESParameter alloc] init];
    param.parameterDictionary = [NSMutableDictionary dictionaryWithDictionary:_dictionary];
    
    return [param autorelease];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:parameterDictionary forKey:ES_PARAMETER_DICTIONARY];
    [aCoder encodeObject:parameterIdentifier forKey:ES_PARAMETER_IDENTIFIER];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (nil != self) {
        self.parameterDictionary = [aDecoder decodeObjectForKey:ES_PARAMETER_DICTIONARY];
        self.parameterIdentifier = [aDecoder decodeObjectForKey:ES_PARAMETER_IDENTIFIER];
    }
    
    return self;
}



@end
