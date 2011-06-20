
StickyNoteDragType = @"StickyNoteDragType"
var YellowColor = [CPColor colorWithCalibratedRed:1.0 green:1.0 blue:0.0 alpha:0.8],
    BlueColor = [CPColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:0.7];


@implementation StickyNote : CPBox
{
	CGPoint     dragLocation;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = [[self bounds].size.width],
            height = [[self bounds].size.height];
        
        
        [self setBackgroundColor:BlueColor];
        
    }
    return self;
}

- (void)mouseDown:(CPEvent)anEvent
{
    editedOrigin = [self frame].origin;
    
    dragLocation = [anEvent locationInWindow];

    [[self superview] addSubview:self];
}
    
- (void)performDragOperation:(CPDraggingInfo)aSender
{
    [self setBorderType:CPNoBorder];
    [self setBorderColor:[CPColor whiteColor]];
}

- (void)draggingEntered:(CPDraggingInfo)aSender
{
    console.log("asasas");
    [self setBorderType:CPGrooveBorder];
    [self setBorderColor:[CPColor blackColor]];
}

- (void)draggingExited:(CPDraggingInfo)aSender
{
    [self setBorderType:CPNoBorder];
    [self setBorderColor:[CPColor whiteColor]];
}

- (void)mouseDragged:(CPEvent)anEvent
{   
    var location = [anEvent locationInWindow],
        origin = [self frame].origin;
    
    [self setFrameOrigin:CGPointMake(origin.x + location.x - dragLocation.x, origin.y + location.y - dragLocation.y)];

    dragLocation = location;
	/*var point = [self convertPoint:[anEvent locationInWindow] fromView:nil],
            bounds = CGRectMake(0, 0, 30, 30);
            
    [[CPPasteboard pasteboardWithName:CPDragPboard] declareTypes:[CPArray arrayWithObject:[StickyNoteDragType]] owner:self];    
    
    [self dragView: self
                at: CPPointMakeZero()
            offset: CPPointMake(0.0, 0.0)
             event: anEvent
        pasteboard: nil
            source: self
         slideBack: YES];
    }*/
}

- (id)mutableCopy
{   
    return [[StickyNote alloc] initWithFrame:[self frame]];
}



@end
