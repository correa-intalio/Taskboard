@STATIC;1.0;I;21;Foundation/CPObject.ji;12;StickyNote.ji;11;Taskboard.ji;13;WindowUtils.jt;1081;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("StickyNote.j", YES);
objj_executeFile("Taskboard.j", YES);
objj_executeFile("WindowUtils.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{ with(self)
{
    var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask),
        contentView = objj_msgSend(theWindow, "contentView");
    var taskboard = objj_msgSend(objj_msgSend(Taskboard, "alloc"), "initWithFrame:", CGRectMake(0, 0, 1024, 600));
    objj_msgSend(taskboard, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
    objj_msgSend(contentView, "addSubview:", taskboard);
    objj_msgSend(theWindow, "orderFront:", self);
}
},["void","CPNotification"])]);
}

