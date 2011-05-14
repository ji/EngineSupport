//
//  Utilities.m
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Utilities.h"
#import "NSFileManager+Paths.h"

@implementation Utilities

+ (NSString *)parametersPlistPathForFilename:(NSString *)_filename
{
    NSString *parametersFile = [@"Parameters" stringByAppendingPathComponent:_filename];
    NSString *parametersFilePath = [[NSFileManager defaultManager] cachePathWithDirectory:@""];
    
    parametersFilePath = [parametersFilePath stringByAppendingString:parametersFile];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:parametersFilePath]) {
        return [[NSBundle mainBundle] pathForResource:_filename ofType:nil];
    }
    
    return parametersFilePath;
}

+ (NSString *)parametersPlistPath
{
    return [[NSFileManager defaultManager] cachePathWithDirectory:@"Parameters"];
}

@end
