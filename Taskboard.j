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
        
        var toolbar = [[TaskboardToolBar alloc] initWithFrame:CGRectMake(1,1,CGRectGetWidth([self bounds]) - 2,110)];
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
        
        [self addSubview:[[[NewStickyNote alloc] init] initWithFrame:CGRectMake(5, 5, 100, 100)]];
        [self addSubview:[[[StatusTaskPanel alloc] init] initWithFrame:CGRectMake(110, 0, 400, 100)]];
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
    self = [super initWithFrame:CGRectInset(aFrame, 5.0, 5.0)];
    if (self)
    {
        title = aTitle;
        [self setBackgroundColor:[CPColor whiteColor]];
        [self setBorderType:CPNoBorder];
        
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
        [titleView setBorderType:CPNoBorder];
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

    }
    return self;
}

- (void)drawRect:(CPRect)aRect
{
    [super drawRect:aRect];
    var context = [[CPGraphicsContext currentContext] graphicsPort],
        bounds = [self bounds],
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);

        CGContextSetLineWidth(context, 3);
        CGContextStrokeLineSegments(context, 
                                    [CGPointMake(0, height),
                                            CGPointMake(width, height),
                                        CGPointMake(0, height - 1),
                                            CGPointMake(width, height - 1)],
                                    4);

}

- (void)performDragOperation:(CPDraggingInfo)aSender
{
	CPLog.trace("performDragOperation");
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
        [self setDraggingExitedBorder];
        var width = CGRectGetWidth([self bounds]) / 3,
            height = CGRectGetHeight([self bounds]);
        
        
        notStartedColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(0,0,width,100) title:"NOT STARTED"];
        [self addSubview:notStartedColumn];
        inProgressColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(width,0,width,100) title:"IN PROGRESS"];
        [self addSubview:inProgressColumn];
        finishedColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(width + width,0,width,100) title:"FINISHED"];
        [self addSubview:finishedColumn];
        [self registerForDraggedTypes:[NewStickyNoteDragType]];

        var stickyNote1 = [[StickyNote alloc] initWithFrame:CGRectMake(0, 0, 100, 100) task:[Task taskWithTitle:"Task User"]];
        [self addSubview:stickyNote1];
        var stickyNote2 = [[StickyNote alloc] initWithFrame:CGRectMake(200, 200, 100, 100) task:[Task taskWithTitle:"Task User"]];
        [self addSubview:stickyNote2];
        var stickyNote3 = [[StickyNote alloc] initWithFrame:CGRectMake(300, 300, 100, 100) task:[Task taskWithTitle:"Task User"]];
        [self addSubview:stickyNote3];
    }
    return self;
}

- (void)setDraggingEnteredBorder
{
    [self setBorderType:CPLineBorder];
    [self setBorderColor:[CPColor grayColor]];
}

- (void)setDraggingExitedBorder
{
    [self setBorderType:CPNoBorder];
    [self setBorderColor:nil];
}

- (void)draggingEntered:(CPDraggingInfo)aSender
{
    [self setDraggingEnteredBorder];
}

- (void)draggingExited:(CPDraggingInfo)aSender
{
    [self setDraggingExitedBorder];
}

- (void)performDragOperation:(CPDraggingInfo)aSender
{
    [self setDraggingExitedBorder];
   var data = [[aSender draggingPasteboard] dataForType:NewStickyNoteDragType];
   console.log([aSender draggedView], [aSender draggedViewLocation], [aSender draggingDestinationWindow], [aSender draggingLocation], [aSender draggingSource]);
   var stickyNote = [[StickyNote alloc] initWithFrame:CGRectMake(0, 0, 100, 100) task:[Task taskWithTitle:"Task User"]];
   [stickyNote setCenter:[aSender draggingLocation]];
   [self addSubview:stickyNote];
   
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
        //[self setBackgroundColor:[CPColor blueColor]];
        
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

NewStickyNoteDragType = "NewStickyNoteDragType";

@implementation NewStickyNote : CPView
{
}
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = CGRectGetWidth([self bounds]),
            height = CGRectGetHeight([self bounds]);

        var label = [[CPTextField alloc] initWithFrame:CGRectMake(0,height * (1 / 3),width,height * (2 / 3))];
        [label setStringValue:"New Task"];
        [label setEditable:NO];
        [label setFont:[CPFont boldSystemFontOfSize:14.0]];
        [label setAlignment:CPCenterTextAlignment];
        [label setCenter:CGPointMake(width / 2, height / 2)];
        [label setTextColor:[CPColor whiteColor]];
        [label setAlignment:CPCenterTextAlignment];
        [self setBackgroundColor:[self customBackgroundImageColor]];
        [self setAlphaValue:0.8];
        [self addSubview:label];
    }
    return self;
}

- (CPColor)customBackgroundImageColor
{
    var bundle = [CPBundle bundleForClass:[self class]],
        backgroundImage = [CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:[
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"top-left.png"] size:CPSizeMake(10.0, 30.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"top.png"] size:CPSizeMake(1.0, 30.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"top-right.png"] size:CPSizeMake(10.0, 30.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"left.png"] size:CPSizeMake(10.0, 1.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"center.png"] size:CPSizeMake(1.0, 1.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"right.png"] size:CPSizeMake(10.0, 1.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"bottom-left.png"] size:CPSizeMake(10.0, 12.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"bottom.png"] size:CPSizeMake(1.0, 12.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"bottom-right.png"] size:CPSizeMake(10.0, 12.0)],
        ]]];
    
    return backgroundImage;
}

- (void)mouseDragged:(CPEvent)anEvent
{   
    var point = [self convertPoint:[anEvent locationInWindow] fromView:nil],
            bounds = CGRectMake(0, 0, 30, 30);
    [[CPPasteboard pasteboardWithName:CPDragPboard] declareTypes:[CPArray arrayWithObject:NewStickyNoteDragType] owner:self];    
    
    [self dragView: [self mutableCopy]
                at: CPPointMakeZero()
            offset: CPPointMake(0.0, 0.0)
             event: anEvent
        pasteboard: nil
            source: self
         slideBack: YES];
    }
}
- (void) pasteboard:(CPPasteboard)aPasteboard provideDataForType:(CPString)aType {

    if(aType == NewStickyNoteDragType) 
        [aPasteboard setData:[self mutableCopy] forType:aType]; 
}

- (id)mutableCopy
{   
    return [[NewStickyNote alloc] initWithFrame:[self frame]];
}

@end

