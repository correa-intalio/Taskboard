@import "LPMultiLineTextField.j"


StickyNoteDragType = @"StickyNoteDragType"
var YellowColor = [CPColor colorWithCalibratedRed:1.0 green:1.0 blue:0.0 alpha:0.8],
    BlueColor = [CPColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:0.7];


@implementation StickyNote : CPBox
{
	CGPoint     			dragLocation;
	LPMultiLineTextField	label;
	Task        			task @accessors;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = CGRectGetWidth([self bounds]),
            height = CGRectGetHeight([self bounds]);
        
        task = [Task taskWithTitle:"Task User"];
        
        var mainBundle = [CPBundle mainBundle];

        var path = [mainBundle pathForResource:@"sticky.png"],
            image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(100, 100)],
            imageView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];

        [imageView setHasShadow:NO];
        [imageView setImageScaling:CPScaleNone];
        var imageSize = [image size];
        [imageView setFrameSize:imageSize];
        [imageView setImage:image];
        [self addSubview:imageView];

        [self setBackgroundColor:YellowColor];
        [self setBorderType:CPLineBorder];
        
        var label = [[LPMultiLineTextField alloc] initWithFrame:CGRectMake(0,height * (1 / 3),width,height * (2 / 3))];
        [label setStringValue:"[task title]"];
        [label setEditable:YES];
        [label setFont:[CPFont boldSystemFontOfSize:14.0]];
        [label setAlignment:CPCenterTextAlignment];
        //[label setBackgroundColor:[CPColor redColor]];
        //[label sizeToFit];
        [label setCenter:CGPointMake(width / 2, height / 2)];
        [self addSubview:label];
        [self registerForDraggedTypes:[CPArray arrayWithObjects:StatusTaskDragType]]; 
    }
    return self;
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
		[label setStringValue:@"Not Started"];
	}
	if( index == 1)
	{
		[label setStringValue:@"In Progress"];
	}
	if( index == 2)
	{
		[label setStringValue:@"Finished"];
	}
	

}

- (int)_rowAtPoint:(CGPoint)thePoint
{
    var width = CGRectGetWidth([[self superview] bounds])/3;
	console.log('point ', thePoint.x, ' width ', width);
	var column = FLOOR(thePoint.x / width);
 
    return column;
}

- (void)drawRect:(CPRect)aRect
{
    var bounds = [self bounds],
        context = [[CPGraphicsContext currentContext] graphicsPort],
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);

    CGContextSetFillColor(context, [CPColor redColor]);
    CGContextFillEllipseInRect(context, CGRectMake(width / 2 - 10 ,10,10,10), 40, 40);

    CGContextSetStrokeColor(context, [CPColor lightGrayColor]);
    CGContextStrokeRect(context, CGRectInset([self bounds], 0.5, 0.5));
    
}

- (BOOL)performDragOperation:(CPDraggingInfo)aSender { 
    // if we are here, then the user has finally released the 
    // mouse over the dropZone element 
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

// the methods below can be used to highlight the drop zone 
// when the user drags an element over a potential drop 
// zone (as described in the Scrapbook tutorial on the CP 
// website). I left them in here for toying purposes. 
- (void) draggingEntered:(CPDraggingInfo)aSender { 
    [self setActive:YES]; 
}
- (void)draggingExited:(CPDraggingInfo)aSender { 
    [self setActive:NO]; 
} 
- (void)setActive:(BOOL)ifIsActive { 
    isActive = ifIsActive; 
}

@end
