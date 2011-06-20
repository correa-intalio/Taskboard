
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
    self = [self initWithTitle:aTitle status:NotStartedStatusTask];
    return self;
}

- (id)initWithTitle:(CPString)aTitle status:(CPString)aStatus
{
    if (self = [super init])
    {
        title = aTitle;
        status = aStatus;
    }
    return self;
}

- (id)initWithJSONObject:(JSObject)jsonObject
{
    self = [self initWithTitle:jsonObject.title status:jsonObject.status];
    return self;
}

/*
	One more useful thing to override is description(). This selector is used to provide developer-readable information about object. 
	description selector is often used with CPLog debugging:
*/
-(CPString) description
{
    return [[CPString alloc] initWithFormat:@"Title: %@ status:{ %@ }", title, status];
}

+ (Task)taskWithTitle:(CPString)aTitle
{
   return [[Task alloc] initWithTitle:aTitle];
}

+ (CPArray)initWithJSONObjects:(CPArray)someJSONObjects
{
    var taskList   = [[CPArray alloc] init];

    for (var i=0; i < someJSONObjects.length; i++) {
        var task = [[Task alloc] initWithJSONObject:someJSONObjects[i]] ;
		console.log('Task', task);
        [taskList addObject:task] ;
    };
    
    return taskList;
}


@end