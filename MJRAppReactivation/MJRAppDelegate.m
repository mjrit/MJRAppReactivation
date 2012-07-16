//
//  MJRAppDelegate.m
//  MJRAppReactivation
//
//  Created by Matt Robertson on 15-Jul-2012.
//  Copyright 2012 MJR Information Technology Pty Limited
//

#import "MJRAppDelegate.h"
#import "MJRAppReactivation.h"

@implementation MJRAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    //
    // Starts observing application deactivations
    [[MJRAppReactivation sharedInstance] startObservingDeactivations];
}

// For testing purpsoes, click the button to call this and activate the previously active app.
-(void)activatePreviousActiveApp:(id)sender {
    MJRAppReactivation* appReactivation = [MJRAppReactivation sharedInstance];

    NSLog(@"Previous app is: %@", appReactivation.previousActiveApplication.localizedName);

    BOOL success = [appReactivation activatePreviousActiveApplication];

    NSLog(@"Sucessfully activate previous app? %@", (success ? @"YES" : @"NO"));
}

@end
