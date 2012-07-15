MJRAppReactivation
==================

Singleton application deactivation observer allowing reactivation of previously active apps.

The motiviation for this class was an app I'm working on that has an NSStatusItem menu.
After the app is activated and the user completes an action, I want the user's original application to be reactivated.

The MJRAppReactivation class is a singleton that can be started/stopped. It will observe NSWorkspace NSWorkspaceDidDeactivateApplicationNotification and keep a reference to the most recently deactivated application.

To reactivate the previously active application, use

    activatePreviousActiveApplication:

This should be safe to call at any time. If no previously active application is referenced yet, or if the last deactivation was the current application itself, nothing will happen (returns NO). If YES is returned, another application has been successfully activated.

The included AppDelegate and nib demonstrate MJRAppReactivation usage.

Matt Robertson
15-Jul-2012
