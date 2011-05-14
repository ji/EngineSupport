//
//  EngineSupportAppDelegate.h
//  EngineSupport
//
//  Created by Yovoslav Ivanov on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EngineSupportViewController;

@interface EngineSupportAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet EngineSupportViewController *viewController;

@end
