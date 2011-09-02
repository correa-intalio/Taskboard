@STATIC;1.0;I;14;AppKit/CPBox.ji;6;Task.ji;6;User.ji;12;StatusTask.ji;13;TaskService.jt;25827;

objj_executeFile("AppKit/CPBox.j", NO);
objj_executeFile("Task.j", YES);
objj_executeFile("User.j", YES);
objj_executeFile("StatusTask.j", YES);
objj_executeFile("TaskService.j", YES);

{var the_class = objj_allocateClassPair(CPBox, "Taskboard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("userList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("userList"), function $Taskboard__userList(self, _cmd)
{ with(self)
{
return userList;
}
},["id"]),
new objj_method(sel_getUid("setUserList:"), function $Taskboard__setUserList_(self, _cmd, newValue)
{ with(self)
{
userList = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $Taskboard__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    CPLog.trace("Creating a new " + objj_msgSend(self, "class") + " CGRect(" + aFrame.origin.x + "," + aFrame.origin.y + "," + aFrame.size.width + "," + aFrame.size.height + ")");
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Taskboard").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        var width = [objj_msgSend(self, "bounds").size.width],
            height = [objj_msgSend(self, "bounds").size.height];


        objj_msgSend(self, "setBorderType:", CPLineBorder);
        objj_msgSend(self, "setBorderColor:", objj_msgSend(CPColor, "lightGrayColor"));

        userList = objj_msgSend(self, "createMockUserList");

        var toolbar = objj_msgSend(objj_msgSend(TaskboardToolBar, "alloc"), "initWithFrame:", CGRectMake(1,1,CGRectGetWidth(objj_msgSend(self, "bounds")) - 2,110));
        objj_msgSend(self, "addSubview:", toolbar);

        var navigationArea = objj_msgSend(objj_msgSend(TaskboardNavigationArea, "alloc"), "initWithFrame:", CGRectMake(1,CGRectGetHeight(objj_msgSend(toolbar, "bounds")),100,CGRectGetHeight(objj_msgSend(self, "bounds"))));
        objj_msgSend(navigationArea, "setAutoresizingMask:", CPViewHeightSizable | CPViewMaxXMargin);
        objj_msgSend(self, "addSubview:", navigationArea);

        var blackboard = objj_msgSend(objj_msgSend(Blackboard, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(objj_msgSend(navigationArea, "bounds")),
                                                                                 CGRectGetHeight(objj_msgSend(toolbar, "bounds")),
                                                                                 CGRectGetWidth(objj_msgSend(self, "bounds")) - CGRectGetWidth(objj_msgSend(navigationArea, "bounds")),
                                                                                 CGRectGetHeight(objj_msgSend(self, "bounds"))));
        objj_msgSend(blackboard, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "addSubview:", blackboard);


    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("createMockUserList"), function $Taskboard__createMockUserList(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPMutableArray, "arrayWithArray:", [objj_msgSend(User, "userWithName:taskList:", "Diego", objj_msgSend(CPMutableArray, "arrayWithArray:", []))]);
}
},["CPMutableArray"])]);
}

{var the_class = objj_allocateClassPair(CPBox, "TaskboardToolBar"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $TaskboardToolBar__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TaskboardToolBar").super_class }, "initWithFrame:", aFrame);
    if (self)
    {

        objj_msgSend(self, "addSubview:", objj_msgSend(objj_msgSend(objj_msgSend(NewStickyNote, "alloc"), "init"), "initWithFrame:", CGRectMake(5, 5, 100, 100)));
        objj_msgSend(self, "addSubview:", objj_msgSend(objj_msgSend(objj_msgSend(StatusTaskPanel, "alloc"), "init"), "initWithFrame:", CGRectMake(110, 0, 400, 100)));
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("drawRect:"), function $TaskboardToolBar__drawRect_(self, _cmd, aRect)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TaskboardToolBar").super_class }, "drawRect:", aRect);
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        bounds = objj_msgSend(self, "bounds"),
        sides = [CPMinYEdge, CPMaxYEdge, CPMinXEdge, CPMaxXEdge],
        colors = [objj_msgSend(CPColor, "whiteColor"), objj_msgSend(CPColor, "grayColor"), objj_msgSend(CPColor, "whiteColor"), objj_msgSend(CPColor, "whiteColor")],
        innerRect = CPDrawColorTiledRects(bounds, bounds, sides, colors);

    CGContextSetFillColor(context, objj_msgSend(CPColor, "whiteColor"));
    CGContextFillRect(context, innerRect);
}
},["void","CPRect"])]);
}

