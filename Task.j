
NotStartedStatusTask = @"NotStartedStatusTask";
InProgresStatusTask = @"InProgresStatusTask";
FinishedtatusTask = @"FinishedtatusTask";

@implementation Task : CPObject
{
    CPString title @accessors;
    CPString status @accessors;
}

- (id)initWithTitle:(CPString)aTitle
{
    if (self = [super init])
    {
        title = aTitle;
        status = NotStartedStatusTask;
    }
    return self;
}

+ (Task)taskWithTitle:(CPString)aTitle
{
   return [[Task alloc] initWithTitle:aTitle];
}
@end