
StickyNoteDragType = @"StickyNoteDragType"

@implementation StickyNote : CPBox
{
}

- (id)initWithFrame:(CGRect)aFrame
{
    CPLog.trace("Creating a new " + [self class] + " CGRect(" + aFrame.origin.x + "," + aFrame.origin.y + "," + aFrame.size.width + "," + aFrame.size.height + ")");
    self = [super initWithFrame:aFrame];

    if (self)
    {
        var width = [[self bounds].size.width],
            height = [[self bounds].size.height];
            
        var mainBundle = [CPBundle mainBundle];

        var path = [mainBundle pathForResource:@"stickynote.jpg"],
            image = [[CPImage alloc] initWithContentsOfFile:path size:CGSizeMake(200, 200)],
            imageView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];

        [imageView setHasShadow:NO];
        [imageView setImageScaling:CPScaleNone];
        var imageSize = [image size];
        [imageView setFrameSize:imageSize];
        [imageView setImage:image];
        [self addSubview:imageView];

        [self setBackgroundColor:[CPColor lightGrayColor]];
    }
    return self;
}

- (void)mouseDragged:(CPEvent)anEvent
{   
    var point = [self convertPoint:[anEvent locationInWindow] fromView:nil],
            bounds = CGRectMake(0, 0, 30, 30);
            
    [[CPPasteboard pasteboardWithName:CPDragPboard] declareTypes:[CPArray arrayWithObject:[StickyNoteDragType]] owner:self];    
    
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
    return [[StickyNote alloc] initWithFrame:[self frame]];
}

@end
