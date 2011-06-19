@import <AppKit/CPBox.j>
@import "Task.j"
@import "User.j"


@implementation Taskboard : CPBox
{
    CPMutableArray userList @accessors;
}


- (id)initWithFrame:(CGRect)aFrame
{
    CPLog.trace("Creating a new " + [self class] + " CGRect(" + aFrame.origin.x + "," + aFrame.origin.y + "," + aFrame.size.width + "," + aFrame.size.height + ")");
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = [[self bounds].size.width],
            height = [[self bounds].size.height];
            
            
        [self setBackgroundColor:[CPColor lightGrayColor]];
        
        userList = [self createMockUserList];
        // var label = [[StickyNote alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        
            
    }
    return self;
}

- (CPMutableArray)createMockUserList
{
    return [CPMutableArray arrayWithArray:[[User userWithName:"Diego" taskList:[CPMutableArray arrayWithArray:[]]]]];
}

@end