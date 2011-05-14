//
//  Parameters.m
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "Parameters.h"

@interface Parameters ()

- (void)loadParametersFromFile:(NSString *)_filename;
- (void)saveParametersToFile:(NSString *)_filename;

@end

static Parameters *_instance;
@implementation Parameters


@synthesize parameters;
@synthesize parametersPlistFilename;

- (void)setParametersPlistFilename:(NSString *)_parametersPlistFilename
{
    [parametersPlistFilename release];
    parametersPlistFilename = _parametersPlistFilename;
    [parametersPlistFilename retain];
    
    [self loadParametersFromFile:self.parametersPlistFilename];
}

#pragma mark -
#pragma mark Singleton Methods

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

- (void)saveParameters
{
    [self saveParametersToFile:self.parametersPlistFilename];
}

- (NSMutableDictionary *)parameterWithName:(NSString *)_parameterName
{
    return [self.parameters valueForKey:_parameterName];
}

- (id)valueForParameterWithName:(NSString *)_parameterName
{
    return [[self parameterWithName:_parameterName] parameterValue];
}

#pragma mark - Private category methods ().

- (void)loadParametersFromFile:(NSString *)_filename
{
    NSString *parametersPlistFile = [Utilities parametersPlistPathForFilename:_filename];
    self.parameters = [NSMutableDictionary dictionaryWithContentsOfFile:parametersPlistFile];
}

- (void)saveParametersToFile:(NSString *)_filename
{
    [self.parameters writeToFile:[Utilities parametersPlistPath] atomically:YES];
}

@end
