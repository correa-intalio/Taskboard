

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
@end
