//
//  Parameters.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>
#import "NSDictionary+Parameters.h"

@interface Parameters : NSObject {
    NSMutableDictionary *parameters;
}

+ (Parameters*)sharedInstance;

- (void)saveParameters;
- (NSMutableDictionary *)parameterWithName:(NSString *)_parameterName;
- (id)valueForParameterWithName:(NSString *)_parameterName;

@property (nonatomic, retain) NSMutableDictionary   *parameters;
@property (nonatomic, retain) NSString  *parametersPlistFilename;

@end
