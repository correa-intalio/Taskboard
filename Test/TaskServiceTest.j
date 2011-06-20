@import "../TaskService.j"

@implementation TaskServiceTest : OJTestCase

- (void)testAllTask
{
    var taskList = [TaskService allTask];
    
    [self assertNotNull:taskList];
    [self assert:taskList.length equals:2];
}

@end