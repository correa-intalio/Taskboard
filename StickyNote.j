@import "LPMultiLineTextField.j"


StickyNoteDragType = @"StickyNoteDragType"
var YellowColor = [CPColor colorWithCalibratedRed:1.0 green:1.0 blue:0.0 alpha:0.8],
    BlueColor = [CPColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:0.7];


@implementation StickyNote : CPView
{
	CGPoint                 dragLocation;
	LPMultiLineTextField	label;
	Task                    task @accessors;
	StatusTask              status @accessors;
}

- (id)initWithFrame:(CGRect)aFrame task:(Task)aTask
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = CGRectGetWidth([self bounds]),
            height = CGRectGetHeight([self bounds]);
        
        task = aTask;
        var label = [[LPMultiLineTextField alloc] initWithFrame:CGRectMake(0,height * (1 / 3),width,height * (2 / 3))];
        [label setStringValue:[task title]];
        [label setEditable:YES];
        //[label setFont:[CPFont boldSystemFontOfSize:12.0]];
        [label setTextColor:[CPColor whiteColor]];
        [label setAlignment:CPCenterTextAlignment];
        //[label setBackgroundColor:[CPColor redColor]];
        //[label sizeToFit];
        [label setCenter:CGPointMake(width / 2, height / 2)];
        [self addSubview:label];
        [self setBackgroundColor:[self customBackgroundImageColor]];
        [self setAlphaValue:0.9];
        [self registerForDraggedTypes:[CPArray arrayWithObjects:StatusTaskDragType]]; 
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

- (void)mouseDown:(CPEvent)anEvent
{
    editedOrigin = [self frame].origin;
    
    dragLocation = [anEvent locationInWindow];

    [[self superview] addSubview:self];
}

- (void)mouseDragged:(CPEvent)anEvent
{   
    var location = [anEvent locationInWindow],
        origin = [self frame].origin;
    
    [self setFrameOrigin:CGPointMake(origin.x + location.x - dragLocation.x, origin.y + location.y - dragLocation.y)];

    dragLocation = location;

	var myLocation = [[self superview] convertPoint:[anEvent locationInWindow] fromView:nil],
	index = [self _rowAtPoint:myLocation];
	
	if( index == 0)
	{
		[task setStatus:NotStartedStatusTask];
	}
	if( index == 1)
	{
		[task setStatus:InProgresStatusTask];
	}
	if( index == 2)
	{
		[task setStatus:FinishedtatusTask];
	}
	

}

- (int)_rowAtPoint:(CGPoint)thePoint
{
    var width = CGRectGetWidth([[self superview] bounds])/3;
	console.log('point ', thePoint.x, ' width ', width);
	var column = FLOOR(thePoint.x / width);
 
    return column;
}

// - (void)drawRect:(CPRect)aRect
// {
//     var bounds = [self bounds],
//         context = [[CPGraphicsContext currentContext] graphicsPort],
//         width = CGRectGetWidth(bounds),
//         height = CGRectGetHeight(bounds);
// 
//     CGContextSetFillColor(context, [CPColor redColor]);
//     CGContextFillEllipseInRect(context, CGRectMake(width / 2 - 10 ,10,10,10));
// }

- (BOOL)performDragOperation:(CPDraggingInfo)aSender { 
    var width = CGRectGetWidth([self bounds]),
        height = CGRectGetHeight([self bounds]);
        
   [self setActive:NO]; 
    var pasteboard = [aSender draggingPasteboard]; 
    //alert( [pasteboard availableTypeFromArray:[TextDragType]] ); 
    if(![pasteboard availableTypeFromArray:[StatusTaskDragType]]) 
        return NO; 
    var statusTask = [pasteboard dataForType:StatusTaskDragType];
    [statusTask setCenter:CGPointMake(width / 2, height / 2)];
    [self addSubview:statusTask];
    
}

- (void) draggingEntered:(CPDraggingInfo)aSender { 
    [self setActive:YES]; 
}
- (void)draggingExited:(CPDraggingInfo)aSender { 
    [self setActive:NO]; 
} 
- (void)setActive:(BOOL)ifIsActive { 
    isActive = ifIsActive; 
}

+ (CPString)themeClass
{
    return @"sticky-view";
}

+ (id)themeAttributes
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



    return [CPDictionary dictionaryWithObjects:[backgroundImage, [CPColor whiteColor], 0.8]
                                       forKeys:[@"background-color", @"text-color", @"alpha-value"]];
}
@end
