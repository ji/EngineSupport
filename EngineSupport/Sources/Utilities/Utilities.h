//
//  Utilities.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RELEASE_AND_NIL(x) [x release], x = nil
#define CALCULATE_TIMER_FOR_FPS(x) 1.0f / x

@interface Utilities : NSObject {
    
}

+ (NSString *)parametersPlistPathForFilename:(NSString *)_filename;
+ (NSString *)parametersPlistPath;

@end
