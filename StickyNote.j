
StickyNoteDragType = @"StickyNoteDragType"

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
            
        var mainBundle = [CPBundle mainBundle];
//        var frame = CGRectInset([self bounds], 5.0, 5.0);

        var path = [mainBundle pathForResource:@"stickynote.jpg"],
            image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(80, 60)],
            imageView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];

        [imageView setHasShadow:NO];
        [imageView setImageScaling:CPScaleToFit];
        var imageSize = [image size];
        [imageView setFrameSize:imageSize];
        [imageView setImage:image];
        [self addSubview:imageView];
        [self setBackgroundColor:[CPColor lightGrayColor]];
    }
    return self;
}

- (void)mouseDown:(CPEvent)anEvent
{
    editedOrigin = [self frame].origin;
    
    dragLocation = [anEvent locationInWindow];
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
