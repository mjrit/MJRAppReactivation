//
//  MJRAppDelegate.h
//  MJRAppDeactivation
//
//  Created by Matt Robertson on 15-Jul-2012.
//

#import <Cocoa/Cocoa.h>

@interface MJRAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

// For test button on window
-(IBAction)activatePreviousActiveApp:(id)sender;

@end
