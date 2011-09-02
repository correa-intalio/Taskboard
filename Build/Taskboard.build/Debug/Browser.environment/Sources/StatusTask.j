@STATIC;1.0;t;5836;


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

