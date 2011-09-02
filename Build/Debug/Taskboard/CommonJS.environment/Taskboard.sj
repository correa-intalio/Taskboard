@STATIC;1.0;p;15;AppController.jt;1177;@STATIC;1.0;I;21;Foundation/CPObject.ji;12;StickyNote.ji;11;Taskboard.ji;13;WindowUtils.jt;1081;objj_executeFile("Foundation/CPObject.j", NO);
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

p;11;Container.jt;691;@STATIC;1.0;I;14;AppKit/CPBox.ji;12;StickyNote.jt;637;

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

p;22;LPMultiLineTextField.jt;11292;@STATIC;1.0;I;20;AppKit/CPTextField.jt;11247;objj_executeFile("AppKit/CPTextField.j", NO);
var CPTextFieldInputOwner = nil;
{var the_class = objj_allocateClassPair(CPTextField, "LPMultiLineTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMTextareaElement"), new objj_ivar("_stringValue"), new objj_ivar("_hideOverflow")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_DOMTextareaElement"), function $LPMultiLineTextField___DOMTextareaElement(self, _cmd)
{ with(self)
{
    if (!_DOMTextareaElement)
    {
        _DOMTextareaElement = document.createElement("textarea");
        _DOMTextareaElement.style.position = "absolute";
        _DOMTextareaElement.style.background = "none";
        _DOMTextareaElement.style.border = "0";
        _DOMTextareaElement.style.outline = "0";
        _DOMTextareaElement.style.zIndex = "100";
        _DOMTextareaElement.style.resize = "none";
        _DOMTextareaElement.style.padding = "0";
        _DOMTextareaElement.style.margin = "0";
        _DOMTextareaElement.onblur = function(){
                objj_msgSend(objj_msgSend(CPTextFieldInputOwner, "window"), "makeFirstResponder:", nil);
                CPTextFieldInputOwner = nil;
            };
        self._DOMElement.appendChild(_DOMTextareaElement);
    }
    return _DOMTextareaElement;
}
},["DOMElement"]), new objj_method(sel_getUid("initWithFrame:"), function $LPMultiLineTextField__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("LPMultiLineTextField").super_class }, "initWithFrame:", aFrame))
    {
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("isScrollable"), function $LPMultiLineTextField__isScrollable(self, _cmd)
{ with(self)
{
   return !_hideOverflow;
}
},["BOOL"]), new objj_method(sel_getUid("setScrollable:"), function $LPMultiLineTextField__setScrollable_(self, _cmd, shouldScroll)
{ with(self)
{
    _hideOverflow = !shouldScroll;
}
},["void","BOOL"]), new objj_method(sel_getUid("setEditable:"), function $LPMultiLineTextField__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    objj_msgSend(self, "_DOMTextareaElement").style.cursor = shouldBeEditable ? "cursor" : "default";
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("LPMultiLineTextField").super_class }, "setEditable:", shouldBeEditable);
}
},["void","BOOL"]), new objj_method(sel_getUid("selectText:"), function $LPMultiLineTextField__selectText_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "_DOMTextareaElement").select();
}
},["void","id"]), new objj_method(sel_getUid("layoutSubviews"), function $LPMultiLineTextField__layoutSubviews(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("LPMultiLineTextField").super_class }, "layoutSubviews");
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    objj_msgSend(contentView, "setHidden:", YES);
    var DOMElement = objj_msgSend(self, "_DOMTextareaElement"),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        bounds = objj_msgSend(self, "bounds");
    DOMElement.style.top = contentInset.top + "px";
    DOMElement.style.bottom = contentInset.bottom + "px";
    DOMElement.style.left = contentInset.left + "px";
    DOMElement.style.right = contentInset.right + "px";
    DOMElement.style.width = (CGRectGetWidth(bounds) - contentInset.left - contentInset.right) + "px";
    DOMElement.style.height = (CGRectGetHeight(bounds) - contentInset.top - contentInset.bottom) + "px";
    DOMElement.style.color = objj_msgSend(objj_msgSend(self, "currentValueForThemeAttribute:", "text-color"), "cssString");
    DOMElement.style.font = objj_msgSend(objj_msgSend(self, "currentValueForThemeAttribute:", "font"), "cssString");
    switch (objj_msgSend(self, "currentValueForThemeAttribute:", "alignment"))
    {
        case CPLeftTextAlignment:
            DOMElement.style.textAlign = "left";
            break;
        case CPJustifiedTextAlignment:
            DOMElement.style.textAlign = "justify";
            break;
        case CPCenterTextAlignment:
            DOMElement.style.textAlign = "center";
            break;
        case CPRightTextAlignment:
            DOMElement.style.textAlign = "right";
            break;
        default:
            DOMElement.style.textAlign = "left";
    }
    DOMElement.value = _stringValue || "";
    if(_hideOverflow)
        DOMElement.style.overflow="hidden";
}
},["void"]), new objj_method(sel_getUid("scrollWheel:"), function $LPMultiLineTextField__scrollWheel_(self, _cmd, anEvent)
{ with(self)
{
    var DOMElement = objj_msgSend(self, "_DOMTextareaElement");
    DOMElement.scrollLeft += anEvent._deltaX;
    DOMElement.scrollTop += anEvent._deltaY;
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $LPMultiLineTextField__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled"))
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("LPMultiLineTextField").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $LPMultiLineTextField__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(anEvent, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("keyDown:"), function $LPMultiLineTextField__keyDown_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "keyCode") === CPTabKeyCode)
    {
        if (objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask)
            objj_msgSend(objj_msgSend(self, "window"), "selectPreviousKeyView:", self);
        else
            objj_msgSend(objj_msgSend(self, "window"), "selectNextKeyView:", self);
        if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "firstResponder"), "respondsToSelector:", sel_getUid("selectText:")))
            objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "firstResponder"), "selectText:", self);
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", NO);
    }
    else
        objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void","CPEvent"]), new objj_method(sel_getUid("keyUp:"), function $LPMultiLineTextField__keyUp_(self, _cmd, anEvent)
{ with(self)
{
    if (_stringValue !== objj_msgSend(self, "stringValue"))
    {
        _stringValue = objj_msgSend(self, "stringValue");
        if (!_isEditing)
        {
            _isEditing = YES;
            objj_msgSend(self, "textDidBeginEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, nil));
        }
        objj_msgSend(self, "textDidChange:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, self, nil));
    }
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $LPMultiLineTextField__performKeyEquivalent_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "platformWindow"), "_propagateCurrentDOMEvent:", YES);
    return YES;
}
},["BOOL","CPEvent"]), new objj_method(sel_getUid("becomeFirstResponder"), function $LPMultiLineTextField__becomeFirstResponder(self, _cmd)
{ with(self)
{
    _stringValue = objj_msgSend(self, "stringValue");
    objj_msgSend(self, "setThemeState:", CPThemeStateEditing);
    setTimeout(function(){
        objj_msgSend(self, "_DOMTextareaElement").focus();
        CPTextFieldInputOwner = self;
    }, 0.0);
    objj_msgSend(self, "textDidFocus:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPTextFieldDidFocusNotification, self, nil));
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function $LPMultiLineTextField__resignFirstResponder(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "unsetThemeState:", CPThemeStateEditing);
    objj_msgSend(self, "setStringValue:", objj_msgSend(self, "stringValue"));
    objj_msgSend(self, "_DOMTextareaElement").blur();
    if (_isEditing)
    {
        _isEditing = NO;
        objj_msgSend(self, "textDidEndEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidEndEditingNotification, self, nil));
        if (objj_msgSend(self, "sendsActionOnEndEditing"))
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    }
    objj_msgSend(self, "textDidBlur:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPTextFieldDidBlurNotification, self, nil));
    return YES;
}
},["BOOL"]), new objj_method(sel_getUid("stringValue"), function $LPMultiLineTextField__stringValue(self, _cmd)
{ with(self)
{
    return (!!_DOMTextareaElement) ? _DOMTextareaElement.value : "";
}
},["CPString"]), new objj_method(sel_getUid("setStringValue:"), function $LPMultiLineTextField__setStringValue_(self, _cmd, aString)
{ with(self)
{
    _stringValue = aString;
    objj_msgSend(self, "setNeedsLayout");
}
},["void","CPString"])]);
}
var LPMultiLineTextFieldStringValueKey = "LPMultiLineTextFieldStringValueKey",
    LPMultiLineTextFieldScrollableKey = "LPMultiLineTextFieldScrollableKey";
{
var the_class = objj_getClass("LPMultiLineTextField")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"LPMultiLineTextField\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $LPMultiLineTextField__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("LPMultiLineTextField").super_class }, "initWithCoder:", aCoder))
    {
        objj_msgSend(self, "setStringValue:", objj_msgSend(aCoder, "decodeObjectForKey:", LPMultiLineTextFieldStringValueKey));
        objj_msgSend(self, "setScrollable:", objj_msgSend(aCoder, "decodeBoolForKey:", LPMultiLineTextFieldScrollableKey));
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $LPMultiLineTextField__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("LPMultiLineTextField").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _stringValue, LPMultiLineTextFieldStringValueKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", (_hideOverflow?NO:YES), LPMultiLineTextFieldScrollableKey);
}
},["void","CPCoder"])]);
}

