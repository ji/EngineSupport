//
//  NSFileManager+Paths.m
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 29.04.11
//

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
