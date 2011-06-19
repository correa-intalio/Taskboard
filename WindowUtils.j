@import <Foundation/CPObject.j>
@import <AppKit/CPPanel.j>

/*!
*   WindowUtils. 
*
*           Utils messages for manage windows   
*/
@implementation WindowUtils : CPObject
{
}


+ (void)showInHUDPanel:(CPView)aView withFrame:(CGRect)aFrame
{
    var HUDPanel = [[CPPanel alloc]
        initWithContentRect:aFrame
        styleMask: CPHUDBackgroundWindowMask | CPClosableWindowMask | CPResizableWindowMask];

    [[HUDPanel contentView] addSubview:aView];
    [[HUDPanel contentView] setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable ]; 
    
    [HUDPanel setTitle:"For debug..."];
    [HUDPanel setFloatingPanel:YES];

    [HUDPanel orderFront:self];
}
@end