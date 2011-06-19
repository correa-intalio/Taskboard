@import "Task.j"

@implementation User : CPObject
{
    CPString name @accessors;
    CPMutableArray taskList @accessors;
}

- (id)init
{
    return [self initWithName: "Unknow name" taskList:[[CPMutableArray alloc] init]];
}

- (id)initWithName:(CPString)aName taskList:(CPMutableArray)aTaskList
{
    if (self = [super init])
    {
        name = aName;
        taskList = aTaskList
    }
    return self;
}

+ (User)userWithName:(CPString)aName taskList:(CPMutableArray)aTaskList
{
   return [[User alloc] initWithName:aName taskList:aTaskList];
}
@end