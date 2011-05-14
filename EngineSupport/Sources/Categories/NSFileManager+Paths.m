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

#import "NSFileManager+Paths.h"

@implementation NSFileManager (Paths)

- (NSString *)pathWithSearchPath:(NSSearchPathDirectory)searchPath 
                       directory:(NSString *)directory 
                        fileName:(NSString *)fileName
{
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(searchPath, NSUserDomainMask, YES);
    NSString *path  = [[paths objectAtIndex:0] stringByAppendingPathComponent:directory];
    
    if (![self fileExistsAtPath:path]) {
        [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    if (fileName != nil) {
        path = [path stringByAppendingPathComponent:fileName];
    }
    
    return path;
}

- (NSString *)cachePathWithDirectory:(NSString *)_directory
{
    return [self cachePathWithDirectory:_directory fileName:nil extension:nil];
}

- (NSString *)cachePathWithDirectory:(NSString *)_directory 
                            fileName:(NSString *)_fileName 
                           extension:(NSString *)_extension
{
    NSString *fullFilename;
    if (_fileName == nil && _extension == nil) {
        fullFilename = nil;
    } else {
        fullFilename = [NSString stringWithFormat:@"%@.%@", _fileName, _extension];
    }
    
    return [self cachePathWithDirectory:_directory fileName:fullFilename];
}

- (NSString *)cachePathWithDirectory:(NSString *)_directory 
                            fileName:(NSString *)_fileName
{
    return [self pathWithSearchPath:NSCachesDirectory directory:_directory fileName:_fileName];
}

- (NSString *)documentPathWithDirectory:(NSString *)_directory
{
    return [self documentPathWithDirectory:_directory fileName:nil extension:nil];
}

- (NSString *)documentPathWithDirectory:(NSString *)_directory 
                               fileName:(NSString *)_fileName 
                              extension:(NSString *)_extension
{
    NSString *fullFilename;
    if (_fileName == nil && _extension == nil) {
        fullFilename = nil;
    } else {
        fullFilename = [NSString stringWithFormat:@"%@.%@", _fileName, _extension];
    }
    
    return [self documentPathWithDirectory:_directory fileName:fullFilename];
}

- (NSString *)documentPathWithDirectory:(NSString *)_directoryName 
                               fileName:(NSString *)_fileName
{
    return [self pathWithSearchPath:NSDocumentDirectory directory:_directoryName fileName:_fileName];
}

- (NSString *)uniqueTemporaryFile
{
    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.temp", guid]];
    
    return path;
}

@end
