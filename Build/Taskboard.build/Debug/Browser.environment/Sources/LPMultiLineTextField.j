@STATIC;1.0;I;20;AppKit/CPTextField.jt;11247;objj_executeFile("AppKit/CPTextField.j", NO);
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

