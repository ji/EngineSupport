//
//  NSFileManager+Paths.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 29.04.11
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Paths)

- (NSString *)cachePathWithDirectory:(NSString *)_directory
                            fileName:(NSString *)_fileName 
                           extension:(NSString *)_extension;

- (NSString *)cachePathWithDirectory:(NSString *)_directory;

- (NSString *)cachePathWithDirectory:(NSString *)_directory 
                            fileName:(NSString *)_fileName;

- (NSString *)documentPathWithDirectory:(NSString *)_directory;

- (NSString *)documentPathWithDirectory:(NSString *)_directoryName
                               fileName:(NSString *)_fileName;

- (NSString *)documentPathWithDirectory:(NSString *)_directory
                               fileName:(NSString *)_fileName 
                              extension:(NSString *)_extension;

- (NSString *)uniqueTemporaryFile;

@end
