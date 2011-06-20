@implementation Task : CPObject
{
    CPString title @accessors;
}

- (id)initWithTitle:(CPString)aTitle
{
    if (self = [super init])
    {
        title = aTitle;
    }
    return self;
}
+ (Task)taskWithTitle:(CPString)aTitle
{
   return [[Task alloc] initWithTitle:aTitle];
}
@end