//
//  ESParameter.m
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

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