{var the_class = objj_allocateClassPair(CPBox, "TaskboardColumn"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("title"), new objj_ivar("parent")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("title"), function $TaskboardColumn__title(self, _cmd)
{ with(self)
{
return title;
}
},["id"]),
new objj_method(sel_getUid("setTitle:"), function $TaskboardColumn__setTitle_(self, _cmd, newValue)
{ with(self)
{
title = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("parent"), function $TaskboardColumn__parent(self, _cmd)
{ with(self)
{
return parent;
}
},["id"]),
new objj_method(sel_getUid("setParent:"), function $TaskboardColumn__setParent_(self, _cmd, newValue)
{ with(self)
{
parent = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:title:parent:"), function $TaskboardColumn__initWithFrame_title_parent_(self, _cmd, aFrame, aTitle, aParent)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TaskboardColumn").super_class }, "initWithFrame:", CGRectInset(aFrame, 5.0, 5.0));
    if (self)
    {
        title = aTitle;
  parent = aParent;
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(self, "setBorderType:", CPNoBorder);

        var width = CGRectGetWidth(objj_msgSend(self, "bounds")),
            height = CGRectGetHeight(objj_msgSend(self, "bounds")),
            mainBundle = objj_msgSend(CPBundle, "mainBundle");

        var path = objj_msgSend(mainBundle, "pathForResource:", "title-background.jpg"),
            image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", path, CGSizeMake(366, 195)),
            imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));

        objj_msgSend(imageView, "setImageScaling:", CPScaleProportionally);
        objj_msgSend(imageView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(imageView, "setImage:", image);
        objj_msgSend(self, "addSubview:", imageView);






        var titleTextField = objj_msgSend(objj_msgSend(TitleTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,100,40));
        objj_msgSend(titleTextField, "setStringValue:", title);
        objj_msgSend(titleTextField, "setEditable:", NO);
        objj_msgSend(titleTextField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 14.0));
        objj_msgSend(titleTextField, "sizeToFit");
        objj_msgSend(titleTextField, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
        objj_msgSend(titleTextField, "setCenter:", CGPointMake(width / 2, height / 2));
  objj_msgSend(titleTextField, "setAction:", sel_getUid("tile"));
        objj_msgSend(titleTextField, "setTarget:", objj_msgSend(self, "parent"));
  objj_msgSend(self, "addSubview:", titleTextField);





    }
    return self;
}
},["id","CGRect","CPString","id"]), new objj_method(sel_getUid("onTitleClick"), function $TaskboardColumn__onTitleClick(self, _cmd)
{ with(self)
{
    console.log("onTitleClick");
}
},["void"]), new objj_method(sel_getUid("drawRect:"), function $TaskboardColumn__drawRect_(self, _cmd, aRect)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TaskboardColumn").super_class }, "drawRect:", aRect);
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);

        CGContextSetLineWidth(context, 3);
        CGContextStrokeLineSegments(context,
                                    [CGPointMake(0, height),
                                            CGPointMake(width, height),
                                        CGPointMake(0, height - 1),
                                            CGPointMake(width, height - 1)],
                                    4);

}
},["void","CPRect"]), new objj_method(sel_getUid("performDragOperation:"), function $TaskboardColumn__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
 CPLog.trace("performDragOperation");







}
},["void","CPDraggingInfo"])]);
}

{var the_class = objj_allocateClassPair(CPTextField, "TitleTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("mouseDown:"), function $TitleTextField__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "clickCount") == 2)
 {
  console.log('doubleClick');
  objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
 }
}
},["void","CPEvent"])]);
}

