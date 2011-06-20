/*
 * AppController.j
 * Taskboard
 *
 * Created by You on June 18, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "StickyNote.j"
@import "Taskboard.j"
@import "WindowUtils.j"

@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    var taskboard = [[Taskboard alloc] initWithFrame:CGRectMake(0, 0, 1024, 600)];
    [taskboard setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    // [taskboard setCenter:[contentView center]];
    [contentView addSubview:taskboard];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

@end
