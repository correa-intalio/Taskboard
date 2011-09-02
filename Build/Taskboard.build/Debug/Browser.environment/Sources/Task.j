@STATIC;1.0;t;2732;


NotStartedStatusTask = "NotStartedStatusTask";
InProgresStatusTask = "InProgresStatusTask";
FinishedtatusTask = "FinishedtatusTask";

{var the_class = objj_allocateClassPair(CPObject, "Task"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("title"), new objj_ivar("status")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("title"), function $Task__title(self, _cmd)
{ with(self)
{
return title;
}
},["id"]),
new objj_method(sel_getUid("setTitle:"), function $Task__setTitle_(self, _cmd, newValue)
{ with(self)
{
title = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("status"), function $Task__status(self, _cmd)
{ with(self)
{
return status;
}
},["id"]),
new objj_method(sel_getUid("setStatus:"), function $Task__setStatus_(self, _cmd, newValue)
{ with(self)
{
status = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithTitle:"), function $Task__initWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    self = objj_msgSend(self, "initWithTitle:status:", aTitle, NotStartedStatusTask);
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("initWithTitle:status:"), function $Task__initWithTitle_status_(self, _cmd, aTitle, aStatus)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Task").super_class }, "init"))
    {
        title = aTitle;
        status = aStatus;
    }
    return self;
}
},["id","CPString","CPString"]), new objj_method(sel_getUid("initWithJSONObject:"), function $Task__initWithJSONObject_(self, _cmd, jsonObject)
{ with(self)
{
    self = objj_msgSend(self, "initWithTitle:status:", jsonObject.title, jsonObject.status);
    return self;
}
},["id","JSObject"]), new objj_method(sel_getUid("description"), function $Task__description(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPString, "alloc"), "initWithFormat:", "Title: %@ status:{ %@ }", title, status);
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("taskWithTitle:"), function $Task__taskWithTitle_(self, _cmd, aTitle)
{ with(self)
{
   return objj_msgSend(objj_msgSend(Task, "alloc"), "initWithTitle:", aTitle);
}
},["Task","CPString"]), new objj_method(sel_getUid("initWithJSONObjects:"), function $Task__initWithJSONObjects_(self, _cmd, someJSONObjects)
{ with(self)
{
    var taskList = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");

    for (var i=0; i < someJSONObjects.length; i++) {
        var task = objj_msgSend(objj_msgSend(Task, "alloc"), "initWithJSONObject:", someJSONObjects[i]) ;
  console.log('Task', task);
        objj_msgSend(taskList, "addObject:", task) ;
    };

    return taskList;
}
},["CPArray","CPArray"])]);
}

