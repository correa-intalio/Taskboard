@import <AppKit/CPBox.j>
@import "Task.j"
@import "User.j"
@import "StatusTask.j"
@import "TaskService.j"

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
    CPString    title @accessors;
    id          parent @accessors;
}
- (id)initWithFrame:(CGRect)aFrame title:(CPString)aTitle parent:(id)aParent
{
    self = [super initWithFrame:CGRectInset(aFrame, 5.0, 5.0)];
    if (self)
    {
        title = aTitle;
        parent = aParent;
        [self setBackgroundColor:[CPColor whiteColor]];
        [self setBorderType:CPNoBorder];
        
        var width = CGRectGetWidth([self bounds]),
            height = CGRectGetHeight([self bounds]),
            mainBundle = [CPBundle mainBundle];

        var path = [mainBundle pathForResource:@"title-background.jpg"],
            image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(366, 195)],
            imageView = [[CPImageView alloc] initWithFrame:CGRectInset([self bounds], 3.0, 3.0)];

        [imageView setImageScaling:CPScaleProportionally];
        [imageView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        [imageView setImage:image];
        [self addSubview:imageView];
        
        // var titleView = [[CPBox alloc] initWithFrame:CGRectMake(0,0,CGRectGetWidth([self bounds]),100)];
        // [titleView setBorderType:CPNoBorder];
        // [titleView setBorderColor:[CPColor lightGrayColor]];
        // [self addSubview:titleView];
        // 
        var titleTextField = [[TitleTextField alloc] initWithFrame:CGRectMake(0,0,100,40)];
        [titleTextField setStringValue:title];
        [titleTextField setEditable:NO];
        [titleTextField setFont:[CPFont boldSystemFontOfSize:14.0]];
        [titleTextField sizeToFit];
        [titleTextField setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [titleTextField setCenter:CGPointMake(width / 2, height / 2)];
        [titleTextField setAction:@selector(tile)];
        [titleTextField setTarget:[self parent]];
        [self addSubview:titleTextField];
        
        // [titleTextField setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        // [titleTextField setCenter:CGPointMake(width / 2, height / 2)];
        // [titleView addSubview:titleTextField];

    }
    return self;
}

- (void)onTitleClick
{
    console.log("onTitleClick");
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

@implementation TitleTextField : CPTextField
{
    
}
- (void)mouseDown:(CPEvent)anEvent
{
    if ([anEvent clickCount] == 2)
    {
        console.log('doubleClick');
        [self sendAction:[self action] to:[self target]];
    }
}
@end

@implementation Blackboard : CPBox
{
    TaskboardColumn notStartedColumn @accessors;
    TaskboardColumn inProgressColumn @accessors;
    TaskboardColumn finishedColumn @accessors;
    CPArray         taskList;
    CPArray         views;
    float           horizontalMargin;
    float           verticalMargin;
    float           originY;
    float           columnWidth;
    float           columnHeight;
}
- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setDraggingExitedBorder];
        var width = CGRectGetWidth([self bounds]) / 3,
            height = CGRectGetHeight([self bounds]);
        
        
        notStartedColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(0,0,width,80) title:"NOT STARTED" parent:self];
        [self addSubview:notStartedColumn];
        inProgressColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(width,0,width,80) title:"IN PROGRESS" parent:self];
        [self addSubview:inProgressColumn];
        finishedColumn = [[TaskboardColumn alloc] initWithFrame:CGRectMake(width + width,0,width,80) title:"FINISHED" parent:self];
        [self addSubview:finishedColumn];
        [self registerForDraggedTypes:[NewStickyNoteDragType]];

        taskList = [TaskService allTask];
        horizontalMargin = 5.0;
        verticalMargin = 5.0;
        originY = 80;
        columnWidth = CGRectGetWidth([self bounds]) / 3;
        columnHeight = CGRectGetHeight([self bounds]);
        views = [];
        [self reloadContent];


    }
    return self;
}

- (void)reloadContent
{
    console.log('reloadContent');
    var index = 0,
        size = 150,
        count = taskList.length;
        
    for (; index < count; ++index)
    {
        var stickyNote = [[StickyNote alloc] initWithFrame:CGRectMake(0,0,size,size) task:taskList[index]];
        views.push(stickyNote);
        [self addSubview:stickyNote];
    }
    [self tile];    
}

