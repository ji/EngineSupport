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

#import "Parameters.h"

@interface Parameters ()

- (void)loadParameters;
- (ESParameter *)unarchiveParameterWithName:(NSString *)_parameterName;

@end

static Parameters *_instance;


@implementation Parameters

@synthesize parameters;
@synthesize parametersDefinitionFilename;

- (void)setParametersDefinitionFilename:(NSString *)_parametersPlistFilename
{
    [parametersDefinitionFilename release];
    parametersDefinitionFilename = _parametersPlistFilename;
    [parametersDefinitionFilename retain];
    
    [self loadParameters];
}


#pragma mark - Singleton Methods

+ (Parameters *)sharedInstance
{
	@synchronized(self) {
		
        if (_instance == nil) {
			
            _instance = [[self alloc] init];
            
            // Allocate/initialize any member variables of the singleton class here
            // example
			//_instance.member = @"";
        }
    }
    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone
{	
    @synchronized(self) {
		
        if (_instance == nil) {
			
            _instance = [super allocWithZone:zone];			
            return _instance;  // assignment and return on first allocation
        }
    }
	
    return nil; //on subsequent allocation attempts return nil	
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

- (id)retain
{	
    return self;	
}

- (unsigned)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;	
}

- (ESParameter *)parameterWithName:(NSString *)_parameterName
{
    return [self.parameters valueForKey:_parameterName];
}

- (id)valueForParameterWithName:(NSString *)_parameterName
{
    return [self parameterWithName:_parameterName].parameterValue;
}


#pragma mark - Private category methods ().

- (void)loadParameters
{
    self.parameters = [NSMutableDictionary dictionaryWithCapacity:0];
    
    NSString *definitionsFilePath = [[NSBundle mainBundle] pathForResource:self.parametersDefinitionFilename ofType:nil];
    NSDictionary *parameterDefinitions = [NSDictionary dictionaryWithContentsOfFile:definitionsFilePath];
    
    for (NSString *parameterName in [parameterDefinitions allKeys]) {
        NSString *parameterPath = [[ESUtilities parametersDirectory] stringByAppendingPathComponent:parameterName];
        ESParameter *parameter  = nil;
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:parameterPath]) {
            // If the parameter does not exist in the archiving path, create an instance and archive it.
            parameter = [ESParameter parameterWithDictionary:[parameterDefinitions objectForKey:parameterName]];
            [self archiveParameter:parameter withName:parameterName];
        } else {
            // The parameter already exists and needs to be unarchived.
            parameter = [self unarchiveParameterWithName:parameterName];            
        }
        
        if (nil != parameter) {
            // Finally add the parameter to our parameters.
            [self.parameters setObject:parameter forKey:parameterName];
        }
    }
}

- (void)archiveParameter:(ESParameter *)_parameter withName:(NSString *)_parameterName
{
    NSString *archivePath = [ESUtilities archivePathForParameterName:_parameterName];
    
    if (nil == _parameter.parameterIdentifier) {
        // If this is the first time, the parameter is being archived, set the parameter identifier to
        // the key name of the parameter (the key name being the key, the parameter is responding to in
        // the parameters definition property list). Otherwise the parameter would not have the right
        // path to be archived to.
        _parameter.parameterIdentifier = _parameterName;
    }
    
    [NSKeyedArchiver archiveRootObject:_parameter toFile:archivePath];
}

- (ESParameter *)unarchiveParameterWithName:(NSString *)_parameterName
{
    NSString *archivePath = [ESUtilities archivePathForParameterName:_parameterName];
    
    ESParameter *param = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
    
    return param;
}


@end
