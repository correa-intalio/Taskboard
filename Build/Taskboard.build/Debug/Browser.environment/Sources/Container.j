@STATIC;1.0;I;14;AppKit/CPBox.ji;12;StickyNote.jt;637;

objj_executeFile("AppKit/CPBox.j", NO);
objj_executeFile("StickyNote.j", YES);

{var the_class = objj_allocateClassPair(CPBox, "Container"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $Container__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Container").super_class }, "initWithFrame:", aFrame);

    if (self)
    {
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    }
    return self;
}
},["id","CGRect"])]);
}

