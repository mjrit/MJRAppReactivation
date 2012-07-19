//
//  MJRAppReactivation.h
//  MJRAppReactivation
//
//  Created by Matt Robertson on 15-Jul-2012.
//  Copyright 2012 MJR Information Technology Pty Limited
//
//  Licensed under the Apache License, Version 2.0
//      http://www.apache.org/licenses/LICENSE-2.0
//

#import <Foundation/Foundation.h>

@interface MJRAppReactivation : NSObject

@property BOOL isObserving;
@property (nonatomic, retain) NSRunningApplication* previousActiveApplication;


/**
 * Singleton instance
 */
+(MJRAppReactivation*)sharedInstance;

/**
 * Starts observing NSWorkspaceDidDeactivateApplicationNotification
 * and keeping a reference to the most recently deactivated app (previousActiveApplication).
 */
-(void)startObservingDeactivations;

/**
 * Stops observing app deactivations.
 */
-(void)stopObservingDeactivations;

/*
 * Activates the previousActiveApplication
 *    - if THIS application is currently active, and
 *    - if available
 *
 * Checking this application is active is important, to avoid
 * accidentally switching between 2 other apps.
 *
 * Returns YES if another app was successfully re-activated.
 */
-(BOOL)activatePreviousActiveApplication;

@end
