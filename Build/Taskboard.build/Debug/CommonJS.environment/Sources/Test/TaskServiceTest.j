@STATIC;1.0;i;16;../TaskService.jt;510;

objj_executeFile("../TaskService.j", YES);

{var the_class = objj_allocateClassPair(OJTestCase, "TaskServiceTest"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("testAllTask"), function $TaskServiceTest__testAllTask(self, _cmd)
{ with(self)
{
    var taskList = objj_msgSend(TaskService, "allTask");

    objj_msgSend(self, "assertNotNull:", taskList);
    objj_msgSend(self, "assert:equals:", taskList.length, 2);
}
},["void"])]);
}

