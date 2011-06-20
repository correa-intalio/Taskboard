@import <AppKit/CPBox.j>
@import "StickyNote.j"

@implementation Container : CPBox
{
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        [self setBackgroundColor:[CPColor whiteColor]];
        // var width = CGRectGetWidth([self bounds]);
        // var stickyBounds = 80,
        //     stickyNote1 = [[StickyNote alloc] initWithFrame:CGRectMake(0, 0, stickyBounds, stickyBounds)],
        //     stickyNote2 = [[StickyNote alloc] initWithFrame:CGRectMake(CGRectGetWidth([stickyNote1 bounds]), 0, stickyBounds, stickyBounds)],
        //     stickyNote3 = [[StickyNote alloc] initWithFrame:CGRectMake(CGRectGetWidth([stickyNote1 bounds]) * 2, 0, stickyBounds, stickyBounds)];
        // [self addSubview:stickyNote1];
        // [self addSubview:stickyNote2];
        // [self addSubview:stickyNote3];
    }
    return self;
}

@end