{var the_class = objj_allocateClassPair(CPBox, "Blackboard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("notStartedColumn"), new objj_ivar("inProgressColumn"), new objj_ivar("finishedColumn"), new objj_ivar("taskList"), new objj_ivar("views"), new objj_ivar("horizontalMargin"), new objj_ivar("verticalMargin"), new objj_ivar("originY"), new objj_ivar("columnWidth"), new objj_ivar("columnHeight")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("notStartedColumn"), function $Blackboard__notStartedColumn(self, _cmd)
{ with(self)
{
return notStartedColumn;
}
},["id"]),
new objj_method(sel_getUid("setNotStartedColumn:"), function $Blackboard__setNotStartedColumn_(self, _cmd, newValue)
{ with(self)
{
notStartedColumn = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("inProgressColumn"), function $Blackboard__inProgressColumn(self, _cmd)
{ with(self)
{
return inProgressColumn;
}
},["id"]),
new objj_method(sel_getUid("setInProgressColumn:"), function $Blackboard__setInProgressColumn_(self, _cmd, newValue)
{ with(self)
{
inProgressColumn = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("finishedColumn"), function $Blackboard__finishedColumn(self, _cmd)
{ with(self)
{
return finishedColumn;
}
},["id"]),
new objj_method(sel_getUid("setFinishedColumn:"), function $Blackboard__setFinishedColumn_(self, _cmd, newValue)
{ with(self)
{
finishedColumn = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $Blackboard__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Blackboard").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setDraggingExitedBorder");
        var width = CGRectGetWidth(objj_msgSend(self, "bounds")) / 3,
            height = CGRectGetHeight(objj_msgSend(self, "bounds"));


        notStartedColumn = objj_msgSend(objj_msgSend(TaskboardColumn, "alloc"), "initWithFrame:title:parent:", CGRectMake(0,0,width,80), "NOT STARTED", self);
        objj_msgSend(self, "addSubview:", notStartedColumn);
        inProgressColumn = objj_msgSend(objj_msgSend(TaskboardColumn, "alloc"), "initWithFrame:title:parent:", CGRectMake(width,0,width,80), "IN PROGRESS", self);
        objj_msgSend(self, "addSubview:", inProgressColumn);
        finishedColumn = objj_msgSend(objj_msgSend(TaskboardColumn, "alloc"), "initWithFrame:title:parent:", CGRectMake(width + width,0,width,80), "FINISHED", self);
        objj_msgSend(self, "addSubview:", finishedColumn);
        objj_msgSend(self, "registerForDraggedTypes:", [NewStickyNoteDragType]);

        taskList = objj_msgSend(TaskService, "allTask");
  horizontalMargin = 5.0;
  verticalMargin = 5.0;
  originY = 80;
  columnWidth = CGRectGetWidth(objj_msgSend(self, "bounds")) / 3;
  columnHeight = CGRectGetHeight(objj_msgSend(self, "bounds"));
  views = [];
  objj_msgSend(self, "reloadContent");


    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("reloadContent"), function $Blackboard__reloadContent(self, _cmd)
{ with(self)
{
 console.log('reloadContent');
 var index = 0,
  size = 150,
  count = taskList.length;

 for (; index < count; ++index)
 {
  var stickyNote = objj_msgSend(objj_msgSend(StickyNote, "alloc"), "initWithFrame:task:", CGRectMake(0,0,size,size), taskList[index]);
  views.push(stickyNote);
  objj_msgSend(self, "addSubview:", stickyNote);
 }
 objj_msgSend(self, "tile");
}
},["void"]), new objj_method(sel_getUid("tile"), function $Blackboard__tile(self, _cmd)
{ with(self)
{
 var index = 0,
  size = 150;
  count = views.length,
  numberOfColumns = MAX(1.0, FLOOR(columnWidth / size)),
  numberOfRows = MAX(1.0, FLOOR(columnHeight / size)),
  gap = size,
  horizontalMargin = FLOOR((columnWidth - numberOfColumns * size) / (numberOfColumns + 1));

 for (; index < count; ++index)
 {
  var stickyNote = views[index];
  objj_msgSend(stickyNote, "removeFromSuperview");
 }

 index = 0;

 if( count > ( numberOfColumns * numberOfRows))
 {
  gap = FLOOR(size / 3);
 }

 var x = horizontalMargin,
  y = -gap + originY;

 for (; index < count; ++index)
 {
  var stickyNote = views[index];

  if (index % numberOfColumns == 0)
  {
   x = horizontalMargin;
   y += verticalMargin + gap;
   }

  objj_msgSend(self, "addSubview:", stickyNote);
  objj_msgSend(stickyNote, "setFrameOrigin:", CGPointMake(x, y));

  x += size + horizontalMargin;
 }
}
},["void"]), new objj_method(sel_getUid("setDraggingEnteredBorder"), function $Blackboard__setDraggingEnteredBorder(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setBorderType:", CPLineBorder);
    objj_msgSend(self, "setBorderColor:", objj_msgSend(CPColor, "grayColor"));
}
},["void"]), new objj_method(sel_getUid("setDraggingExitedBorder"), function $Blackboard__setDraggingExitedBorder(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setBorderType:", CPNoBorder);
    objj_msgSend(self, "setBorderColor:", nil);
}
},["void"]), new objj_method(sel_getUid("draggingEntered:"), function $Blackboard__draggingEntered_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "setDraggingEnteredBorder");
}
},["void","CPDraggingInfo"]), new objj_method(sel_getUid("draggingExited:"), function $Blackboard__draggingExited_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "setDraggingExitedBorder");
}
},["void","CPDraggingInfo"]), new objj_method(sel_getUid("performDragOperation:"), function $Blackboard__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
 var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(aSender, "draggingLocation"), nil);
 objj_msgSend(self, "setDraggingExitedBorder");
    var data = objj_msgSend(objj_msgSend(aSender, "draggingPasteboard"), "dataForType:", NewStickyNoteDragType),
  aTask = objj_msgSend(Task, "taskWithTitle:", "Task User"),
  stickyNote = objj_msgSend(objj_msgSend(StickyNote, "alloc"), "initWithFrame:task:", CGRectMake(0, 0, 150, 150), aTask);

 objj_msgSend(stickyNote, "setFrameOrigin:", CGPointMake(location.x - CGRectGetWidth(objj_msgSend(stickyNote, "frame")) / 2.0, location.y - CGRectGetHeight(objj_msgSend(stickyNote, "frame")) / 2.0));
    views.push(stickyNote);
 taskList.push(aTask);
 objj_msgSend(self, "addSubview:", stickyNote);

}
},["void","CPDraggingInfo"]), new objj_method(sel_getUid("drawRect:"), function $Blackboard__drawRect_(self, _cmd, aRect)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        width = CGRectGetWidth(bounds)/3,
        height = CGRectGetHeight(bounds);

        CGContextSetLineWidth(context, 3);
        CGContextStrokeLineSegments(context,
                                    [CGPointMake(width, 0),
                                            CGPointMake(width, height),
                                        CGPointMake(width + width, 0),
                                            CGPointMake(width + width, height)],
                                    4);
}
},["void","CPRect"])]);
}

