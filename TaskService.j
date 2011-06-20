@import <Foundation/CPObject.j>
@import "Task.j"

@implementation TaskService : CPObject
{
}

+ (CPArray) allTask
{
    var request = [CPURLRequest requestWithURL:"Resources/TaskList.json"];
    var response;
    var taskList = [[CPArray alloc] init];

    var data = [CPURLConnection sendSynchronousRequest:request returningResponse:response];
    if (data != nil)
    {
        var result = [data JSONObject];
        if (result != null)
        {
            taskList = [Task initWithJSONObjects: result.TaskList];
        }
    }

    return taskList;
}

@end