- (void)tile
{
    var index = 0,
        size = 150;
        count = views.length,
        numberOfColumns = MAX(1.0, FLOOR(columnWidth / size)),
        numberOfRows = MAX(1.0, FLOOR(columnHeight / size)),
        gap = size,
        horizontalMargin = FLOOR((columnWidth - numberOfColumns * size) / (numberOfColumns + 1));

    for (; index < count; ++index)
    {
        var stickyNote = views[index];
        [stickyNote removeFromSuperview];
    }

    index = 0;
    //overlap tasks 
    if( count > ( numberOfColumns * numberOfRows))
    {
        gap = FLOOR(size / 3);
    }
    
    var x = horizontalMargin,
        y = -gap + originY; 
    
    for (; index < count; ++index)
    {
        var stickyNote = views[index];
        
        if (index % numberOfColumns == 0)
        {
            x = horizontalMargin;
            y += verticalMargin + gap;
         }

        [self addSubview:stickyNote];
        console.log("From:", [stickyNote frame], ". To:" , CGRectMake(x,y,150,150));
        
        //[stickyNote setFrame:CGRectMake(x, y, 150, 150)];
        [self moveViewWithAnimation:stickyNote startFrame:[stickyNote frame]
                                                 endFrame:CGRectMake(x,y,150,150)];
        
        x += size + horizontalMargin;
    }
}

/*!
    
*/
- (void)moveViewWithAnimation:(CPView)aView startFrame:(CGRect)aStartFrame endFrame:(CGRect)anEndFrame
{
    var animation = [CPDictionary dictionaryWithObjects:[aView, aStartFrame, anEndFrame, CPViewAnimationEffectKey]
                                                forKeys:[CPViewAnimationTargetKey, CPViewAnimationStartFrameKey, CPViewAnimationEndFrameKey, CPViewAnimationEffectKey]],
        cpViewAnimation = [[CPViewAnimation alloc] initWithViewAnimations:[animation]];

    [cpViewAnimation startAnimation];
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
    var location = [self convertPoint:[aSender draggingLocation] fromView:nil];
    [self setDraggingExitedBorder];
    var data = [[aSender draggingPasteboard] dataForType:NewStickyNoteDragType],
        aTask = [Task taskWithTitle:"Task User"],
        stickyNote = [[StickyNote alloc] initWithFrame:CGRectMake(0, 0, 150, 150) task:aTask];
    
    [stickyNote setFrameOrigin:CGPointMake(location.x - CGRectGetWidth([stickyNote frame]) / 2.0, location.y - CGRectGetHeight([stickyNote frame]) / 2.0)];
    views.push(stickyNote);
    taskList.push(aTask);
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
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(3, 3, 65, 40) status:"PLEASE \n ANALYSE" color:[CPColor colorWithCalibratedRed:1.0 green:0.0 blue:1.0 alpha:0.7]]
                                   withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(68, 3, 65, 40) status:"PLEASE \n TEST" color:[CPColor colorWithCalibratedRed:1.0 green:0.4 blue:0.2 alpha:0.7]]
                                   withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(68*2, 3, 65, 40) status:"DONE" color:[CPColor colorWithCalibratedRed:70 / 255 green:130 / 255 blue:180 / 255  alpha:0.7]]
                                   withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(68*3, 3, 65, 40) status:"BLOCKED" color:[CPColor colorWithCalibratedRed:112 / 255 green:147 / 255 blue:219 / 255  alpha:0.7]]
                                   withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(3, 50, 65, 40) status:"HIGH \n PRIORITY" color:[CPColor colorWithCalibratedRed:255 / 255 green:16 / 255 blue:16 / 255 alpha:0.7]]
                                      withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(68, 50, 65, 40) status:"WAITING" color:[CPColor colorWithCalibratedRed:255 / 255  green:165 / 255  blue:79 / 255  alpha:0.7]]
                                      withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(68*2, 50, 65, 40) status:"DELEGATED" color:[CPColor colorWithCalibratedRed:193 / 255 green:255 / 255 blue:193 / 255  alpha:0.7]]
                                      withWeight:CPLightShadow]];
        [self addSubview:[CPShadowView shadowViewEnclosingView:[StatusTask withFrame:CGRectMake(68*3, 50, 65, 40) status:"BUG" color:[CPColor colorWithCalibratedRed:85 / 255 green:107 / 255 blue:47 / 255  alpha:0.7]]
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
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/top-left.png"] size:CPSizeMake(10.0, 30.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/top.png"] size:CPSizeMake(1.0, 30.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/top-right.png"] size:CPSizeMake(10.0, 30.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/left.png"] size:CPSizeMake(10.0, 1.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/center.png"] size:CPSizeMake(1.0, 1.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/right.png"] size:CPSizeMake(10.0, 1.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/bottom-left.png"] size:CPSizeMake(10.0, 12.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/bottom.png"] size:CPSizeMake(1.0, 12.0)],
            [[CPImage alloc] initWithContentsOfFile:[bundle pathForResource:@"yellow/bottom-right.png"] size:CPSizeMake(10.0, 12.0)],
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