{var the_class = objj_allocateClassPair(CPBox, "TaskboardNavigationArea"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $TaskboardNavigationArea__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TaskboardNavigationArea").super_class }, "initWithFrame:", aFrame);
    if (self)
    {


    }
    return self;
}
},["id","CGRect"])]);
}

{var the_class = objj_allocateClassPair(CPBox, "StatusTaskPanel"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $StatusTaskPanel__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StatusTaskPanel").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "yellowColor"));
        objj_msgSend(self, "addSubview:", objj_msgSend(CPShadowView, "shadowViewEnclosingView:withWeight:", objj_msgSend(StatusTask, "withFrame:status:color:", CGRectMake(3, 3, 65, 40), "PLEASE \n ANALYSE", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 1.0, 0.0, 1.0, 0.7)), CPLightShadow));
        objj_msgSend(self, "addSubview:", objj_msgSend(CPShadowView, "shadowViewEnclosingView:withWeight:", objj_msgSend(StatusTask, "withFrame:status:color:", CGRectMake(68, 3, 65, 40), "PLEASE \n TEST", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 1.0, 0.4, 0.2, 0.7)), CPLightShadow));
        objj_msgSend(self, "addSubview:", objj_msgSend(CPShadowView, "shadowViewEnclosingView:withWeight:", objj_msgSend(StatusTask, "withFrame:status:color:", CGRectMake(68*2, 3, 65, 40), "DONE", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 70 / 255, 130 / 255, 180 / 255, 0.7)), CPLightShadow));
        objj_msgSend(self, "addSubview:", objj_msgSend(CPShadowView, "shadowViewEnclosingView:withWeight:", objj_msgSend(StatusTask, "withFrame:status:color:", CGRectMake(68*3, 3, 65, 40), "BLOCKED", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 112 / 255, 147 / 255, 219 / 255, 0.7)), CPLightShadow));
        objj_msgSend(self, "addSubview:", objj_msgSend(CPShadowView, "shadowViewEnclosingView:withWeight:", objj_msgSend(StatusTask, "withFrame:status:color:", CGRectMake(3, 50, 65, 40), "HIGH \n PRIORITY", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 255 / 255, 16 / 255, 16 / 255, 0.7)), CPLightShadow));
        objj_msgSend(self, "addSubview:", objj_msgSend(CPShadowView, "shadowViewEnclosingView:withWeight:", objj_msgSend(StatusTask, "withFrame:status:color:", CGRectMake(68, 50, 65, 40), "WAITING", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 255 / 255, 165 / 255, 79 / 255, 0.7)), CPLightShadow));
        objj_msgSend(self, "addSubview:", objj_msgSend(CPShadowView, "shadowViewEnclosingView:withWeight:", objj_msgSend(StatusTask, "withFrame:status:color:", CGRectMake(68*2, 50, 65, 40), "DELEGATED", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 193 / 255, 255 / 255, 193 / 255, 0.7)), CPLightShadow));
        objj_msgSend(self, "addSubview:", objj_msgSend(CPShadowView, "shadowViewEnclosingView:withWeight:", objj_msgSend(StatusTask, "withFrame:status:color:", CGRectMake(68*3, 50, 65, 40), "BUG", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 85 / 255, 107 / 255, 47 / 255, 0.7)), CPLightShadow));
    }
    return self;
}
},["id","CGRect"])]);
}

