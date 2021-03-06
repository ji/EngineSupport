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


#import "ESUtilities.h"
#import "NSFileManager+Paths.h"

@implementation ESUtilities

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

+ (NSString *)archivePathForParameterName:(NSString *)_parameterName
{
    NSString *archiveFile = @"parameter.archive";
    
    NSString *path =[[NSFileManager defaultManager] cachePathWithDirectory:@"Parameters"];
    path = [path stringByAppendingPathComponent:_parameterName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
    
    path = [path stringByAppendingPathComponent:archiveFile];
    
    return path;
}

+ (NSString *)parametersDirectory
{
    return [[NSFileManager defaultManager] cachePathWithDirectory:@"Parameters"];
}

@end
