@STATIC;1.0;i;6;Task.jt;1700;

objj_executeFile("Task.j", YES);

{var the_class = objj_allocateClassPair(CPObject, "User"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("name"), new objj_ivar("taskList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function $User__name(self, _cmd)
{ with(self)
{
return name;
}
},["id"]),
new objj_method(sel_getUid("setName:"), function $User__setName_(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("taskList"), function $User__taskList(self, _cmd)
{ with(self)
{
return taskList;
}
},["id"]),
new objj_method(sel_getUid("setTaskList:"), function $User__setTaskList_(self, _cmd, newValue)
{ with(self)
{
taskList = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $User__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithName:taskList:",  "Unknow name", objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init"));
}
},["id"]), new objj_method(sel_getUid("initWithName:taskList:"), function $User__initWithName_taskList_(self, _cmd, aName, aTaskList)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("User").super_class }, "init"))
    {
        name = aName;
        taskList = aTaskList
    }
    return self;
}
},["id","CPString","CPMutableArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("userWithName:taskList:"), function $User__userWithName_taskList_(self, _cmd, aName, aTaskList)
{ with(self)
{
   return objj_msgSend(objj_msgSend(User, "alloc"), "initWithName:taskList:", aName, aTaskList);
}
},["User","CPString","CPMutableArray"])]);
}

