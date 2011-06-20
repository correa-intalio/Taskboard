
StatusTaskDragType = "StatusTaskDragType"

@implementation StatusTask : CPBox
{
    CPString status @accessors;
    CPColor color @accessors;
    CGGradient  gradient;
    CPColor     color1;
    CPColor     color2;
    CPString    orientation     @accessors;
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

        [self setColor1:color];
        [self setColor2:[CPColor whiteColor]];

        [self setBorderType:CPGrooveBorder];
        [self setBorderColor:[CPColor blackColor]];
        // [self setCornerRadius:3];
        var textFiel = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,300,0)];
        [textFiel setStringValue:status];
        [textFiel setEditable:NO];
        [textFiel setFont:[CPFont systemFontOfSize:14.0]];
        [textFiel sizeToFit];
        [self addSubview:textFiel];
        // [textFiel setCenter:[self center]];
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
- (void)pasteboard:(CPPasteboard)aPasteboard provideDataForType:(CPString)aType
{
    console.log(aType);
    if(aType == StatusTaskDragType)
        [aPasteboard setData:[self mutableCopy] forType:aType];
}

- (void)setColor1:(CPColor)aColor
{
    color1 = aColor;
    if (color2);
        [self createGradient];
}

- (void)setColor2:(CPColor)aColor
{
    color2 = aColor;
    if (color1);
        [self createGradient];
}

- (void)createGradient
{
    gradient = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), [[color1 redComponent],[color1 greenComponent],[color1 blueComponent],[color1 alphaComponent],[color2 redComponent],[color2 greenComponent],[color2 blueComponent],[color2 alphaComponent]], [0,1], 2);
}

- (void)drawRect:(CGRect)rect 
{
    if (gradient) {
        var targetPoint;
        if (orientation)
            targetPoint = (orientation == "vertical") ? CGPointMake(CGRectGetWidth(rect), 0) : CGPointMake(0, CGRectGetHeight(rect));
        else
            targetPoint = CGPointMake(0, CGRectGetHeight(rect));

        var context = [[CPGraphicsContext currentContext] graphicsPort];
        CGContextAddRect(context, rect);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), targetPoint);
    }
}

- (id)mutableCopy
{   
    return [CPShadowView shadowViewEnclosingView:[[StatusTask alloc] initWithFrame:[self frame] status:[self status] color:[self color]] 
                         withWeight:CPHeavyShadow];
}

+ (StatusTask)(id)withFrame:(CGRect)aFrame status:(CPString)aStatus color:(CPColor)aColor
{
    return [[StatusTask alloc] initWithFrame:aFrame status:aStatus color:aColor];
}
@end