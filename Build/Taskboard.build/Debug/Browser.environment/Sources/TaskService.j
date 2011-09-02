@STATIC;1.0;I;21;Foundation/CPObject.ji;6;Task.jt;898;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Task.j", YES);

{var the_class = objj_allocateClassPair(CPObject, "TaskService"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("allTask"), function $TaskService__allTask(self, _cmd)
{ with(self)
{
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", "Resources/TaskList.json");
    var response;
    var taskList = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");

    var data = objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:", request, response);
    if (data != nil)
    {
        var result = objj_msgSend(data, "JSONObject");
        if (result != null)
        {
            taskList = objj_msgSend(Task, "initWithJSONObjects:",  result.TaskList);
        }
    }

    return taskList;
}
},["CPArray"])]);
}

