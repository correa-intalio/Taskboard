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
