
StatusTaskDragType = @"StatusTaskDragType"

@implementation StatusTask : CPBox
{
    CPString status @accessors;
    CPColor color @accessors;
}

- (id)initWithFrame:(CGRect)aFrame status:(CPString)aStatus color:(CPColor)aColor
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        color = aColor;
        status = aStatus;
        var width = [[self bounds].size.width],
            height = [[self bounds].size.height];
        [self setBackgroundColor:color];
        [self setBorderType:CPLineBorder];
        [self setBorderColor:[CPColor blackColor]];
        var textFiel = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,300,0)];
        [textFiel setStringValue:status];
        [textFiel setEditable:NO];
        [textFiel setFont:[CPFont systemFontOfSize:14.0]];
        [textFiel sizeToFit];
        [self addSubview:textFiel];
        [textFiel setCenter:[self center]];
    }
    return self;
}

- (void)mouseDragged:(CPEvent)anEvent
{   
    var point = [self convertPoint:[anEvent locationInWindow] fromView:nil],
            bounds = CGRectMake(0, 0, 30, 30);
            
    [[CPPasteboard pasteboardWithName:CPDragPboard] declareTypes:[CPArray arrayWithObject:[StatusTaskDragType]] owner:self];    
    
    [self dragView: [self mutableCopy]
                at: CPPointMakeZero()
            offset: CPPointMake(0.0, 0.0)
             event: anEvent
        pasteboard: nil
            source: self
         slideBack: YES];
    }
}

- (id)mutableCopy
{   
    return [[StatusTask alloc] initWithFrame:[self frame] status:[self status] color:[self color]];
}

+ (StatusTask)(id)withFrame:(CGRect)aFrame status:(CPString)aStatus color:(CPColor)aColor
{
    return [[StatusTask alloc] initWithFrame:aFrame status:aStatus color:aColor];
}
@end
