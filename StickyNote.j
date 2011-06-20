@import "LPMultiLineTextField.j"


StickyNoteDragType = @"StickyNoteDragType"
var YellowColor = [CPColor colorWithCalibratedRed:1.0 green:1.0 blue:0.0 alpha:0.8],
    BlueColor = [CPColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:0.7];


@implementation StickyNote : CPBox
{
	CGPoint     dragLocation;
	Task        task @accessors;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = CGRectGetWidth([self bounds]),
            height = CGRectGetHeight([self bounds]);
        
        task = [Task taskWithTitle:"Task User"];
        
        [self setBackgroundColor:YellowColor];
        [self setBorderType:CPLineBorder];
        
        var label = [[LPMultiLineTextField alloc] initWithFrame:CGRectMake(0,height * 1 / 3,width,height * 2 / 3)];
        [label setStringValue:"[task title]"];
        [label setEditable:YES];
        [label setFont:[CPFont boldSystemFontOfSize:14.0]];
        //[label sizeToFit];
        [label setCenter:CGPointMake(width / 2, height / 2)];
        [self addSubview:label];
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
@end
