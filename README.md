MJRAppReactivation
==================

Cocoa/Objective-C singleton allowing reactivation of previously active apps.

This code is free to use under the terms of the Apache License, Version 2.0.

    http://www.apache.org/licenses/LICENSE-2.0

The motiviation for the MJRAppReactivation class was an app I'm working on that has an NSStatusItem menu.
After the app is activated and the user completes an action, the user's original application should be reactivated.

The class is a singleton that can be started/stopped. It will observe the NSWorkspace notification _NSWorkspaceDidDeactivateApplicationNotification_ and keep a reference to the most recently deactivated application. To start observing, use:

    [[MJRAppReactivation sharedInstance] startObservingDeactivations];


If your app has (or may have) been activated, then to reactivate the previously active application, use

    activatePreviousActiveApplication

This should be safe to call at any time. If no previously active application is referenced yet, or if the last deactivation was the current application itself, nothing will happen (returns NO). If YES is returned, another application has been successfully activated.

The included AppDelegate and nib demonstrate MJRAppReactivation usage, just open and run the project.

Matt Robertson
15-Jul-2012
