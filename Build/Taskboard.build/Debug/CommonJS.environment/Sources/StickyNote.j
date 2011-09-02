@STATIC;1.0;i;22;LPMultiLineTextField.jt;9511;

objj_executeFile("LPMultiLineTextField.j", YES);


StickyNoteDragType = "StickyNoteDragType"
var YellowColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 1.0, 1.0, 0.0, 0.8),
    BlueColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.7);


{var the_class = objj_allocateClassPair(CPView, "StickyNote"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("dragLocation"), new objj_ivar("label"), new objj_ivar("task"), new objj_ivar("status")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("task"), function $StickyNote__task(self, _cmd)
{ with(self)
{
return task;
}
},["id"]),
new objj_method(sel_getUid("setTask:"), function $StickyNote__setTask_(self, _cmd, newValue)
{ with(self)
{
task = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("status"), function $StickyNote__status(self, _cmd)
{ with(self)
{
return status;
}
},["id"]),
new objj_method(sel_getUid("setStatus:"), function $StickyNote__setStatus_(self, _cmd, newValue)
{ with(self)
{
status = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:task:"), function $StickyNote__initWithFrame_task_(self, _cmd, aFrame, aTask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StickyNote").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        var width = CGRectGetWidth(objj_msgSend(self, "bounds")),
            height = CGRectGetHeight(objj_msgSend(self, "bounds"));

        task = aTask;
        var label = objj_msgSend(objj_msgSend(LPMultiLineTextField, "alloc"), "initWithFrame:", CGRectMake(0,height * (1 / 3),width,height * (2 / 3)));
        objj_msgSend(label, "setStringValue:", objj_msgSend(task, "title"));
        objj_msgSend(label, "setEditable:", YES);

        objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(label, "setAlignment:", CPCenterTextAlignment);


        objj_msgSend(label, "setCenter:", CGPointMake(width / 2, height / 2));
        objj_msgSend(self, "addSubview:", label);
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "customBackgroundImageColor"));
        objj_msgSend(self, "setAlphaValue:", 0.9);
        objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", StatusTaskDragType));
    }
    return self;
}
},["id","CGRect","Task"]), new objj_method(sel_getUid("customBackgroundImageColor"), function $StickyNote__customBackgroundImageColor(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class")),
        backgroundImage = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "top-left.png"), CPSizeMake(10.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "top.png"), CPSizeMake(1.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "top-right.png"), CPSizeMake(10.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "left.png"), CPSizeMake(10.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "center.png"), CPSizeMake(1.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "right.png"), CPSizeMake(10.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "bottom-left.png"), CPSizeMake(10.0, 12.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "bottom.png"), CPSizeMake(1.0, 12.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "bottom-right.png"), CPSizeMake(10.0, 12.0)),
        ]));

    return backgroundImage;
}
},["CPColor"]), new objj_method(sel_getUid("mouseDown:"), function $StickyNote__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    editedOrigin = objj_msgSend(self, "frame").origin;

    dragLocation = objj_msgSend(anEvent, "locationInWindow");

    objj_msgSend(objj_msgSend(self, "superview"), "addSubview:", self);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $StickyNote__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(anEvent, "locationInWindow"),
        origin = objj_msgSend(self, "frame").origin;

    objj_msgSend(self, "setFrameOrigin:", CGPointMake(origin.x + location.x - dragLocation.x, origin.y + location.y - dragLocation.y));

    dragLocation = location;

 var myLocation = objj_msgSend(objj_msgSend(self, "superview"), "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
 index = objj_msgSend(self, "_rowAtPoint:", myLocation);

 if( index == 0)
 {
  objj_msgSend(task, "setStatus:", NotStartedStatusTask);
 }
 if( index == 1)
 {
  objj_msgSend(task, "setStatus:", InProgresStatusTask);
 }
 if( index == 2)
 {
  objj_msgSend(task, "setStatus:", FinishedtatusTask);
 }


}
},["void","CPEvent"]), new objj_method(sel_getUid("_rowAtPoint:"), function $StickyNote___rowAtPoint_(self, _cmd, thePoint)
{ with(self)
{
    var width = CGRectGetWidth(objj_msgSend(objj_msgSend(self, "superview"), "bounds"))/3;
 console.log('point ', thePoint.x, ' width ', width);
 var column = FLOOR(thePoint.x / width);

    return column;
}
},["int","CGPoint"]), new objj_method(sel_getUid("performDragOperation:"), function $StickyNote__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
    var width = CGRectGetWidth(objj_msgSend(self, "bounds")),
        height = CGRectGetHeight(objj_msgSend(self, "bounds"));
   objj_msgSend(self, "setActive:", NO);
    var pasteboard = objj_msgSend(aSender, "draggingPasteboard");
    if(!objj_msgSend(pasteboard, "availableTypeFromArray:", [StatusTaskDragType]))
        return NO;
    var statusTask = objj_msgSend(pasteboard, "dataForType:", StatusTaskDragType);
    objj_msgSend(statusTask, "setCenter:", CGPointMake(width / 2, height / 2));
    objj_msgSend(self, "addSubview:", statusTask);
}
},["BOOL","CPDraggingInfo"]), new objj_method(sel_getUid("draggingEntered:"), function $StickyNote__draggingEntered_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "setActive:", YES);
}
},["void","CPDraggingInfo"]), new objj_method(sel_getUid("draggingExited:"), function $StickyNote__draggingExited_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "setActive:", NO);
}
},["void","CPDraggingInfo"]), new objj_method(sel_getUid("setActive:"), function $StickyNote__setActive_(self, _cmd, ifIsActive)
{ with(self)
{
    isActive = ifIsActive;
}
},["void","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeClass"), function $StickyNote__themeClass(self, _cmd)
{ with(self)
{
    return "sticky-view";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $StickyNote__themeAttributes(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class")),
        backgroundImage = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "top-left.png"), CPSizeMake(10.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "top.png"), CPSizeMake(1.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "top-right.png"), CPSizeMake(10.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "left.png"), CPSizeMake(10.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "center.png"), CPSizeMake(1.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "right.png"), CPSizeMake(10.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "bottom-left.png"), CPSizeMake(10.0, 12.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "bottom.png"), CPSizeMake(1.0, 12.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "bottom-right.png"), CPSizeMake(10.0, 12.0)),
        ]));
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [backgroundImage, objj_msgSend(CPColor, "whiteColor"), 0.8], ["background-color", "text-color", "alpha-value"]);
}
},["id"])]);
}