p;6;main.jt;295;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;209;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
objj_executeFile("AppController.j", YES);
main= function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}

p;12;StatusTask.jt;5855;@STATIC;1.0;t;5836;


StatusTaskDragType = "StatusTaskDragType"

{var the_class = objj_allocateClassPair(CPBox, "StatusTask"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("status"), new objj_ivar("color"), new objj_ivar("gradient"), new objj_ivar("color1"), new objj_ivar("color2"), new objj_ivar("orientation")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("status"), function $StatusTask__status(self, _cmd)
{ with(self)
{
return status;
}
},["id"]),
new objj_method(sel_getUid("setStatus:"), function $StatusTask__setStatus_(self, _cmd, newValue)
{ with(self)
{
status = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("color"), function $StatusTask__color(self, _cmd)
{ with(self)
{
return color;
}
},["id"]),
new objj_method(sel_getUid("setColor:"), function $StatusTask__setColor_(self, _cmd, newValue)
{ with(self)
{
color = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("orientation"), function $StatusTask__orientation(self, _cmd)
{ with(self)
{
return orientation;
}
},["id"]),
new objj_method(sel_getUid("setOrientation:"), function $StatusTask__setOrientation_(self, _cmd, newValue)
{ with(self)
{
orientation = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:status:color:"), function $StatusTask__initWithFrame_status_color_(self, _cmd, aFrame, aStatus, aColor)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StatusTask").super_class }, "initWithFrame:", aFrame);

    if (self)
    {
        color = aColor;
        status = aStatus;
        var width = [objj_msgSend(self, "bounds").size.width],
            height = [objj_msgSend(self, "bounds").size.height];

        objj_msgSend(self, "setColor1:", color);
        objj_msgSend(self, "setColor2:", color);

        objj_msgSend(self, "setBorderType:", CPLineBorder);
        objj_msgSend(self, "setBorderColor:", objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(self, "setCornerRadius:", 3);
        var textFiel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,300,0));
        objj_msgSend(textFiel, "setStringValue:", status);
        objj_msgSend(textFiel, "setEditable:", NO);
        objj_msgSend(textFiel, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(textFiel, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 10.0));
        objj_msgSend(textFiel, "sizeToFit");

        objj_msgSend(self, "addSubview:", textFiel);
    }
    return self;
}
},["id","CGRect","CPString","CPColor"]), new objj_method(sel_getUid("mouseDragged:"), function $StatusTask__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
            bounds = CGRectMake(0, 0, 30, 30);

    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", StatusTaskDragType), self);

    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:",  objj_msgSend(self, "mutableCopy"),  CPPointMakeZero(),  CPPointMake(0.0, 0.0),  anEvent,  nil,  self,  YES);
    }
},["void","CPEvent"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $StatusTask__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{ with(self)
{

    if(aType == StatusTaskDragType)
        objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(self, "mutableCopy"), aType);
}
},["void","CPPasteboard","CPString"]), new objj_method(sel_getUid("setColor1:"), function $StatusTask__setColor1_(self, _cmd, aColor)
{ with(self)
{
    color1 = aColor;
    if (color2);
        objj_msgSend(self, "createGradient");
}
},["void","CPColor"]), new objj_method(sel_getUid("setColor2:"), function $StatusTask__setColor2_(self, _cmd, aColor)
{ with(self)
{
    color2 = aColor;
    if (color1);
        objj_msgSend(self, "createGradient");
}
},["void","CPColor"]), new objj_method(sel_getUid("createGradient"), function $StatusTask__createGradient(self, _cmd)
{ with(self)
{
    gradient = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), [objj_msgSend(color1, "redComponent"),objj_msgSend(color1, "greenComponent"),objj_msgSend(color1, "blueComponent"),objj_msgSend(color1, "alphaComponent"),objj_msgSend(color2, "redComponent"),objj_msgSend(color2, "greenComponent"),objj_msgSend(color2, "blueComponent"),objj_msgSend(color2, "alphaComponent")], [0,1], 2);
}
},["void"]), new objj_method(sel_getUid("drawRect:"), function $StatusTask__drawRect_(self, _cmd, rect)
{ with(self)
{
    if (gradient) {
        var targetPoint;
        if (orientation)
            targetPoint = (orientation == "vertical") ? CGPointMake(CGRectGetWidth(rect), 0) : CGPointMake(0, CGRectGetHeight(rect));
        else
            targetPoint = CGPointMake(0, CGRectGetHeight(rect));

        var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
        CGContextAddRect(context, rect);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), targetPoint);
    }
}
},["void","CGRect"]), new objj_method(sel_getUid("mutableCopy"), function $StatusTask__mutableCopy(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(StatusTask, "alloc"), "initWithFrame:status:color:", objj_msgSend(self, "frame"), objj_msgSend(self, "status"), objj_msgSend(self, "color"));
}
},["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("withFrame:status:color:"), function $StatusTask__withFrame_status_color_(self, _cmd, aFrame, aStatus, aColor)
{ with(self)
{
    return objj_msgSend(objj_msgSend(StatusTask, "alloc"), "initWithFrame:status:color:", aFrame, aStatus, aColor);
}
},["id","CGRect","CPString","CPColor"])]);
}

p;12;StickyNote.jt;9557;@STATIC;1.0;i;22;LPMultiLineTextField.jt;9511;

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

p;6;Task.jt;2751;@STATIC;1.0;t;2732;


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

p;11;Taskboard.jt;25921;@STATIC;1.0;I;14;AppKit/CPBox.ji;6;Task.ji;6;User.ji;12;StatusTask.ji;13;TaskService.jt;25827;

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

p;13;TaskService.jt;952;@STATIC;1.0;I;21;Foundation/CPObject.ji;6;Task.jt;898;

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

p;6;User.jt;1729;@STATIC;1.0;i;6;Task.jt;1700;

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

p;13;WindowUtils.jt;1054;@STATIC;1.0;I;21;Foundation/CPObject.jI;16;AppKit/CPPanel.jt;989;

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

p;22;Test/TaskServiceTest.jt;549;@STATIC;1.0;i;16;../TaskService.jt;510;

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

e;