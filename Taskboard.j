@import <AppKit/CPBox.j>
@import "Task.j"
@import "User.j"
@import "StatusTask.j"


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
        [self addSubview:[[[StatusTaskPanel alloc] init] initWithFrame:CGRectMake(100, 0, 400, 100)]];
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
        var width = CGRectGetWidth([self bounds]),
            height = CGRectGetHeight([self bounds]),
            mainBundle = [CPBundle mainBundle];

        var path = [mainBundle pathForResource:@"title.png"],
            image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(200, 50)],
            imageView = [[CPImageView alloc] initWithFrame:CGRectMake(10, 10, width, height)];

        [imageView setHasShadow:NO];
        [imageView setImageScaling:CPScaleNone];
        var imageSize = [image size];
        [imageView setFrameSize:imageSize];
        [imageView setImage:image];
        [self addSubview:imageView];
        
        var titleView = [[CPBox alloc] initWithFrame:CGRectMake(0,0,CGRectGetWidth([self bounds]),100)];
        [titleView setBorderType:CPLineBorder];
        [titleView setBorderColor:[CPColor lightGrayColor]];
        [self addSubview:titleView];

        var titleTextField = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,100,40)];
        [titleTextField setStringValue:title];
        [titleTextField setEditable:NO];
        [titleTextField setFont:[CPFont systemFontOfSize:14.0]];
        [titleTextField sizeToFit];

        [titleTextField setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [titleTextField setCenter:[titleView center]];
        [titleView addSubview:titleTextField];

		[self registerForDraggedTypes:[CPArray arrayWithObject:[StickyNoteDragType]]];
        //TODO Melisa: agregar logicamente segun tamaños
        
        var stickyBounds = width/3,
            stickyNote1 = [[StickyNote alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([titleView bounds]), stickyBounds, stickyBounds)],
            stickyNote2 = [[StickyNote alloc] initWithFrame:CGRectMake(CGRectGetWidth([stickyNote1 bounds]), CGRectGetHeight([titleView bounds]), stickyBounds, stickyBounds)],
            stickyNote3 = [[StickyNote alloc] initWithFrame:CGRectMake(CGRectGetWidth([stickyNote1 bounds]) * 2, CGRectGetHeight([titleView bounds]), stickyBounds, stickyBounds)];
        [self addSubview:stickyNote1];
        [self addSubview:stickyNote2];
        [self addSubview:stickyNote3];
    }
    return self;
}
- (void)performDragOperation:(CPDraggingInfo)aSender
{
	CPLog.trace("performDragOperatio");
    /*var taskView = [CPKeyedUnarchiver unarchiveObjectWithData:[[aSender draggingPasteboard] dataForType:StickyNoteDragType]],
        location = [self convertPoint:[aSender draggingLocation] fromView:nil];
    
    [taskView setFrameOrigin:CGPointMake(location.x - CGRectGetWidth([furnitureView frame]) / 2.0, location.y - CGRectGetHeight([furnitureView frame]) / 2.0)];
    
    [self addFurnitureView:taskView];
*/
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
        // [self setBackgroundColor:[CPColor whiteColor]];
        var width = CGRectGetWidth([self bounds]) / 3,
            height = CGRectGetHeight([self bounds]);
        
        // notStartedColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(0,0,width,height) title:"NOT STARTED"];
        // [self addSubview:notStartedColumn];
        // inProgressColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(width,0,width,height) title:"IN PROGRESS"];
        // [self addSubview:inProgressColumn];
        // finishedColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(width + width,0,width,height) title:"FINISHED"];
        // [self addSubview:finishedColumn];
    }
    return self;
}

- (void)drawRect:(CPRect)aRect
{
    var bounds = [self bounds],
        context = [[CPGraphicsContext currentContext] graphicsPort],
        width = CGRectGetWidth(bounds)/3,
        height = CGRectGetHeight(bounds);

        CGContextSetLineWidth(context, 3);
        CGContextStrokeLineSegments(context, 
                                    [CGPointMake(width, 0),
                                            CGPointMake(width, height),
                                        CGPointMake(width + width, 0),
                                            CGPointMake(width + width, height)],
                                    4);
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

@implementation StatusTaskPanel : CPBox
{
}
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setBackgroundColor:[CPColor yellowColor]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(2, 2, 96, 46) status:"PLEASE \n TEST" color:[CPColor blueColor]] 
                                       withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(100, 2, 96, 46) status:"PLEASE \n ANALYSE" color:[CPColor redColor]]
                                       withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(2, 50, 96, 46) status:"DONE" color:[CPColor yellowColor]]
                                       withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(100, 50, 96, 46) status:"BLOCKED" color:[CPColor lightGrayColor]]
                                       withWeight:CPLightShadow]];
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
