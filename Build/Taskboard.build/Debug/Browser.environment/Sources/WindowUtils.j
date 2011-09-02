@STATIC;1.0;I;21;Foundation/CPObject.jI;16;AppKit/CPPanel.jt;989;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPPanel.j", NO);






{var the_class = objj_allocateClassPair(CPObject, "WindowUtils"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("showInHUDPanel:withFrame:"), function $WindowUtils__showInHUDPanel_withFrame_(self, _cmd, aView, aFrame)
{ with(self)
{
    var HUDPanel = objj_msgSend(objj_msgSend(CPPanel, "alloc"), "initWithContentRect:styleMask:", aFrame,  CPHUDBackgroundWindowMask | CPClosableWindowMask | CPResizableWindowMask);

    objj_msgSend(objj_msgSend(HUDPanel, "contentView"), "addSubview:", aView);
    objj_msgSend(objj_msgSend(HUDPanel, "contentView"), "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable );

    objj_msgSend(HUDPanel, "setTitle:", "For debug...");
    objj_msgSend(HUDPanel, "setFloatingPanel:", YES);

    objj_msgSend(HUDPanel, "orderFront:", self);
}
},["void","CPView","CGRect"])]);
}

