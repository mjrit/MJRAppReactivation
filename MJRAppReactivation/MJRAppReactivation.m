//
//  MJRAppReactivation.m
//  MJRAppReactivation
//
//  Created by Matt Robertson on 15-Jul-2012.
//

#import "MJRAppReactivation.h"

@implementation MJRAppReactivation

@synthesize previousActiveApplication = _previousActiveApplication;
@synthesize isObserving = _isObserving;


__strong static id _sharedIntance = nil;


+(MJRAppReactivation*)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedIntance = [[self alloc] init];
    });
    
    return _sharedIntance;
}

- (void)dealloc
{
    [self stopObservingDeactivations];
}

-(void)startObservingDeactivations {
    if (!_isObserving) {
        [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                                                               selector:@selector(anyApplicationDeactivated:)
                                                                   name:NSWorkspaceDidDeactivateApplicationNotification
                                                                 object:nil];
    }
    _isObserving = YES;
}

-(void)stopObservingDeactivations {
    if (_isObserving) {
        [[[NSWorkspace sharedWorkspace] notificationCenter] removeObserver:self
                                                                      name:NSWorkspaceDidDeactivateApplicationNotification
                                                                    object:nil];
        _previousActiveApplication = nil;
        _isObserving = NO;
    }
}

// Called when any running application deactivates
-(void)anyApplicationDeactivated:(NSNotification*) notification {
    NSRunningApplication* app = [notification.userInfo valueForKey:NSWorkspaceApplicationKey];
    _previousActiveApplication = app;

#ifdef DEBUG
    NSLog(@"App deactivated: %@", app.localizedName);
#endif
}

-(BOOL)activatePreviousActiveApplication {
    BOOL success = NO;
    if (_previousActiveApplication != nil &&
        ![[_previousActiveApplication bundleIdentifier] isEqualTo:[[NSBundle mainBundle] bundleIdentifier]]) {
            success = [_previousActiveApplication activateWithOptions:0];
    }
    return success;
}

@end
