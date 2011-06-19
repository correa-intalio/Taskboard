@import <AppKit/CPBox.j>
@import "Task.j"
@import "User.j"


@implementation Taskboard : CPBox
{
    CPMutableArray userList @accessors;
}


- (id)initWithFrame:(CGRect)aFrame
{
    CPLog.trace("Creating a new " + [self class] + " CGRect(" + aFrame.origin.x + "," + aFrame.origin.y + "," + aFrame.size.width + "," + aFrame.size.height + ")");
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = [[self bounds].size.width],
            height = [[self bounds].size.height];
            
            
        [self setBorderType:CPLineBorder];
        [self setBorderColor:[CPColor lightGrayColor]];

        userList = [self createMockUserList];
        // var label = [[StickyNote alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        
        var toolbar = [[TaskboardToolBar alloc] initWithFrame:CGRectMake(1,1,CGRectGetWidth([self bounds]) - 2,100)];
        [self addSubview:toolbar];
        
        var navigationArea = [[TaskboardNavigationArea alloc] initWithFrame:CGRectMake(1,CGRectGetHeight([toolbar bounds]),100,CGRectGetHeight([self bounds]))];
        [navigationArea setAutoresizingMask:CPViewHeightSizable | CPViewMaxXMargin];
        [self addSubview:navigationArea];
        
        var blackboard = [[Blackboard alloc] initWithFrame:CGRectMake(CGRectGetWidth([navigationArea bounds]),
                                                                                 CGRectGetHeight([toolbar bounds]),
                                                                                 CGRectGetWidth([self bounds]) - CGRectGetWidth([navigationArea bounds]),
                                                                                 CGRectGetHeight([self bounds]))];
        [blackboard setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        [self addSubview:blackboard];

    }
    return self;
}

- (CPMutableArray)createMockUserList
{
    return [CPMutableArray arrayWithArray:[[User userWithName:"Diego" taskList:[CPMutableArray arrayWithArray:[]]]]];
}

@end

@implementation TaskboardToolBar : CPBox
{
}
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
    }
    return self;
}

- (void)drawRect:(CPRect)aRect
{
    [super drawRect:aRect];
    var context = [[CPGraphicsContext currentContext] graphicsPort],
        bounds = [self bounds],
        sides = [CPMinYEdge, CPMaxYEdge, CPMinXEdge, CPMaxXEdge],
        colors = [[CPColor whiteColor], [CPColor grayColor], [CPColor whiteColor], [CPColor whiteColor]],
        innerRect = CPDrawColorTiledRects(bounds, bounds, sides, colors);  

    CGContextSetFillColor(context, [CPColor whiteColor]);
    CGContextFillRect(context, innerRect);
}

@end

@implementation TaskboardColumn : CPBox
{
    CPString title @accessors;
}
- (id)initWithFrame:(CGRect)aFrame title:(CPString)aTitle
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        title = aTitle;
        [self setBackgroundColor:[CPColor whiteColor]];
        var titleView = [[CPBox alloc] initWithFrame:CGRectMake(0,0,CGRectGetWidth([self bounds]),100)];
        [titleView setBorderType:CPLineBorder];
        [titleView setBorderColor:[CPColor redColor]];
        [self addSubview:titleView];

        var titleTextField = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,100,40)];
        [titleTextField setStringValue:title];
        [titleTextField setEditable:NO];
        [titleTextField setFont:[CPFont systemFontOfSize:14.0]];
        [titleTextField sizeToFit];

        [titleTextField setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [titleTextField setCenter:[titleView center]];

        [titleView addSubview:titleTextField];
    }
    return self;
}
@end

@implementation Blackboard : CPBox
{
    TaskboardColumn notStartedColumn @accessors;
    TaskboardColumn inProgressColumn @accessors;
    TaskboardColumn finishedColumn @accessors;
}
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setBackgroundColor:[CPColor lightGrayColor]];
        var width = CGRectGetWidth([self bounds]) / 3,
            height = CGRectGetHeight([self bounds]);
        
        notStartedColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(0,0,width,height) title:"NOT STARTED"];
        [self addSubview:notStartedColumn];
        inProgressColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(width,0,width,height) title:"IN PROGRESS"];
        [self addSubview:inProgressColumn];
        finishedColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(width + width,0,width,height) title:"FINISHED"];
        [self addSubview:finishedColumn];
    }
    return self;
}
@end

@implementation TaskboardNavigationArea : CPBox
{
}
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setBackgroundColor:[CPColor blueColor]];
        
    }
    return self;
}
@end

@implementation TaskboardMetadataArea : CPBox
{
}
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setBackgroundColor:[CPColor yellowColor]];
        
    }
    return self;
}
@end
