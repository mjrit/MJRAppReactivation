//
//  MJRAppReactivation.h
//  MJRAppReactivation
//
//  Created by Matt Robertson on 15-Jul-2012.
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
 *    - if available, and
 *    - if the previousActiveApplication is NOT this application
 *
 * Returns YES if another app was successfully re-activated.
 */
-(BOOL)activatePreviousActiveApplication;

@end