{var the_class = objj_allocateClassPair(CPBox, "TaskboardMetadataArea"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $TaskboardMetadataArea__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TaskboardMetadataArea").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "yellowColor"));

    }
    return self;
}
},["id","CGRect"])]);
}

NewStickyNoteDragType = "NewStickyNoteDragType";

{var the_class = objj_allocateClassPair(CPView, "NewStickyNote"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $NewStickyNote__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NewStickyNote").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        var width = CGRectGetWidth(objj_msgSend(self, "bounds")),
            height = CGRectGetHeight(objj_msgSend(self, "bounds"));

        var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,height * (1 / 3),width,height * (2 / 3)));
        objj_msgSend(label, "setStringValue:", "New Task");
        objj_msgSend(label, "setEditable:", NO);
        objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 14.0));
        objj_msgSend(label, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(label, "setCenter:", CGPointMake(width / 2, height / 2));
        objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(label, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "customBackgroundImageColor"));
        objj_msgSend(self, "setAlphaValue:", 0.8);
        objj_msgSend(self, "addSubview:", label);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("customBackgroundImageColor"), function $NewStickyNote__customBackgroundImageColor(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class")),
        backgroundImage = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/top-left.png"), CPSizeMake(10.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/top.png"), CPSizeMake(1.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/top-right.png"), CPSizeMake(10.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/left.png"), CPSizeMake(10.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/center.png"), CPSizeMake(1.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/right.png"), CPSizeMake(10.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/bottom-left.png"), CPSizeMake(10.0, 12.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/bottom.png"), CPSizeMake(1.0, 12.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "yellow/bottom-right.png"), CPSizeMake(10.0, 12.0)),
        ]));

    return backgroundImage;
}
},["CPColor"]), new objj_method(sel_getUid("mouseDragged:"), function $NewStickyNote__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
            bounds = CGRectMake(0, 0, 30, 30);
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", NewStickyNoteDragType), self);

    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:",  objj_msgSend(self, "mutableCopy"),  CPPointMakeZero(),  CPPointMake(0.0, 0.0),  anEvent,  nil,  self,  YES);
    }
},["void","CPEvent"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $NewStickyNote__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{ with(self)
{

    if(aType == NewStickyNoteDragType)
        objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(self, "mutableCopy"), aType);
}
},["void","CPPasteboard","CPString"]), new objj_method(sel_getUid("mutableCopy"), function $NewStickyNote__mutableCopy(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(NewStickyNote, "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
}
},["id"])]);
}

