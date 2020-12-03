var _____WB$wombat$assign$function_____ = function(name) {return (self._wb_wombat && self._wb_wombat.local_init && self._wb_wombat.local_init(name)) || self[name]; };
if (!self.__WB_pmw) { self.__WB_pmw = function(obj) { this.__WB_source = obj; return this; } }
{
  let window = _____WB$wombat$assign$function_____("window");
  let self = _____WB$wombat$assign$function_____("self");
  let document = _____WB$wombat$assign$function_____("document");
  let location = _____WB$wombat$assign$function_____("location");
  let top = _____WB$wombat$assign$function_____("top");
  let parent = _____WB$wombat$assign$function_____("parent");
  let frames = _____WB$wombat$assign$function_____("frames");
  let opener = _____WB$wombat$assign$function_____("opener");

try{if(Sys.Browser.agent==Sys.Browser.InternetExplorer){document.execCommand("BackgroundImageCache",false,true);
}}catch(err){}Type.registerNamespace("Telerik.Web.UI");
window.$telerik=window.TelerikCommonScripts=Telerik.Web.CommonScripts={cloneJsObject:function(b,a){if(!a){a={};
}for(var c in b){var d=b[c];
a[c]=(d instanceof Array)?Array.clone(d):d;
}return a;
},isCloned:function(){return this._isCloned;
},cloneControl:function(a,c,b){if(!a){return null;
}if(!c){c=Object.getType(a);
}var d=a.__clonedProperties__;
if(null==d){d=a.__clonedProperties__=$telerik._getPropertiesParameter(a,c);
}if(!b){b=a.get_element().cloneNode(true);
b.removeAttribute("control");
b.removeAttribute("id");
}var f=$create(c,d,null,null,b);
var e=$telerik.cloneJsObject(a.get_events());
f._events=e;
f._events._list=$telerik.cloneJsObject(f._events._list);
f._isCloned=true;
f.isCloned=$telerik.isCloned;
return f;
},_getPropertiesParameter:function(a,g){var c={};
var d=g.prototype;
for(var h in d){var e=a[h];
if(typeof(e)=="function"&&h.indexOf("get_")==0){var b=h.substring(4);
if(null==a["set_"+b]){continue;
}var f=e.call(a);
if(null==f){continue;
}c[b]=f;
}}delete c.clientStateFieldID;
delete c.id;
return c;
},getOuterSize:function(c){var b=$telerik.getSize(c);
var a=$telerik.getMarginBox(c);
return{width:b.width+a.left+a.right,height:b.height+a.top+a.bottom};
},getOuterBounds:function(c){var b=$telerik.getBounds(c);
var a=$telerik.getMarginBox(c);
return{x:b.x-a.left,y:b.y-a.top,width:b.width+a.left+a.right,height:b.height+a.top+a.bottom};
},getInvisibleParent:function(a){while(a&&a!=document){if("none"==$telerik.getCurrentStyle(a,"display","")){return a;
}a=a.parentNode;
}return null;
},scrollIntoView:function(a){if(!a||!a.parentNode){return;
}var b=null;
var c=0;
var d=a.parentNode;
while(d!=null){if(d.tagName=="BODY"){var e=d.ownerDocument;
if(!$telerik.isIE&&e.defaultView&&e.defaultView.frameElement){c=e.defaultView.frameElement.offsetHeight;
}b=d;
break;
}var f=$telerik.getCurrentStyle(d,"overflowY");
if(f=="scroll"||f=="auto"){b=d;
break;
}d=d.parentNode;
}if(!b){return;
}if(!c){c=b.offsetHeight;
}if(c<a.offsetTop+a.offsetHeight){b.scrollTop=(a.offsetTop+a.offsetHeight)-c;
}else{if(a.offsetTop<b.scrollTop){b.scrollTop=a.offsetTop;
}}},isRightToLeft:function(a){while(a&&a.nodeType!==9){var b=$telerik.getCurrentStyle(a,"direction");
if(a.dir=="rtl"||b=="rtl"){return true;
}if(a.dir=="ltr"||b=="ltr"){return false;
}a=a.parentNode;
}return false;
},getCorrectScrollLeft:function(a){if($telerik.isRightToLeft(a)){return -(a.scrollWidth-a.offsetWidth-Math.abs(a.scrollLeft));
}else{return a.scrollLeft;
}},_borderStyleNames:["borderTopStyle","borderRightStyle","borderBottomStyle","borderLeftStyle"],_borderWidthNames:["borderTopWidth","borderRightWidth","borderBottomWidth","borderLeftWidth"],_paddingWidthNames:["paddingTop","paddingRight","paddingBottom","paddingLeft"],_marginWidthNames:["marginTop","marginRight","marginBottom","marginLeft"],radControls:[],registerControl:function(a){if(!Array.contains(this.radControls,a)){Array.add(this.radControls,a);
}},unregisterControl:function(a){Array.remove(this.radControls,a);
},repaintChildren:function(a){var b=a.get_element?a.get_element():a;
for(var e=0,c=this.radControls.length;
e<c;
e++){var d=this.radControls[e];
if(d.repaint&&this.isDescendant(b,d.get_element())){d.repaint();
}}},_borderThickness:function(){$telerik._borderThicknesses={};
var a=document.createElement("div");
var b=document.createElement("div");
a.style.visibility="hidden";
a.style.position="absolute";
a.style.fontSize="1px";
b.style.height="0px";
b.style.overflow="hidden";
document.body.appendChild(a).appendChild(b);
var c=a.offsetHeight;
b.style.borderTop="solid black";
b.style.borderTopWidth="thin";
$telerik._borderThicknesses.thin=a.offsetHeight-c;
b.style.borderTopWidth="medium";
$telerik._borderThicknesses.medium=a.offsetHeight-c;
b.style.borderTopWidth="thick";
$telerik._borderThicknesses.thick=a.offsetHeight-c;
if(typeof(a.removeChild)!=="undefined"){a.removeChild(b);
}document.body.removeChild(a);
if(!$telerik.isSafari){b.outerHTML=null;
}if(!$telerik.isSafari){a.outerHTML=null;
}a=null;
b=null;
},getCurrentStyle:function(d,e,c){var b=null;
if(d){if(d.currentStyle){b=d.currentStyle[e];
}else{if(document.defaultView&&document.defaultView.getComputedStyle){var a=document.defaultView.getComputedStyle(d,null);
if(a){b=a[e];
}}}if(!b&&d.style.getPropertyValue){b=d.style.getPropertyValue(e);
}else{if(!b&&d.style.getAttribute){b=d.style.getAttribute(e);
}}}if((!b||b==""||typeof(b)==="undefined")){if(typeof(c)!="undefined"){b=c;
}else{b=null;
}}return b;
},getLocation:function(t){if(t===document.documentElement){return new Sys.UI.Point(0,0);
}if(Sys.Browser.agent==Sys.Browser.InternetExplorer){if(t.window===t||t.nodeType===9||!t.getClientRects||!t.getBoundingClientRect){return new Sys.UI.Point(0,0);
}var B=t.getClientRects();
if(!B||!B.length){return new Sys.UI.Point(0,0);
}var j=B[0];
var C=0;
var w=0;
var v=false;
try{v=t.ownerDocument.parentWindow.frameElement;
}catch(f){v=true;
}if(v){var c=t.getBoundingClientRect();
if(!c){return new Sys.UI.Point(0,0);
}var z=j.left;
var p=j.top;
for(var l=1;
l<B.length;
l++){var m=B[l];
if(m.left<z){z=m.left;
}if(m.top<p){p=m.top;
}}C=z-c.left;
w=p-c.top;
}var y=t.document.documentElement;
var e=0;
if(Sys.Browser.version<8||$telerik.quirksMode){var D=1;
if(v&&v.getAttribute){var g=v.getAttribute("frameborder");
if(g!=null){D=parseInt(g,10);
if(isNaN(D)){D=g.toLowerCase()=="no"?0:1;
}}}e=2*D;
}var H=new Sys.UI.Point(j.left-e-C+$telerik.getCorrectScrollLeft(y),j.top-e-w+y.scrollTop);
if($telerik.quirksMode){H.x+=$telerik.getCorrectScrollLeft(document.body);
H.y+=document.body.scrollTop;
}return H;
}var H=Sys.UI.DomElement.getLocation(t);
if($telerik.isOpera){var d=$telerik.getCurrentStyle(t,"display");
if(d!="inline"){var A=t.parentNode;
}else{var A=t.offsetParent;
}while(A){var b=A.tagName.toUpperCase();
if(b=="BODY"||b=="HTML"){break;
}if(b=="TABLE"&&A.parentNode&&A.parentNode.style.display=="inline-block"){var E=A.offsetLeft;
var h=A.style.display;
A.style.display="inline-block";
if(A.offsetLeft>E){H.x+=A.offsetLeft-E;
}A.style.display=h;
}H.x-=$telerik.getCorrectScrollLeft(A);
H.y-=A.scrollTop;
if(d!="inline"){A=A.parentNode;
}else{A=A.offsetParent;
}}}var o=Math.max(document.documentElement.scrollTop,document.body.scrollTop);
var q=Math.max(document.documentElement.scrollLeft,document.body.scrollLeft);
if(!$telerik.isOpera){var F=t;
while(F){if($telerik.getCurrentStyle(F,"position")=="fixed"){H.y+=o;
H.x+=q;
o=0;
q=0;
break;
}F=F.offsetParent;
}}if($telerik.isSafari){if(o>0||q>0){var x=document.documentElement.getElementsByTagName("form");
if(x&&x.length>0){var k=Sys.UI.DomElement.getLocation(x[0]);
if(k.y&&k.y<0){H.y+=o;
}if(k.x&&k.x<0){H.x+=q;
}}}var A=t.parentNode;
var s=null;
var a=null;
while(A&&A.tagName.toUpperCase()!="BODY"&&A.tagName.toUpperCase()!="HTML"){if(A.tagName.toUpperCase()=="TD"){s=A;
}else{if(A.tagName.toUpperCase()=="TABLE"){a=A;
}else{var n=$telerik.getCurrentStyle(A,"position");
if(n=="absolute"||n=="relative"){var u=$telerik.getCurrentStyle(A,"borderTopWidth",0);
var G=$telerik.getCurrentStyle(A,"borderLeftWidth",0);
H.x+=parseInt(u);
H.y+=parseInt(G);
}}}var n=$telerik.getCurrentStyle(A,"position");
if(n=="absolute"||n=="relative"){H.x-=A.scrollLeft;
H.y-=A.scrollTop;
}if(s&&a){H.x+=parseInt($telerik.getCurrentStyle(a,"borderTopWidth"),0);
H.y+=parseInt($telerik.getCurrentStyle(a,"borderLeftWidth",0));
if($telerik.getCurrentStyle(a,"borderCollapse")!="collapse"){H.x+=parseInt($telerik.getCurrentStyle(s,"borderTopWidth",0));
H.y+=parseInt($telerik.getCurrentStyle(s,"borderLeftWidth",0));
}s=null;
a=null;
}else{if(a){if($telerik.getCurrentStyle(a,"borderCollapse")!="collapse"){H.x+=parseInt($telerik.getCurrentStyle(a,"borderTopWidth",0));
H.y+=parseInt($telerik.getCurrentStyle(a,"borderLeftWidth",0));
}a=null;
}}A=A.parentNode;
}}return H;
},setLocation:function(a,b){Sys.UI.DomElement.setLocation(a,b.x,b.y);
},findControl:function(e,d){var c=e.getElementsByTagName("*");
for(var a=0,b=c.length;
a<b;
a++){var f=c[a].id;
if(f&&f.endsWith(d)){return $find(f);
}}return null;
},findElement:function(e,d){var c=e.getElementsByTagName("*");
for(var a=0,b=c.length;
a<b;
a++){var f=c[a].id;
if(f&&f.endsWith(d)){return $get(f);
}}return null;
},getContentSize:function(d){if(!d){throw Error.argumentNull("element");
}var c=$telerik.getSize(d);
var b=$telerik.getBorderBox(d);
var a=$telerik.getPaddingBox(d);
return{width:c.width-b.horizontal-a.horizontal,height:c.height-b.vertical-a.vertical};
},getSize:function(a){if(!a){throw Error.argumentNull("element");
}return{width:a.offsetWidth,height:a.offsetHeight};
},setContentSize:function(d,c){if(!d){throw Error.argumentNull("element");
}if(!c){throw Error.argumentNull("size");
}if($telerik.getCurrentStyle(d,"MozBoxSizing")=="border-box"||$telerik.getCurrentStyle(d,"BoxSizing")=="border-box"){var b=$telerik.getBorderBox(d);
var a=$telerik.getPaddingBox(d);
c={width:c.width+b.horizontal+a.horizontal,height:c.height+b.vertical+a.vertical};
}d.style.width=c.width.toString()+"px";
d.style.height=c.height.toString()+"px";
},setSize:function(e,c){if(!e){throw Error.argumentNull("element");
}if(!c){throw Error.argumentNull("size");
}var b=$telerik.getBorderBox(e);
var a=$telerik.getPaddingBox(e);
var d={width:c.width-b.horizontal-a.horizontal,height:c.height-b.vertical-a.vertical};
$telerik.setContentSize(e,d);
},getBounds:function(a){var b=$telerik.getLocation(a);
return new Sys.UI.Bounds(b.x,b.y,a.offsetWidth||0,a.offsetHeight||0);
},setBounds:function(a,b){if(!a){throw Error.argumentNull("element");
}if(!b){throw Error.argumentNull("bounds");
}$telerik.setSize(a,b);
$telerik.setLocation(a,b);
},getClientBounds:function(){var b;
var a;
switch(Sys.Browser.agent){case Sys.Browser.InternetExplorer:b=document.documentElement.clientWidth;
a=document.documentElement.clientHeight;
if(b==0&&a==0){b=document.body.clientWidth;
a=document.body.clientHeight;
}break;
case Sys.Browser.Safari:b=window.innerWidth;
a=window.innerHeight;
break;
case Sys.Browser.Opera:if(Sys.Browser.version>=9.5){b=Math.min(window.innerWidth,document.documentElement.clientWidth);
a=Math.min(window.innerHeight,document.documentElement.clientHeight);
}else{b=Math.min(window.innerWidth,document.body.clientWidth);
a=Math.min(window.innerHeight,document.body.clientHeight);
}break;
default:b=Math.min(window.innerWidth,document.documentElement.clientWidth);
a=Math.min(window.innerHeight,document.documentElement.clientHeight);
break;
}return new Sys.UI.Bounds(0,0,b,a);
},getMarginBox:function(a){if(!a){throw Error.argumentNull("element");
}var b={top:$telerik.getMargin(a,Telerik.Web.BoxSide.Top),right:$telerik.getMargin(a,Telerik.Web.BoxSide.Right),bottom:$telerik.getMargin(a,Telerik.Web.BoxSide.Bottom),left:$telerik.getMargin(a,Telerik.Web.BoxSide.Left)};
b.horizontal=b.left+b.right;
b.vertical=b.top+b.bottom;
return b;
},getPaddingBox:function(a){if(!a){throw Error.argumentNull("element");
}var b={top:$telerik.getPadding(a,Telerik.Web.BoxSide.Top),right:$telerik.getPadding(a,Telerik.Web.BoxSide.Right),bottom:$telerik.getPadding(a,Telerik.Web.BoxSide.Bottom),left:$telerik.getPadding(a,Telerik.Web.BoxSide.Left)};
b.horizontal=b.left+b.right;
b.vertical=b.top+b.bottom;
return b;
},getBorderBox:function(a){if(!a){throw Error.argumentNull("element");
}var b={top:$telerik.getBorderWidth(a,Telerik.Web.BoxSide.Top),right:$telerik.getBorderWidth(a,Telerik.Web.BoxSide.Right),bottom:$telerik.getBorderWidth(a,Telerik.Web.BoxSide.Bottom),left:$telerik.getBorderWidth(a,Telerik.Web.BoxSide.Left)};
b.horizontal=b.left+b.right;
b.vertical=b.top+b.bottom;
return b;
},isBorderVisible:function(c,b){if(!c){throw Error.argumentNull("element");
}if(b<Telerik.Web.BoxSide.Top||b>Telerik.Web.BoxSide.Left){throw Error.argumentOutOfRange(String.format(Sys.Res.enumInvalidValue,b,"Telerik.Web.BoxSide"));
}var a=$telerik._borderStyleNames[b];
var d=$telerik.getCurrentStyle(c,a);
return d!="none";
},getMargin:function(c,b){if(!c){throw Error.argumentNull("element");
}if(b<Telerik.Web.BoxSide.Top||b>Telerik.Web.BoxSide.Left){throw Error.argumentOutOfRange(String.format(Sys.Res.enumInvalidValue,b,"Telerik.Web.BoxSide"));
}var a=$telerik._marginWidthNames[b];
var d=$telerik.getCurrentStyle(c,a);
try{return $telerik.parsePadding(d);
}catch(e){return 0;
}},getBorderWidth:function(c,b){if(!c){throw Error.argumentNull("element");
}if(b<Telerik.Web.BoxSide.Top||b>Telerik.Web.BoxSide.Left){throw Error.argumentOutOfRange(String.format(Sys.Res.enumInvalidValue,b,"Telerik.Web.BoxSide"));
}if(!$telerik.isBorderVisible(c,b)){return 0;
}var a=$telerik._borderWidthNames[b];
var d=$telerik.getCurrentStyle(c,a);
return $telerik.parseBorderWidth(d);
},getPadding:function(c,b){if(!c){throw Error.argumentNull("element");
}if(b<Telerik.Web.BoxSide.Top||b>Telerik.Web.BoxSide.Left){throw Error.argumentOutOfRange(String.format(Sys.Res.enumInvalidValue,b,"Telerik.Web.BoxSide"));
}var a=$telerik._paddingWidthNames[b];
var d=$telerik.getCurrentStyle(c,a);
return $telerik.parsePadding(d);
},parseBorderWidth:function(b){if(b){switch(b){case"thin":case"medium":case"thick":return $telerik._borderThicknesses[b];
case"inherit":return 0;
}var a=$telerik.parseUnit(b);
return a.size;
}return 0;
},parsePadding:function(b){if(b){if(b=="auto"||b=="inherit"){return 0;
}var a=$telerik.parseUnit(b);
return a.size;
}return 0;
},parseUnit:function(a){if(!a){throw Error.argumentNull("value");
}a=a.trim().toLowerCase();
var c=a.length;
var g=-1;
for(var b=0;
b<c;
b++){var d=a.substr(b,1);
if((d<"0"||d>"9")&&d!="-"&&d!="."&&d!=","){break;
}g=b;
}if(g==-1){throw Error.create("No digits");
}var f;
var e;
if(g<(c-1)){f=a.substring(g+1).trim();
}else{f="px";
}e=parseFloat(a.substr(0,g+1));
if(f=="px"){e=Math.floor(e);
}return{size:e,type:f};
},containsPoint:function(c,b,a){return b>=c.x&&b<=(c.x+c.width)&&a>=c.y&&a<=(c.y+c.height);
},isDescendant:function(c,a){try{for(var d=a.parentNode;
d!=null;
d=d.parentNode){if(d==c){return true;
}}}catch(b){}return false;
},isDescendantOrSelf:function(a,b){if(a===b){return true;
}return $telerik.isDescendant(a,b);
},addCssClasses:function(c,a){for(var b=0;
b<a.length;
b++){Sys.UI.DomElement.addCssClass(c,a[b]);
}},removeCssClasses:function(c,a){for(var b=0;
b<a.length;
b++){Sys.UI.DomElement.removeCssClass(c,a[b]);
}},getScrollOffset:function(c,b){var e=0;
var d=0;
var a=c;
while(a!=null&&a.scrollLeft!=null){e+=$telerik.getCorrectScrollLeft(a);
d+=a.scrollTop;
if(!b||(a==document.body&&(a.scrollLeft!=0||a.scrollTop!=0))){break;
}a=a.parentNode;
}return{x:e,y:d};
},getElementByClassName:function(c,g,d){var a=null;
if(d){a=c.getElementsByTagName(d);
}else{a=c.getElementsByTagName("*");
}for(var b=0,f=a.length;
b<f;
b++){var e=a[b];
if(Sys.UI.DomElement.containsCssClass(e,g)){return e;
}}return null;
},addExternalHandler:function(c,b,a){if(c.addEventListener){c.addEventListener(b,a,false);
}else{if(c.attachEvent){c.attachEvent("on"+b,a);
}}},removeExternalHandler:function(c,b,a){if(c.addEventListener){c.removeEventListener(b,a,false);
}else{if(c.detachEvent){c.detachEvent("on"+b,a);
}}},cancelRawEvent:function(a){if(!a){return false;
}if(a.preventDefault){a.preventDefault();
}if(a.stopPropagation){a.stopPropagation();
}a.cancelBubble=true;
a.returnValue=false;
return false;
},getOuterHtml:function(b){if(b.outerHTML){return b.outerHTML;
}else{var a=b.cloneNode(true);
var c=b.ownerDocument.createElement("div");
c.appendChild(a);
return c.innerHTML;
}},setVisible:function(a,b){if(!a){return;
}if(b!=$telerik.getVisible(a)){if(b){if(a.style.removeAttribute){a.style.removeAttribute("display");
}else{a.style.removeProperty("display");
}}else{a.style.display="none";
}a.style.visibility=b?"visible":"hidden";
}},getVisible:function(a){if(!a){return false;
}return(("none"!=$telerik.getCurrentStyle(a,"display"))&&("hidden"!=$telerik.getCurrentStyle(a,"visibility")));
},getViewPortSize:function(){var b=0;
var a=0;
var c=document.body;
if(!$telerik.quirksMode&&!$telerik.isSafari){c=document.documentElement;
}if(window.innerWidth){b=window.innerWidth;
a=window.innerHeight;
}else{b=c.clientWidth;
a=c.clientHeight;
}b+=c.scrollLeft;
a+=c.scrollTop;
return{width:b-6,height:a-6};
},elementOverflowsTop:function(c,a){var b=a||$telerik.getLocation(c);
return b.y<0;
},elementOverflowsLeft:function(c,a){var b=a||$telerik.getLocation(c);
return b.x<0;
},elementOverflowsBottom:function(c,d,a){var e=a||$telerik.getLocation(d);
var b=e.y+d.offsetHeight;
return b>c.height;
},elementOverflowsRight:function(c,d,a){var e=a||$telerik.getLocation(d);
var b=e.x+d.offsetWidth;
return b>c.width;
},getDocumentRelativeCursorPosition:function(f){var c=document.documentElement;
var a=document.body;
var b=f.clientX+($telerik.getCorrectScrollLeft(c)+$telerik.getCorrectScrollLeft(a));
var d=f.clientY+(c.scrollTop+a.scrollTop);
if($telerik.isIE&&Sys.Browser.version<8){b-=2;
d-=2;
}return{left:b,top:d};
},evalScriptCode:function(c){if($telerik.isSafari){c=c.replace(/^\s*<!--((.|\n)*)-->\s*$/mi,"$1");
}var b=document.createElement("script");
b.setAttribute("type","text/javascript");
b.text=c;
var a=document.getElementsByTagName("head")[0];
a.appendChild(b);
b.parentNode.removeChild(b);
},isScriptRegistered:function(a,b){if(!a){return 0;
}if(!b){b=document;
}if($telerik._uniqueScripts==null){$telerik._uniqueScripts={};
}var f=document.getElementsByTagName("script");
var g=0;
var k=a.indexOf("?d=");
var j=a.indexOf("&");
var d=k>0&&j>k?a.substring(k+3,j):a;
if($telerik._uniqueScripts[d]!=null){return 2;
}for(var c=0,e=f.length;
c<e;
c++){var h=f[c];
if(h.src){if(h.getAttribute("src",2).indexOf(d)!=-1){$telerik._uniqueScripts[d]=true;
if(!$telerik.isDescendant(b,h)){g++;
}}}}return g;
},evalScripts:function(b,d){$telerik.registerSkins(b);
var h=b.getElementsByTagName("script");
var g=0,e=0;
var m=function(o,n){if(o-e>0&&($telerik.isIE||$telerik.isSafari)){window.setTimeout(function(){m(o,n);
},5);
}else{var i=document.createElement("script");
i.setAttribute("type","text/javascript");
document.getElementsByTagName("head")[0].appendChild(i);
i.loadFinished=false;
i.onload=function(){if(!this.loadFinished){this.loadFinished=true;
e++;
}};
i.onreadystatechange=function(){if("loaded"===this.readyState&&!this.loadFinished){this.loadFinished=true;
e++;
}};
i.setAttribute("src",n);
}};
var j=[];
for(var c=0,f=h.length;
c<f;
c++){var k=h[c];
if(k.src){var a=k.getAttribute("src",2);
if(!$telerik.isScriptRegistered(a,b)){m(g++,a);
}}else{Array.add(j,k.innerHTML);
}}var l=function(){if(g-e>0){window.setTimeout(l,20);
}else{for(var i=0;
i<j.length;
i++){$telerik.evalScriptCode(j[i]);
}if(d){d();
}}};
l();
},registerSkins:function(b){if(!b){b=document.body;
}var g=b.getElementsByTagName("link");
if(g&&g.length>0){var a=document.getElementsByTagName("head")[0];
if(a){for(var c=0,h=g.length;
c<h;
c++){var f=g[c];
if(f.className=="Telerik_stylesheet"){var l=a.getElementsByTagName("link");
if(f.href.indexOf("ie7CacheFix")>=0){try{f.href=f.href.replace("&ie7CacheFix","");
f.href=f.href.replace("?ie7CacheFix","");
}catch(k){}}if(l&&l.length>0){var d=l.length-1;
while(d>=0&&l[d--].href!=f.href){}if(d>=0){continue;
}}if($telerik.isIE){f.parentNode.removeChild(f);
f=f.cloneNode(true);
}a.appendChild(f);
if(h>g.length){h=g.length;
c--;
}}}}}},getFirstChildByTagName:function(d,b,c){if(!d||!d.childNodes){return null;
}var a=d.childNodes[c]||d.firstChild;
while(a){if(a.nodeType==1&&a.tagName.toLowerCase()==b){return a;
}a=a.nextSibling;
}return null;
},getChildByClassName:function(a,d,c){var b=a.childNodes[c]||a.firstChild;
while(b){if(b.nodeType==1&&b.className.indexOf(d)>-1){return b;
}b=b.nextSibling;
}return null;
},getChildrenByTagName:function(b,d){var a=new Array();
var e=b.childNodes;
if($telerik.isIE){e=b.children;
}for(var c=0,g=e.length;
c<g;
c++){var f=e[c];
if(f.nodeType==1&&f.tagName.toLowerCase()==d){Array.add(a,f);
}}return a;
},getChildrenByClassName:function(d,g){var a=new Array();
var b=d.childNodes;
if($telerik.isIE){b=d.children;
}for(var c=0,f=b.length;
c<f;
c++){var e=b[c];
if(e.nodeType==1&&e.className.indexOf(g)>-1){Array.add(a,e);
}}return a;
},mergeElementAttributes:function(d,b,a){if(!d||!b){return;
}if(d.mergeAttributes){b.mergeAttributes(d,a);
}else{for(var c=0;
c<d.attributes.length;
c++){var e=d.attributes[c].nodeValue;
b.setAttribute(d.attributes[c].nodeName,e);
}if(""==b.getAttribute("style")){b.removeAttribute("style");
}}},isMouseOverElement:function(c,d){var b=$telerik.getBounds(c);
var a=$telerik.getDocumentRelativeCursorPosition(d);
return $telerik.containsPoint(b,a.left,a.top);
},isMouseOverElementEx:function(a,g){var d=null;
try{d=$telerik.getOuterBounds(a);
}catch(g){return false;
}if(g&&g.target){var c=g.target.tagName;
if(c=="SELECT"||c=="OPTION"){return true;
}if(g.clientX<0||g.clientY<0){return true;
}}var b=$telerik.getDocumentRelativeCursorPosition(g);
d.x+=2;
d.y+=2;
d.width-=4;
d.height-=4;
var f=$telerik.containsPoint(d,b.left,b.top);
return f;
},getPreviousHtmlNode:function(a){if(!a||!a.previousSibling){return null;
}while(a.previousSibling){if(a.previousSibling.nodeType==1){return a.previousSibling;
}a=a.previousSibling;
}},getNextHtmlNode:function(a){if(!a||!a.nextSibling){return null;
}while(a.nextSibling){if(a.nextSibling.nodeType==1){return a.nextSibling;
}a=a.nextSibling;
}},disposeElement:function(a){if(typeof(Sys.WebForms)=="undefined"){return;
}var b=Sys.WebForms.PageRequestManager.getInstance();
if(b&&b._destroyTree){b._destroyTree(a);
}else{if(Sys.Application.disposeElement){Sys.Application.disposeElement(a,true);
}}}};
if(typeof(Sys.Browser.WebKit)=="undefined"){Sys.Browser.WebKit={};
}if(typeof(Sys.Browser.Chrome)=="undefined"){Sys.Browser.Chrome={};
}if(navigator.userAgent.indexOf("Chrome")>-1){Sys.Browser.version=parseFloat(navigator.userAgent.match(/WebKit\/(\d+(\.\d+)?)/)[1]);
Sys.Browser.agent=Sys.Browser.Chrome;
Sys.Browser.name="Chrome";
}else{if(navigator.userAgent.indexOf("WebKit/")>-1){Sys.Browser.version=parseFloat(navigator.userAgent.match(/WebKit\/(\d+(\.\d+)?)/)[1]);
if(Sys.Browser.version<500){Sys.Browser.agent=Sys.Browser.Safari;
Sys.Browser.name="Safari";
}else{Sys.Browser.agent=Sys.Browser.WebKit;
Sys.Browser.name="WebKit";
}}}$telerik.isChrome=Sys.Browser.agent==Sys.Browser.Chrome;
$telerik.isSafari4=Sys.Browser.agent==Sys.Browser.WebKit&&Sys.Browser.version>=526;
$telerik.isSafari3=Sys.Browser.agent==Sys.Browser.WebKit&&Sys.Browser.version<526&&Sys.Browser.version>500;
$telerik.isSafari2=Sys.Browser.agent==Sys.Browser.Safari;
$telerik.isSafari=$telerik.isSafari2||$telerik.isSafari3||$telerik.isSafari4||$telerik.isChrome;
$telerik.isIE=Sys.Browser.agent==Sys.Browser.InternetExplorer;
$telerik.isIE6=$telerik.isIE&&Sys.Browser.version<7;
$telerik.isIE7=$telerik.isIE&&(Sys.Browser.version==7||(document.documentMode&&document.documentMode<8));
$telerik.isIE8=$telerik.isIE&&Sys.Browser.version==8&&document.documentMode&&document.documentMode==8;
$telerik.isOpera=Sys.Browser.agent==Sys.Browser.Opera;
$telerik.isFirefox=Sys.Browser.agent==Sys.Browser.Firefox;
$telerik.isFirefox2=$telerik.isFirefox&&Sys.Browser.version<3;
$telerik.isFirefox3=$telerik.isFirefox&&Sys.Browser.version>=3;
$telerik.quirksMode=$telerik.isIE&&document.compatMode!="CSS1Compat";
$telerik.standardsMode=!$telerik.quirksMode;
Sys.Application.add_init(function(){try{$telerik._borderThickness();
}catch(a){}});
Telerik.Web.UI.Orientation=function(){throw Error.invalidOperation();
};
Telerik.Web.UI.Orientation.prototype={Horizontal:0,Vertical:1};
Telerik.Web.UI.Orientation.registerEnum("Telerik.Web.UI.Orientation",false);
Telerik.Web.UI.RadWebControl=function(a){Telerik.Web.UI.RadWebControl.initializeBase(this,[a]);
this._clientStateFieldID=null;
};
Telerik.Web.UI.RadWebControl.prototype={initialize:function(){Telerik.Web.UI.RadWebControl.callBaseMethod(this,"initialize");
$telerik.registerControl(this);
if(!this.get_clientStateFieldID()){return;
}var a=$get(this.get_clientStateFieldID());
if(!a){return;
}a.setAttribute("autocomplete","off");
},dispose:function(){$telerik.unregisterControl(this);
var b=this.get_element();
Telerik.Web.UI.RadWebControl.callBaseMethod(this,"dispose");
if(b){b.control=null;
var a=true;
if(b._events){for(var c in b._events){if(b._events[c].length>0){a=false;
break;
}}if(a){b._events=null;
}}}},raiseEvent:function(b,c){var a=this.get_events().getHandler(b);
if(a){if(!c){c=Sys.EventArgs.Empty;
}a(this,c);
}},updateClientState:function(){this.set_clientState(this.saveClientState());
},saveClientState:function(){return null;
},get_clientStateFieldID:function(){return this._clientStateFieldID;
},set_clientStateFieldID:function(a){if(this._clientStateFieldID!=a){this._clientStateFieldID=a;
this.raisePropertyChanged("ClientStateFieldID");
}},get_clientState:function(){if(this._clientStateFieldID){var a=document.getElementById(this._clientStateFieldID);
if(a){return a.value;
}}return null;
},set_clientState:function(b){if(this._clientStateFieldID){var a=document.getElementById(this._clientStateFieldID);
if(a){a.value=b;
}}},_getChildElement:function(a){return $get(this.get_id()+"_"+a);
},_findChildControl:function(a){return $find(this.get_id()+"_"+a);
}};
Telerik.Web.UI.RadWebControl.registerClass("Telerik.Web.UI.RadWebControl",Sys.UI.Control);
Telerik.Web.Timer=function(){Telerik.Web.Timer.initializeBase(this);
this._interval=1000;
this._enabled=false;
this._timer=null;
this._timerCallbackDelegate=Function.createDelegate(this,this._timerCallback);
};
Telerik.Web.Timer.prototype={get_interval:function(){return this._interval;
},set_interval:function(a){if(this._interval!==a){this._interval=a;
this.raisePropertyChanged("interval");
if(!this.get_isUpdating()&&(this._timer!==null)){this._stopTimer();
this._startTimer();
}}},get_enabled:function(){return this._enabled;
},set_enabled:function(a){if(a!==this.get_enabled()){this._enabled=a;
this.raisePropertyChanged("enabled");
if(!this.get_isUpdating()){if(a){this._startTimer();
}else{this._stopTimer();
}}}},add_tick:function(a){this.get_events().addHandler("tick",a);
},remove_tick:function(a){this.get_events().removeHandler("tick",a);
},dispose:function(){this.set_enabled(false);
this._stopTimer();
Telerik.Web.Timer.callBaseMethod(this,"dispose");
},updated:function(){Telerik.Web.Timer.callBaseMethod(this,"updated");
if(this._enabled){this._stopTimer();
this._startTimer();
}},_timerCallback:function(){var a=this.get_events().getHandler("tick");
if(a){a(this,Sys.EventArgs.Empty);
}},_startTimer:function(){this._timer=window.setInterval(this._timerCallbackDelegate,this._interval);
},_stopTimer:function(){window.clearInterval(this._timer);
this._timer=null;
}};
Telerik.Web.Timer.registerClass("Telerik.Web.Timer",Sys.Component);
Telerik.Web.BoxSide=function(){};
Telerik.Web.BoxSide.prototype={Top:0,Right:1,Bottom:2,Left:3};
Telerik.Web.BoxSide.registerEnum("Telerik.Web.BoxSide",false);
Telerik.Web.UI.WebServiceLoaderEventArgs=function(a){Telerik.Web.UI.WebServiceLoaderEventArgs.initializeBase(this);
this._context=a;
};
Telerik.Web.UI.WebServiceLoaderEventArgs.prototype={get_context:function(){return this._context;
}};
Telerik.Web.UI.WebServiceLoaderEventArgs.registerClass("Telerik.Web.UI.WebServiceLoaderEventArgs",Sys.EventArgs);
Telerik.Web.UI.WebServiceLoaderSuccessEventArgs=function(a,b){Telerik.Web.UI.WebServiceLoaderSuccessEventArgs.initializeBase(this,[b]);
this._data=a;
};
Telerik.Web.UI.WebServiceLoaderSuccessEventArgs.prototype={get_data:function(){return this._data;
}};
Telerik.Web.UI.WebServiceLoaderSuccessEventArgs.registerClass("Telerik.Web.UI.WebServiceLoaderSuccessEventArgs",Telerik.Web.UI.WebServiceLoaderEventArgs);
Telerik.Web.UI.WebServiceLoaderErrorEventArgs=function(a,b){Telerik.Web.UI.WebServiceLoaderErrorEventArgs.initializeBase(this,[b]);
this._message=a;
};
Telerik.Web.UI.WebServiceLoaderErrorEventArgs.prototype={get_message:function(){return this._message;
}};
Telerik.Web.UI.WebServiceLoaderErrorEventArgs.registerClass("Telerik.Web.UI.WebServiceLoaderErrorEventArgs",Telerik.Web.UI.WebServiceLoaderEventArgs);
Telerik.Web.UI.WebServiceLoader=function(a){this._webServiceSettings=a;
this._events=null;
this._onWebServiceSuccessDelegate=Function.createDelegate(this,this._onWebServiceSuccess);
this._onWebServiceErrorDelegate=Function.createDelegate(this,this._onWebServiceError);
this._currentRequest=null;
};
Telerik.Web.UI.WebServiceLoader.prototype={get_webServiceSettings:function(){return this._webServiceSettings;
},get_events:function(){if(!this._events){this._events=new Sys.EventHandlerList();
}return this._events;
},loadData:function(c,a){var b=this.get_webServiceSettings();
this.invokeMethod(this._webServiceSettings.get_method(),c,a);
},invokeMethod:function(e,a,d){var c=this.get_webServiceSettings();
if(c.get_isEmpty()){alert("Please, specify valid web service and method.");
return;
}this._raiseEvent("loadingStarted",new Telerik.Web.UI.WebServiceLoaderEventArgs(d));
var f=c.get_path();
var b=c.get_useHttpGet();
this._currentRequest=Sys.Net.WebServiceProxy.invoke(f,e,b,a,this._onWebServiceSuccessDelegate,this._onWebServiceErrorDelegate,d);
},add_loadingStarted:function(a){this.get_events().addHandler("loadingStarted",a);
},add_loadingError:function(a){this.get_events().addHandler("loadingError",a);
},add_loadingSuccess:function(a){this.get_events().addHandler("loadingSuccess",a);
},_serializeDictionaryAsKeyValuePairs:function(a){var b=[];
for(var c in a){b[b.length]={Key:c,Value:a[c]};
}return b;
},_onWebServiceSuccess:function(b,a){var c=new Telerik.Web.UI.WebServiceLoaderSuccessEventArgs(b,a);
this._raiseEvent("loadingSuccess",c);
},_onWebServiceError:function(c,a){var b=new Telerik.Web.UI.WebServiceLoaderErrorEventArgs(c.get_message(),a);
this._raiseEvent("loadingError",b);
},_raiseEvent:function(b,c){var a=this.get_events().getHandler(b);
if(a){if(!c){c=Sys.EventArgs.Empty;
}a(this,c);
}}};
Telerik.Web.UI.WebServiceLoader.registerClass("Telerik.Web.UI.WebServiceLoader");
Telerik.Web.UI.WebServiceSettings=function(a){this._path=null;
this._method=null;
this._useHttpGet=false;
if(!a){a={};
}if(typeof(a.path)!="undefined"){this._path=a.path;
}if(typeof(a.method)!="undefined"){this._method=a.method;
}if(typeof(a.useHttpGet)!="undefined"){this._useHttpGet=a.useHttpGet;
}};
Telerik.Web.UI.WebServiceSettings.prototype={get_isWcf:function(){return/\.svc$/.test(this._path);
},get_path:function(){return this._path;
},set_path:function(a){this._path=a;
},get_method:function(){return this._method;
},set_method:function(a){this._method=a;
},get_useHttpGet:function(){return this._useHttpGet;
},set_useHttpGet:function(a){this._useHttpGet=a;
},get_isEmpty:function(){var a=this.get_path();
var b=this.get_method();
return(!(a&&b));
}};
Telerik.Web.UI.WebServiceSettings.registerClass("Telerik.Web.UI.WebServiceSettings");
Telerik.Web.UI.ActionsManager=function(a){Telerik.Web.UI.ActionsManager.initializeBase(this);
this._actions=[];
this._currentActionIndex=-1;
};
Telerik.Web.UI.ActionsManager.prototype={get_actions:function(){return this._actions;
},shiftPointerLeft:function(){this._currentActionIndex--;
},shiftPointerRight:function(){this._currentActionIndex++;
},get_currentAction:function(){return this.get_actions()[this._currentActionIndex];
},get_nextAction:function(){return this.get_actions()[this._currentActionIndex+1];
},addAction:function(a){if(a){var b=new Telerik.Web.UI.ActionsManagerEventArgs(a);
this.raiseEvent("executeAction",b);
this._clearActionsToRedo();
Array.add(this._actions,a);
this._currentActionIndex=this._actions.length-1;
return true;
}return false;
},undo:function(c){if(c==null){c=1;
}if(c>this._actions.length){c=this._actions.length;
}var d=0;
var b=null;
while(0<c--&&0<=this._currentActionIndex&&this._currentActionIndex<this._actions.length){b=this._actions[this._currentActionIndex--];
if(b){var a=new Telerik.Web.UI.ActionsManagerEventArgs(b);
this.raiseEvent("undoAction",a);
d++;
}}},redo:function(c){if(c==null){c=1;
}if(c>this._actions.length){c=this._actions.length;
}var d=0;
var b=null;
var e=this._currentActionIndex+1;
while(0<c--&&0<=e&&e<this._actions.length){b=this._actions[e];
if(b){var a=new Telerik.Web.UI.ActionsManagerEventArgs(b);
this.raiseEvent("redoAction",a);
this._currentActionIndex=e;
d++;
}e++;
}},removeActionAt:function(a){this._actions.splice(a,1);
if(this._currentActionIndex>=a){this._currentActionIndex--;
}},canUndo:function(){return(-1<this._currentActionIndex);
},canRedo:function(){return(this._currentActionIndex<this._actions.length-1);
},getActionsToUndo:function(){if(this.canUndo()){return(this._actions.slice(0,this._currentActionIndex+1)).reverse();
}return[];
},getActionsToRedo:function(){if(this.canRedo()){return this._actions.slice(this._currentActionIndex+1);
}return[];
},_clearActionsToRedo:function(){if(this.canRedo()){this._actions.splice(this._currentActionIndex+1,this._actions.length-this._currentActionIndex);
}},add_undoAction:function(a){this.get_events().addHandler("undoAction",a);
},remove_undoAction:function(a){this.get_events().removeHandler("undoAction",a);
},add_redoAction:function(a){this.get_events().addHandler("redoAction",a);
},remove_redoAction:function(a){this.get_events().removeHandler("redoAction",a);
},add_executeAction:function(a){this.get_events().addHandler("executeAction",a);
},remove_executeAction:function(a){this.get_events().removeHandler("executeAction",a);
},raiseEvent:function(b,c){var a=this.get_events().getHandler(b);
if(a){a(this,c);
}}};
Telerik.Web.UI.ActionsManager.registerClass("Telerik.Web.UI.ActionsManager",Sys.Component);
Telerik.Web.UI.ActionsManagerEventArgs=function(a){Telerik.Web.UI.ActionsManagerEventArgs.initializeBase(this);
this._action=a;
};
Telerik.Web.UI.ActionsManagerEventArgs.prototype={get_action:function(){return this._action;
}};
Telerik.Web.UI.ActionsManagerEventArgs.registerClass("Telerik.Web.UI.ActionsManagerEventArgs",Sys.CancelEventArgs);
Telerik.Web.StringBuilder=function(a){this._buffer=a||[];
},Telerik.Web.StringBuilder.prototype={append:function(b){for(var a=0;
a<arguments.length;
a++){this._buffer[this._buffer.length]=arguments[a];
}return this;
},toString:function(){return this._buffer.join("");
},get_buffer:function(){return this._buffer;
}};

/*!
 * jQuery JavaScript Library v1.4.2
 * http://jquery.com/
 *
 * Copyright 2010, John Resig
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * Includes Sizzle.js
 * http://sizzlejs.com/
 * Copyright 2010, The Dojo Foundation
 * Released under the MIT, BSD, and GPL Licenses.
 *
 * Date: Sat Feb 13 22:33:48 2010 -0500
 */
(function(A,w){function ma(){if(!c.isReady){try{s.documentElement.doScroll("left")}catch(a){setTimeout(ma,1);return}c.ready()}}function Qa(a,b){b.src?c.ajax({url:b.src,async:false,dataType:"script"}):c.globalEval(b.text||b.textContent||b.innerHTML||"");b.parentNode&&b.parentNode.removeChild(b)}function X(a,b,d,f,e,j){var i=a.length;if(typeof b==="object"){for(var o in b)X(a,o,b[o],f,e,d);return a}if(d!==w){f=!j&&f&&c.isFunction(d);for(o=0;o<i;o++)e(a[o],b,f?d.call(a[o],o,e(a[o],b)):d,j);return a}return i?
e(a[0],b):w}function J(){return(new Date).getTime()}function Y(){return false}function Z(){return true}function na(a,b,d){d[0].type=a;return c.event.handle.apply(b,d)}function oa(a){var b,d=[],f=[],e=arguments,j,i,o,k,n,r;i=c.data(this,"events");if(!(a.liveFired===this||!i||!i.live||a.button&&a.type==="click")){a.liveFired=this;var u=i.live.slice(0);for(k=0;k<u.length;k++){i=u[k];i.origType.replace(O,"")===a.type?f.push(i.selector):u.splice(k--,1)}j=c(a.target).closest(f,a.currentTarget);n=0;for(r=
j.length;n<r;n++)for(k=0;k<u.length;k++){i=u[k];if(j[n].selector===i.selector){o=j[n].elem;f=null;if(i.preType==="mouseenter"||i.preType==="mouseleave")f=c(a.relatedTarget).closest(i.selector)[0];if(!f||f!==o)d.push({elem:o,handleObj:i})}}n=0;for(r=d.length;n<r;n++){j=d[n];a.currentTarget=j.elem;a.data=j.handleObj.data;a.handleObj=j.handleObj;if(j.handleObj.origHandler.apply(j.elem,e)===false){b=false;break}}return b}}function pa(a,b){return"live."+(a&&a!=="*"?a+".":"")+b.replace(/\./g,"`").replace(/ /g,
"&")}function qa(a){return!a||!a.parentNode||a.parentNode.nodeType===11}function ra(a,b){var d=0;b.each(function(){if(this.nodeName===(a[d]&&a[d].nodeName)){var f=c.data(a[d++]),e=c.data(this,f);if(f=f&&f.events){delete e.handle;e.events={};for(var j in f)for(var i in f[j])c.event.add(this,j,f[j][i],f[j][i].data)}}})}function sa(a,b,d){var f,e,j;b=b&&b[0]?b[0].ownerDocument||b[0]:s;if(a.length===1&&typeof a[0]==="string"&&a[0].length<512&&b===s&&!ta.test(a[0])&&(c.support.checkClone||!ua.test(a[0]))){e=
true;if(j=c.fragments[a[0]])if(j!==1)f=j}if(!f){f=b.createDocumentFragment();c.clean(a,b,f,d)}if(e)c.fragments[a[0]]=j?f:1;return{fragment:f,cacheable:e}}function K(a,b){var d={};c.each(va.concat.apply([],va.slice(0,b)),function(){d[this]=a});return d}function wa(a){return"scrollTo"in a&&a.document?a:a.nodeType===9?a.defaultView||a.parentWindow:false}var c=function(a,b){return new c.fn.init(a,b)},Ra=A.jQuery,Sa=A.$,s=A.document,T,Ta=/^[^<]*(<[\w\W]+>)[^>]*$|^#([\w-]+)$/,Ua=/^.[^:#\[\.,]*$/,Va=/\S/,
Wa=/^(\s|\u00A0)+|(\s|\u00A0)+$/g,Xa=/^<(\w+)\s*\/?>(?:<\/\1>)?$/,P=navigator.userAgent,xa=false,Q=[],L,$=Object.prototype.toString,aa=Object.prototype.hasOwnProperty,ba=Array.prototype.push,R=Array.prototype.slice,ya=Array.prototype.indexOf;c.fn=c.prototype={init:function(a,b){var d,f;if(!a)return this;if(a.nodeType){this.context=this[0]=a;this.length=1;return this}if(a==="body"&&!b){this.context=s;this[0]=s.body;this.selector="body";this.length=1;return this}if(typeof a==="string")if((d=Ta.exec(a))&&
(d[1]||!b))if(d[1]){f=b?b.ownerDocument||b:s;if(a=Xa.exec(a))if(c.isPlainObject(b)){a=[s.createElement(a[1])];c.fn.attr.call(a,b,true)}else a=[f.createElement(a[1])];else{a=sa([d[1]],[f]);a=(a.cacheable?a.fragment.cloneNode(true):a.fragment).childNodes}return c.merge(this,a)}else{if(b=s.getElementById(d[2])){if(b.id!==d[2])return T.find(a);this.length=1;this[0]=b}this.context=s;this.selector=a;return this}else if(!b&&/^\w+$/.test(a)){this.selector=a;this.context=s;a=s.getElementsByTagName(a);return c.merge(this,
a)}else return!b||b.jquery?(b||T).find(a):c(b).find(a);else if(c.isFunction(a))return T.ready(a);if(a.selector!==w){this.selector=a.selector;this.context=a.context}return c.makeArray(a,this)},selector:"",jquery:"1.4.2",length:0,size:function(){return this.length},toArray:function(){return R.call(this,0)},get:function(a){return a==null?this.toArray():a<0?this.slice(a)[0]:this[a]},pushStack:function(a,b,d){var f=c();c.isArray(a)?ba.apply(f,a):c.merge(f,a);f.prevObject=this;f.context=this.context;if(b===
"find")f.selector=this.selector+(this.selector?" ":"")+d;else if(b)f.selector=this.selector+"."+b+"("+d+")";return f},each:function(a,b){return c.each(this,a,b)},ready:function(a){c.bindReady();if(c.isReady)a.call(s,c);else Q&&Q.push(a);return this},eq:function(a){return a===-1?this.slice(a):this.slice(a,+a+1)},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},slice:function(){return this.pushStack(R.apply(this,arguments),"slice",R.call(arguments).join(","))},map:function(a){return this.pushStack(c.map(this,
function(b,d){return a.call(b,d,b)}))},end:function(){return this.prevObject||c(null)},push:ba,sort:[].sort,splice:[].splice};c.fn.init.prototype=c.fn;c.extend=c.fn.extend=function(){var a=arguments[0]||{},b=1,d=arguments.length,f=false,e,j,i,o;if(typeof a==="boolean"){f=a;a=arguments[1]||{};b=2}if(typeof a!=="object"&&!c.isFunction(a))a={};if(d===b){a=this;--b}for(;b<d;b++)if((e=arguments[b])!=null)for(j in e){i=a[j];o=e[j];if(a!==o)if(f&&o&&(c.isPlainObject(o)||c.isArray(o))){i=i&&(c.isPlainObject(i)||
c.isArray(i))?i:c.isArray(o)?[]:{};a[j]=c.extend(f,i,o)}else if(o!==w)a[j]=o}return a};c.extend({noConflict:function(a){A.$=Sa;if(a)A.jQuery=Ra;return c},isReady:false,ready:function(){if(!c.isReady){if(!s.body)return setTimeout(c.ready,13);c.isReady=true;if(Q){for(var a,b=0;a=Q[b++];)a.call(s,c);Q=null}c.fn.triggerHandler&&c(s).triggerHandler("ready")}},bindReady:function(){if(!xa){xa=true;if(s.readyState==="complete")return c.ready();if(s.addEventListener){s.addEventListener("DOMContentLoaded",
L,false);A.addEventListener("load",c.ready,false)}else if(s.attachEvent){s.attachEvent("onreadystatechange",L);A.attachEvent("onload",c.ready);var a=false;try{a=A.frameElement==null}catch(b){}s.documentElement.doScroll&&a&&ma()}}},isFunction:function(a){return $.call(a)==="[object Function]"},isArray:function(a){return $.call(a)==="[object Array]"},isPlainObject:function(a){if(!a||$.call(a)!=="[object Object]"||a.nodeType||a.setInterval)return false;if(a.constructor&&!aa.call(a,"constructor")&&!aa.call(a.constructor.prototype,
"isPrototypeOf"))return false;var b;for(b in a);return b===w||aa.call(a,b)},isEmptyObject:function(a){for(var b in a)return false;return true},error:function(a){throw a;},parseJSON:function(a){if(typeof a!=="string"||!a)return null;a=c.trim(a);if(/^[\],:{}\s]*$/.test(a.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,"")))return A.JSON&&A.JSON.parse?A.JSON.parse(a):(new Function("return "+
a))();else c.error("Invalid JSON: "+a)},noop:function(){},globalEval:function(a){if(a&&Va.test(a)){var b=s.getElementsByTagName("head")[0]||s.documentElement,d=s.createElement("script");d.type="text/javascript";if(c.support.scriptEval)d.appendChild(s.createTextNode(a));else d.text=a;b.insertBefore(d,b.firstChild);b.removeChild(d)}},nodeName:function(a,b){return a.nodeName&&a.nodeName.toUpperCase()===b.toUpperCase()},each:function(a,b,d){var f,e=0,j=a.length,i=j===w||c.isFunction(a);if(d)if(i)for(f in a){if(b.apply(a[f],
d)===false)break}else for(;e<j;){if(b.apply(a[e++],d)===false)break}else if(i)for(f in a){if(b.call(a[f],f,a[f])===false)break}else for(d=a[0];e<j&&b.call(d,e,d)!==false;d=a[++e]);return a},trim:function(a){return(a||"").replace(Wa,"")},makeArray:function(a,b){b=b||[];if(a!=null)a.length==null||typeof a==="string"||c.isFunction(a)||typeof a!=="function"&&a.setInterval?ba.call(b,a):c.merge(b,a);return b},inArray:function(a,b){if(b.indexOf)return b.indexOf(a);for(var d=0,f=b.length;d<f;d++)if(b[d]===
a)return d;return-1},merge:function(a,b){var d=a.length,f=0;if(typeof b.length==="number")for(var e=b.length;f<e;f++)a[d++]=b[f];else for(;b[f]!==w;)a[d++]=b[f++];a.length=d;return a},grep:function(a,b,d){for(var f=[],e=0,j=a.length;e<j;e++)!d!==!b(a[e],e)&&f.push(a[e]);return f},map:function(a,b,d){for(var f=[],e,j=0,i=a.length;j<i;j++){e=b(a[j],j,d);if(e!=null)f[f.length]=e}return f.concat.apply([],f)},guid:1,proxy:function(a,b,d){if(arguments.length===2)if(typeof b==="string"){d=a;a=d[b];b=w}else if(b&&
!c.isFunction(b)){d=b;b=w}if(!b&&a)b=function(){return a.apply(d||this,arguments)};if(a)b.guid=a.guid=a.guid||b.guid||c.guid++;return b},uaMatch:function(a){a=a.toLowerCase();a=/(webkit)[ \/]([\w.]+)/.exec(a)||/(opera)(?:.*version)?[ \/]([\w.]+)/.exec(a)||/(msie) ([\w.]+)/.exec(a)||!/compatible/.test(a)&&/(mozilla)(?:.*? rv:([\w.]+))?/.exec(a)||[];return{browser:a[1]||"",version:a[2]||"0"}},browser:{}});P=c.uaMatch(P);if(P.browser){c.browser[P.browser]=true;c.browser.version=P.version}if(c.browser.webkit)c.browser.safari=
true;if(ya)c.inArray=function(a,b){return ya.call(b,a)};T=c(s);if(s.addEventListener)L=function(){s.removeEventListener("DOMContentLoaded",L,false);c.ready()};else if(s.attachEvent)L=function(){if(s.readyState==="complete"){s.detachEvent("onreadystatechange",L);c.ready()}};(function(){c.support={};var a=s.documentElement,b=s.createElement("script"),d=s.createElement("div"),f="script"+J();d.style.display="none";d.innerHTML="   <link/><table></table><a href='/a' style='color:red;float:left;opacity:.55;'>a</a><input type='checkbox'/>";
var e=d.getElementsByTagName("*"),j=d.getElementsByTagName("a")[0];if(!(!e||!e.length||!j)){c.support={leadingWhitespace:d.firstChild.nodeType===3,tbody:!d.getElementsByTagName("tbody").length,htmlSerialize:!!d.getElementsByTagName("link").length,style:/red/.test(j.getAttribute("style")),hrefNormalized:j.getAttribute("href")==="/a",opacity:/^0.55$/.test(j.style.opacity),cssFloat:!!j.style.cssFloat,checkOn:d.getElementsByTagName("input")[0].value==="on",optSelected:s.createElement("select").appendChild(s.createElement("option")).selected,
parentNode:d.removeChild(d.appendChild(s.createElement("div"))).parentNode===null,deleteExpando:true,checkClone:false,scriptEval:false,noCloneEvent:true,boxModel:null};b.type="text/javascript";try{b.appendChild(s.createTextNode("window."+f+"=1;"))}catch(i){}a.insertBefore(b,a.firstChild);if(A[f]){c.support.scriptEval=true;delete A[f]}try{delete b.test}catch(o){c.support.deleteExpando=false}a.removeChild(b);if(d.attachEvent&&d.fireEvent){d.attachEvent("onclick",function k(){c.support.noCloneEvent=
false;d.detachEvent("onclick",k)});d.cloneNode(true).fireEvent("onclick")}d=s.createElement("div");d.innerHTML="<input type='radio' name='radiotest' checked='checked'/>";a=s.createDocumentFragment();a.appendChild(d.firstChild);c.support.checkClone=a.cloneNode(true).cloneNode(true).lastChild.checked;c(function(){var k=s.createElement("div");k.style.width=k.style.paddingLeft="1px";s.body.appendChild(k);c.boxModel=c.support.boxModel=k.offsetWidth===2;s.body.removeChild(k).style.display="none"});a=function(k){var n=
s.createElement("div");k="on"+k;var r=k in n;if(!r){n.setAttribute(k,"return;");r=typeof n[k]==="function"}return r};c.support.submitBubbles=a("submit");c.support.changeBubbles=a("change");a=b=d=e=j=null}})();c.props={"for":"htmlFor","class":"className",readonly:"readOnly",maxlength:"maxLength",cellspacing:"cellSpacing",rowspan:"rowSpan",colspan:"colSpan",tabindex:"tabIndex",usemap:"useMap",frameborder:"frameBorder"};var G="jQuery"+J(),Ya=0,za={};c.extend({cache:{},expando:G,noData:{embed:true,object:true,
applet:true},data:function(a,b,d){if(!(a.nodeName&&c.noData[a.nodeName.toLowerCase()])){a=a==A?za:a;var f=a[G],e=c.cache;if(!f&&typeof b==="string"&&d===w)return null;f||(f=++Ya);if(typeof b==="object"){a[G]=f;e[f]=c.extend(true,{},b)}else if(!e[f]){a[G]=f;e[f]={}}a=e[f];if(d!==w)a[b]=d;return typeof b==="string"?a[b]:a}},removeData:function(a,b){if(!(a.nodeName&&c.noData[a.nodeName.toLowerCase()])){a=a==A?za:a;var d=a[G],f=c.cache,e=f[d];if(b){if(e){delete e[b];c.isEmptyObject(e)&&c.removeData(a)}}else{if(c.support.deleteExpando)delete a[c.expando];
else a.removeAttribute&&a.removeAttribute(c.expando);delete f[d]}}}});c.fn.extend({data:function(a,b){if(typeof a==="undefined"&&this.length)return c.data(this[0]);else if(typeof a==="object")return this.each(function(){c.data(this,a)});var d=a.split(".");d[1]=d[1]?"."+d[1]:"";if(b===w){var f=this.triggerHandler("getData"+d[1]+"!",[d[0]]);if(f===w&&this.length)f=c.data(this[0],a);return f===w&&d[1]?this.data(d[0]):f}else return this.trigger("setData"+d[1]+"!",[d[0],b]).each(function(){c.data(this,
a,b)})},removeData:function(a){return this.each(function(){c.removeData(this,a)})}});c.extend({queue:function(a,b,d){if(a){b=(b||"fx")+"queue";var f=c.data(a,b);if(!d)return f||[];if(!f||c.isArray(d))f=c.data(a,b,c.makeArray(d));else f.push(d);return f}},dequeue:function(a,b){b=b||"fx";var d=c.queue(a,b),f=d.shift();if(f==="inprogress")f=d.shift();if(f){b==="fx"&&d.unshift("inprogress");f.call(a,function(){c.dequeue(a,b)})}}});c.fn.extend({queue:function(a,b){if(typeof a!=="string"){b=a;a="fx"}if(b===
w)return c.queue(this[0],a);return this.each(function(){var d=c.queue(this,a,b);a==="fx"&&d[0]!=="inprogress"&&c.dequeue(this,a)})},dequeue:function(a){return this.each(function(){c.dequeue(this,a)})},delay:function(a,b){a=c.fx?c.fx.speeds[a]||a:a;b=b||"fx";return this.queue(b,function(){var d=this;setTimeout(function(){c.dequeue(d,b)},a)})},clearQueue:function(a){return this.queue(a||"fx",[])}});var Aa=/[\n\t]/g,ca=/\s+/,Za=/\r/g,$a=/href|src|style/,ab=/(button|input)/i,bb=/(button|input|object|select|textarea)/i,
cb=/^(a|area)$/i,Ba=/radio|checkbox/;c.fn.extend({attr:function(a,b){return X(this,a,b,true,c.attr)},removeAttr:function(a){return this.each(function(){c.attr(this,a,"");this.nodeType===1&&this.removeAttribute(a)})},addClass:function(a){if(c.isFunction(a))return this.each(function(n){var r=c(this);r.addClass(a.call(this,n,r.attr("class")))});if(a&&typeof a==="string")for(var b=(a||"").split(ca),d=0,f=this.length;d<f;d++){var e=this[d];if(e.nodeType===1)if(e.className){for(var j=" "+e.className+" ",
i=e.className,o=0,k=b.length;o<k;o++)if(j.indexOf(" "+b[o]+" ")<0)i+=" "+b[o];e.className=c.trim(i)}else e.className=a}return this},removeClass:function(a){if(c.isFunction(a))return this.each(function(k){var n=c(this);n.removeClass(a.call(this,k,n.attr("class")))});if(a&&typeof a==="string"||a===w)for(var b=(a||"").split(ca),d=0,f=this.length;d<f;d++){var e=this[d];if(e.nodeType===1&&e.className)if(a){for(var j=(" "+e.className+" ").replace(Aa," "),i=0,o=b.length;i<o;i++)j=j.replace(" "+b[i]+" ",
" ");e.className=c.trim(j)}else e.className=""}return this},toggleClass:function(a,b){var d=typeof a,f=typeof b==="boolean";if(c.isFunction(a))return this.each(function(e){var j=c(this);j.toggleClass(a.call(this,e,j.attr("class"),b),b)});return this.each(function(){if(d==="string")for(var e,j=0,i=c(this),o=b,k=a.split(ca);e=k[j++];){o=f?o:!i.hasClass(e);i[o?"addClass":"removeClass"](e)}else if(d==="undefined"||d==="boolean"){this.className&&c.data(this,"__className__",this.className);this.className=
this.className||a===false?"":c.data(this,"__className__")||""}})},hasClass:function(a){a=" "+a+" ";for(var b=0,d=this.length;b<d;b++)if((" "+this[b].className+" ").replace(Aa," ").indexOf(a)>-1)return true;return false},val:function(a){if(a===w){var b=this[0];if(b){if(c.nodeName(b,"option"))return(b.attributes.value||{}).specified?b.value:b.text;if(c.nodeName(b,"select")){var d=b.selectedIndex,f=[],e=b.options;b=b.type==="select-one";if(d<0)return null;var j=b?d:0;for(d=b?d+1:e.length;j<d;j++){var i=
e[j];if(i.selected){a=c(i).val();if(b)return a;f.push(a)}}return f}if(Ba.test(b.type)&&!c.support.checkOn)return b.getAttribute("value")===null?"on":b.value;return(b.value||"").replace(Za,"")}return w}var o=c.isFunction(a);return this.each(function(k){var n=c(this),r=a;if(this.nodeType===1){if(o)r=a.call(this,k,n.val());if(typeof r==="number")r+="";if(c.isArray(r)&&Ba.test(this.type))this.checked=c.inArray(n.val(),r)>=0;else if(c.nodeName(this,"select")){var u=c.makeArray(r);c("option",this).each(function(){this.selected=
c.inArray(c(this).val(),u)>=0});if(!u.length)this.selectedIndex=-1}else this.value=r}})}});c.extend({attrFn:{val:true,css:true,html:true,text:true,data:true,width:true,height:true,offset:true},attr:function(a,b,d,f){if(!a||a.nodeType===3||a.nodeType===8)return w;if(f&&b in c.attrFn)return c(a)[b](d);f=a.nodeType!==1||!c.isXMLDoc(a);var e=d!==w;b=f&&c.props[b]||b;if(a.nodeType===1){var j=$a.test(b);if(b in a&&f&&!j){if(e){b==="type"&&ab.test(a.nodeName)&&a.parentNode&&c.error("type property can't be changed");
a[b]=d}if(c.nodeName(a,"form")&&a.getAttributeNode(b))return a.getAttributeNode(b).nodeValue;if(b==="tabIndex")return(b=a.getAttributeNode("tabIndex"))&&b.specified?b.value:bb.test(a.nodeName)||cb.test(a.nodeName)&&a.href?0:w;return a[b]}if(!c.support.style&&f&&b==="style"){if(e)a.style.cssText=""+d;return a.style.cssText}e&&a.setAttribute(b,""+d);a=!c.support.hrefNormalized&&f&&j?a.getAttribute(b,2):a.getAttribute(b);return a===null?w:a}return c.style(a,b,d)}});var O=/\.(.*)$/,db=function(a){return a.replace(/[^\w\s\.\|`]/g,
function(b){return"\\"+b})};c.event={add:function(a,b,d,f){if(!(a.nodeType===3||a.nodeType===8)){if(a.setInterval&&a!==A&&!a.frameElement)a=A;var e,j;if(d.handler){e=d;d=e.handler}if(!d.guid)d.guid=c.guid++;if(j=c.data(a)){var i=j.events=j.events||{},o=j.handle;if(!o)j.handle=o=function(){return typeof c!=="undefined"&&!c.event.triggered?c.event.handle.apply(o.elem,arguments):w};o.elem=a;b=b.split(" ");for(var k,n=0,r;k=b[n++];){j=e?c.extend({},e):{handler:d,data:f};if(k.indexOf(".")>-1){r=k.split(".");
k=r.shift();j.namespace=r.slice(0).sort().join(".")}else{r=[];j.namespace=""}j.type=k;j.guid=d.guid;var u=i[k],z=c.event.special[k]||{};if(!u){u=i[k]=[];if(!z.setup||z.setup.call(a,f,r,o)===false)if(a.addEventListener)a.addEventListener(k,o,false);else a.attachEvent&&a.attachEvent("on"+k,o)}if(z.add){z.add.call(a,j);if(!j.handler.guid)j.handler.guid=d.guid}u.push(j);c.event.global[k]=true}a=null}}},global:{},remove:function(a,b,d,f){if(!(a.nodeType===3||a.nodeType===8)){var e,j=0,i,o,k,n,r,u,z=c.data(a),
C=z&&z.events;if(z&&C){if(b&&b.type){d=b.handler;b=b.type}if(!b||typeof b==="string"&&b.charAt(0)==="."){b=b||"";for(e in C)c.event.remove(a,e+b)}else{for(b=b.split(" ");e=b[j++];){n=e;i=e.indexOf(".")<0;o=[];if(!i){o=e.split(".");e=o.shift();k=new RegExp("(^|\\.)"+c.map(o.slice(0).sort(),db).join("\\.(?:.*\\.)?")+"(\\.|$)")}if(r=C[e])if(d){n=c.event.special[e]||{};for(B=f||0;B<r.length;B++){u=r[B];if(d.guid===u.guid){if(i||k.test(u.namespace)){f==null&&r.splice(B--,1);n.remove&&n.remove.call(a,u)}if(f!=
null)break}}if(r.length===0||f!=null&&r.length===1){if(!n.teardown||n.teardown.call(a,o)===false)Ca(a,e,z.handle);delete C[e]}}else for(var B=0;B<r.length;B++){u=r[B];if(i||k.test(u.namespace)){c.event.remove(a,n,u.handler,B);r.splice(B--,1)}}}if(c.isEmptyObject(C)){if(b=z.handle)b.elem=null;delete z.events;delete z.handle;c.isEmptyObject(z)&&c.removeData(a)}}}}},trigger:function(a,b,d,f){var e=a.type||a;if(!f){a=typeof a==="object"?a[G]?a:c.extend(c.Event(e),a):c.Event(e);if(e.indexOf("!")>=0){a.type=
e=e.slice(0,-1);a.exclusive=true}if(!d){a.stopPropagation();c.event.global[e]&&c.each(c.cache,function(){this.events&&this.events[e]&&c.event.trigger(a,b,this.handle.elem)})}if(!d||d.nodeType===3||d.nodeType===8)return w;a.result=w;a.target=d;b=c.makeArray(b);b.unshift(a)}a.currentTarget=d;(f=c.data(d,"handle"))&&f.apply(d,b);f=d.parentNode||d.ownerDocument;try{if(!(d&&d.nodeName&&c.noData[d.nodeName.toLowerCase()]))if(d["on"+e]&&d["on"+e].apply(d,b)===false)a.result=false}catch(j){}if(!a.isPropagationStopped()&&
f)c.event.trigger(a,b,f,true);else if(!a.isDefaultPrevented()){f=a.target;var i,o=c.nodeName(f,"a")&&e==="click",k=c.event.special[e]||{};if((!k._default||k._default.call(d,a)===false)&&!o&&!(f&&f.nodeName&&c.noData[f.nodeName.toLowerCase()])){try{if(f[e]){if(i=f["on"+e])f["on"+e]=null;c.event.triggered=true;f[e]()}}catch(n){}if(i)f["on"+e]=i;c.event.triggered=false}}},handle:function(a){var b,d,f,e;a=arguments[0]=c.event.fix(a||A.event);a.currentTarget=this;b=a.type.indexOf(".")<0&&!a.exclusive;
if(!b){d=a.type.split(".");a.type=d.shift();f=new RegExp("(^|\\.)"+d.slice(0).sort().join("\\.(?:.*\\.)?")+"(\\.|$)")}e=c.data(this,"events");d=e[a.type];if(e&&d){d=d.slice(0);e=0;for(var j=d.length;e<j;e++){var i=d[e];if(b||f.test(i.namespace)){a.handler=i.handler;a.data=i.data;a.handleObj=i;i=i.handler.apply(this,arguments);if(i!==w){a.result=i;if(i===false){a.preventDefault();a.stopPropagation()}}if(a.isImmediatePropagationStopped())break}}}return a.result},props:"altKey attrChange attrName bubbles button cancelable charCode clientX clientY ctrlKey currentTarget data detail eventPhase fromElement handler keyCode layerX layerY metaKey newValue offsetX offsetY originalTarget pageX pageY prevValue relatedNode relatedTarget screenX screenY shiftKey srcElement target toElement view wheelDelta which".split(" "),
fix:function(a){if(a[G])return a;var b=a;a=c.Event(b);for(var d=this.props.length,f;d;){f=this.props[--d];a[f]=b[f]}if(!a.target)a.target=a.srcElement||s;if(a.target.nodeType===3)a.target=a.target.parentNode;if(!a.relatedTarget&&a.fromElement)a.relatedTarget=a.fromElement===a.target?a.toElement:a.fromElement;if(a.pageX==null&&a.clientX!=null){b=s.documentElement;d=s.body;a.pageX=a.clientX+(b&&b.scrollLeft||d&&d.scrollLeft||0)-(b&&b.clientLeft||d&&d.clientLeft||0);a.pageY=a.clientY+(b&&b.scrollTop||
d&&d.scrollTop||0)-(b&&b.clientTop||d&&d.clientTop||0)}if(!a.which&&(a.charCode||a.charCode===0?a.charCode:a.keyCode))a.which=a.charCode||a.keyCode;if(!a.metaKey&&a.ctrlKey)a.metaKey=a.ctrlKey;if(!a.which&&a.button!==w)a.which=a.button&1?1:a.button&2?3:a.button&4?2:0;return a},guid:1E8,proxy:c.proxy,special:{ready:{setup:c.bindReady,teardown:c.noop},live:{add:function(a){c.event.add(this,a.origType,c.extend({},a,{handler:oa}))},remove:function(a){var b=true,d=a.origType.replace(O,"");c.each(c.data(this,
"events").live||[],function(){if(d===this.origType.replace(O,""))return b=false});b&&c.event.remove(this,a.origType,oa)}},beforeunload:{setup:function(a,b,d){if(this.setInterval)this.onbeforeunload=d;return false},teardown:function(a,b){if(this.onbeforeunload===b)this.onbeforeunload=null}}}};var Ca=s.removeEventListener?function(a,b,d){a.removeEventListener(b,d,false)}:function(a,b,d){a.detachEvent("on"+b,d)};c.Event=function(a){if(!this.preventDefault)return new c.Event(a);if(a&&a.type){this.originalEvent=
a;this.type=a.type}else this.type=a;this.timeStamp=J();this[G]=true};c.Event.prototype={preventDefault:function(){this.isDefaultPrevented=Z;var a=this.originalEvent;if(a){a.preventDefault&&a.preventDefault();a.returnValue=false}},stopPropagation:function(){this.isPropagationStopped=Z;var a=this.originalEvent;if(a){a.stopPropagation&&a.stopPropagation();a.cancelBubble=true}},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=Z;this.stopPropagation()},isDefaultPrevented:Y,isPropagationStopped:Y,
isImmediatePropagationStopped:Y};var Da=function(a){var b=a.relatedTarget;try{for(;b&&b!==this;)b=b.parentNode;if(b!==this){a.type=a.data;c.event.handle.apply(this,arguments)}}catch(d){}},Ea=function(a){a.type=a.data;c.event.handle.apply(this,arguments)};c.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(a,b){c.event.special[a]={setup:function(d){c.event.add(this,b,d&&d.selector?Ea:Da,a)},teardown:function(d){c.event.remove(this,b,d&&d.selector?Ea:Da)}}});if(!c.support.submitBubbles)c.event.special.submit=
{setup:function(){if(this.nodeName.toLowerCase()!=="form"){c.event.add(this,"click.specialSubmit",function(a){var b=a.target,d=b.type;if((d==="submit"||d==="image")&&c(b).closest("form").length)return na("submit",this,arguments)});c.event.add(this,"keypress.specialSubmit",function(a){var b=a.target,d=b.type;if((d==="text"||d==="password")&&c(b).closest("form").length&&a.keyCode===13)return na("submit",this,arguments)})}else return false},teardown:function(){c.event.remove(this,".specialSubmit")}};
if(!c.support.changeBubbles){var da=/textarea|input|select/i,ea,Fa=function(a){var b=a.type,d=a.value;if(b==="radio"||b==="checkbox")d=a.checked;else if(b==="select-multiple")d=a.selectedIndex>-1?c.map(a.options,function(f){return f.selected}).join("-"):"";else if(a.nodeName.toLowerCase()==="select")d=a.selectedIndex;return d},fa=function(a,b){var d=a.target,f,e;if(!(!da.test(d.nodeName)||d.readOnly)){f=c.data(d,"_change_data");e=Fa(d);if(a.type!=="focusout"||d.type!=="radio")c.data(d,"_change_data",
e);if(!(f===w||e===f))if(f!=null||e){a.type="change";return c.event.trigger(a,b,d)}}};c.event.special.change={filters:{focusout:fa,click:function(a){var b=a.target,d=b.type;if(d==="radio"||d==="checkbox"||b.nodeName.toLowerCase()==="select")return fa.call(this,a)},keydown:function(a){var b=a.target,d=b.type;if(a.keyCode===13&&b.nodeName.toLowerCase()!=="textarea"||a.keyCode===32&&(d==="checkbox"||d==="radio")||d==="select-multiple")return fa.call(this,a)},beforeactivate:function(a){a=a.target;c.data(a,
"_change_data",Fa(a))}},setup:function(){if(this.type==="file")return false;for(var a in ea)c.event.add(this,a+".specialChange",ea[a]);return da.test(this.nodeName)},teardown:function(){c.event.remove(this,".specialChange");return da.test(this.nodeName)}};ea=c.event.special.change.filters}s.addEventListener&&c.each({focus:"focusin",blur:"focusout"},function(a,b){function d(f){f=c.event.fix(f);f.type=b;return c.event.handle.call(this,f)}c.event.special[b]={setup:function(){this.addEventListener(a,
d,true)},teardown:function(){this.removeEventListener(a,d,true)}}});c.each(["bind","one"],function(a,b){c.fn[b]=function(d,f,e){if(typeof d==="object"){for(var j in d)this[b](j,f,d[j],e);return this}if(c.isFunction(f)){e=f;f=w}var i=b==="one"?c.proxy(e,function(k){c(this).unbind(k,i);return e.apply(this,arguments)}):e;if(d==="unload"&&b!=="one")this.one(d,f,e);else{j=0;for(var o=this.length;j<o;j++)c.event.add(this[j],d,i,f)}return this}});c.fn.extend({unbind:function(a,b){if(typeof a==="object"&&
!a.preventDefault)for(var d in a)this.unbind(d,a[d]);else{d=0;for(var f=this.length;d<f;d++)c.event.remove(this[d],a,b)}return this},delegate:function(a,b,d,f){return this.live(b,d,f,a)},undelegate:function(a,b,d){return arguments.length===0?this.unbind("live"):this.die(b,null,d,a)},trigger:function(a,b){return this.each(function(){c.event.trigger(a,b,this)})},triggerHandler:function(a,b){if(this[0]){a=c.Event(a);a.preventDefault();a.stopPropagation();c.event.trigger(a,b,this[0]);return a.result}},
toggle:function(a){for(var b=arguments,d=1;d<b.length;)c.proxy(a,b[d++]);return this.click(c.proxy(a,function(f){var e=(c.data(this,"lastToggle"+a.guid)||0)%d;c.data(this,"lastToggle"+a.guid,e+1);f.preventDefault();return b[e].apply(this,arguments)||false}))},hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)}});var Ga={focus:"focusin",blur:"focusout",mouseenter:"mouseover",mouseleave:"mouseout"};c.each(["live","die"],function(a,b){c.fn[b]=function(d,f,e,j){var i,o=0,k,n,r=j||this.selector,
u=j?this:c(this.context);if(c.isFunction(f)){e=f;f=w}for(d=(d||"").split(" ");(i=d[o++])!=null;){j=O.exec(i);k="";if(j){k=j[0];i=i.replace(O,"")}if(i==="hover")d.push("mouseenter"+k,"mouseleave"+k);else{n=i;if(i==="focus"||i==="blur"){d.push(Ga[i]+k);i+=k}else i=(Ga[i]||i)+k;b==="live"?u.each(function(){c.event.add(this,pa(i,r),{data:f,selector:r,handler:e,origType:i,origHandler:e,preType:n})}):u.unbind(pa(i,r),e)}}return this}});c.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error".split(" "),
function(a,b){c.fn[b]=function(d){return d?this.bind(b,d):this.trigger(b)};if(c.attrFn)c.attrFn[b]=true});A.attachEvent&&!A.addEventListener&&A.attachEvent("onunload",function(){for(var a in c.cache)if(c.cache[a].handle)try{c.event.remove(c.cache[a].handle.elem)}catch(b){}});(function(){function a(g){for(var h="",l,m=0;g[m];m++){l=g[m];if(l.nodeType===3||l.nodeType===4)h+=l.nodeValue;else if(l.nodeType!==8)h+=a(l.childNodes)}return h}function b(g,h,l,m,q,p){q=0;for(var v=m.length;q<v;q++){var t=m[q];
if(t){t=t[g];for(var y=false;t;){if(t.sizcache===l){y=m[t.sizset];break}if(t.nodeType===1&&!p){t.sizcache=l;t.sizset=q}if(t.nodeName.toLowerCase()===h){y=t;break}t=t[g]}m[q]=y}}}function d(g,h,l,m,q,p){q=0;for(var v=m.length;q<v;q++){var t=m[q];if(t){t=t[g];for(var y=false;t;){if(t.sizcache===l){y=m[t.sizset];break}if(t.nodeType===1){if(!p){t.sizcache=l;t.sizset=q}if(typeof h!=="string"){if(t===h){y=true;break}}else if(k.filter(h,[t]).length>0){y=t;break}}t=t[g]}m[q]=y}}}var f=/((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^[\]]*\]|['"][^'"]*['"]|[^[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,
e=0,j=Object.prototype.toString,i=false,o=true;[0,0].sort(function(){o=false;return 0});var k=function(g,h,l,m){l=l||[];var q=h=h||s;if(h.nodeType!==1&&h.nodeType!==9)return[];if(!g||typeof g!=="string")return l;for(var p=[],v,t,y,S,H=true,M=x(h),I=g;(f.exec(""),v=f.exec(I))!==null;){I=v[3];p.push(v[1]);if(v[2]){S=v[3];break}}if(p.length>1&&r.exec(g))if(p.length===2&&n.relative[p[0]])t=ga(p[0]+p[1],h);else for(t=n.relative[p[0]]?[h]:k(p.shift(),h);p.length;){g=p.shift();if(n.relative[g])g+=p.shift();
t=ga(g,t)}else{if(!m&&p.length>1&&h.nodeType===9&&!M&&n.match.ID.test(p[0])&&!n.match.ID.test(p[p.length-1])){v=k.find(p.shift(),h,M);h=v.expr?k.filter(v.expr,v.set)[0]:v.set[0]}if(h){v=m?{expr:p.pop(),set:z(m)}:k.find(p.pop(),p.length===1&&(p[0]==="~"||p[0]==="+")&&h.parentNode?h.parentNode:h,M);t=v.expr?k.filter(v.expr,v.set):v.set;if(p.length>0)y=z(t);else H=false;for(;p.length;){var D=p.pop();v=D;if(n.relative[D])v=p.pop();else D="";if(v==null)v=h;n.relative[D](y,v,M)}}else y=[]}y||(y=t);y||k.error(D||
g);if(j.call(y)==="[object Array]")if(H)if(h&&h.nodeType===1)for(g=0;y[g]!=null;g++){if(y[g]&&(y[g]===true||y[g].nodeType===1&&E(h,y[g])))l.push(t[g])}else for(g=0;y[g]!=null;g++)y[g]&&y[g].nodeType===1&&l.push(t[g]);else l.push.apply(l,y);else z(y,l);if(S){k(S,q,l,m);k.uniqueSort(l)}return l};k.uniqueSort=function(g){if(B){i=o;g.sort(B);if(i)for(var h=1;h<g.length;h++)g[h]===g[h-1]&&g.splice(h--,1)}return g};k.matches=function(g,h){return k(g,null,null,h)};k.find=function(g,h,l){var m,q;if(!g)return[];
for(var p=0,v=n.order.length;p<v;p++){var t=n.order[p];if(q=n.leftMatch[t].exec(g)){var y=q[1];q.splice(1,1);if(y.substr(y.length-1)!=="\\"){q[1]=(q[1]||"").replace(/\\/g,"");m=n.find[t](q,h,l);if(m!=null){g=g.replace(n.match[t],"");break}}}}m||(m=h.getElementsByTagName("*"));return{set:m,expr:g}};k.filter=function(g,h,l,m){for(var q=g,p=[],v=h,t,y,S=h&&h[0]&&x(h[0]);g&&h.length;){for(var H in n.filter)if((t=n.leftMatch[H].exec(g))!=null&&t[2]){var M=n.filter[H],I,D;D=t[1];y=false;t.splice(1,1);if(D.substr(D.length-
1)!=="\\"){if(v===p)p=[];if(n.preFilter[H])if(t=n.preFilter[H](t,v,l,p,m,S)){if(t===true)continue}else y=I=true;if(t)for(var U=0;(D=v[U])!=null;U++)if(D){I=M(D,t,U,v);var Ha=m^!!I;if(l&&I!=null)if(Ha)y=true;else v[U]=false;else if(Ha){p.push(D);y=true}}if(I!==w){l||(v=p);g=g.replace(n.match[H],"");if(!y)return[];break}}}if(g===q)if(y==null)k.error(g);else break;q=g}return v};k.error=function(g){throw"Syntax error, unrecognized expression: "+g;};var n=k.selectors={order:["ID","NAME","TAG"],match:{ID:/#((?:[\w\u00c0-\uFFFF-]|\\.)+)/,
CLASS:/\.((?:[\w\u00c0-\uFFFF-]|\\.)+)/,NAME:/\[name=['"]*((?:[\w\u00c0-\uFFFF-]|\\.)+)['"]*\]/,ATTR:/\[\s*((?:[\w\u00c0-\uFFFF-]|\\.)+)\s*(?:(\S?=)\s*(['"]*)(.*?)\3|)\s*\]/,TAG:/^((?:[\w\u00c0-\uFFFF\*-]|\\.)+)/,CHILD:/:(only|nth|last|first)-child(?:\((even|odd|[\dn+-]*)\))?/,POS:/:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^-]|$)/,PSEUDO:/:((?:[\w\u00c0-\uFFFF-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/},leftMatch:{},attrMap:{"class":"className","for":"htmlFor"},attrHandle:{href:function(g){return g.getAttribute("href")}},
relative:{"+":function(g,h){var l=typeof h==="string",m=l&&!/\W/.test(h);l=l&&!m;if(m)h=h.toLowerCase();m=0;for(var q=g.length,p;m<q;m++)if(p=g[m]){for(;(p=p.previousSibling)&&p.nodeType!==1;);g[m]=l||p&&p.nodeName.toLowerCase()===h?p||false:p===h}l&&k.filter(h,g,true)},">":function(g,h){var l=typeof h==="string";if(l&&!/\W/.test(h)){h=h.toLowerCase();for(var m=0,q=g.length;m<q;m++){var p=g[m];if(p){l=p.parentNode;g[m]=l.nodeName.toLowerCase()===h?l:false}}}else{m=0;for(q=g.length;m<q;m++)if(p=g[m])g[m]=
l?p.parentNode:p.parentNode===h;l&&k.filter(h,g,true)}},"":function(g,h,l){var m=e++,q=d;if(typeof h==="string"&&!/\W/.test(h)){var p=h=h.toLowerCase();q=b}q("parentNode",h,m,g,p,l)},"~":function(g,h,l){var m=e++,q=d;if(typeof h==="string"&&!/\W/.test(h)){var p=h=h.toLowerCase();q=b}q("previousSibling",h,m,g,p,l)}},find:{ID:function(g,h,l){if(typeof h.getElementById!=="undefined"&&!l)return(g=h.getElementById(g[1]))?[g]:[]},NAME:function(g,h){if(typeof h.getElementsByName!=="undefined"){var l=[];
h=h.getElementsByName(g[1]);for(var m=0,q=h.length;m<q;m++)h[m].getAttribute("name")===g[1]&&l.push(h[m]);return l.length===0?null:l}},TAG:function(g,h){return h.getElementsByTagName(g[1])}},preFilter:{CLASS:function(g,h,l,m,q,p){g=" "+g[1].replace(/\\/g,"")+" ";if(p)return g;p=0;for(var v;(v=h[p])!=null;p++)if(v)if(q^(v.className&&(" "+v.className+" ").replace(/[\t\n]/g," ").indexOf(g)>=0))l||m.push(v);else if(l)h[p]=false;return false},ID:function(g){return g[1].replace(/\\/g,"")},TAG:function(g){return g[1].toLowerCase()},
CHILD:function(g){if(g[1]==="nth"){var h=/(-?)(\d*)n((?:\+|-)?\d*)/.exec(g[2]==="even"&&"2n"||g[2]==="odd"&&"2n+1"||!/\D/.test(g[2])&&"0n+"+g[2]||g[2]);g[2]=h[1]+(h[2]||1)-0;g[3]=h[3]-0}g[0]=e++;return g},ATTR:function(g,h,l,m,q,p){h=g[1].replace(/\\/g,"");if(!p&&n.attrMap[h])g[1]=n.attrMap[h];if(g[2]==="~=")g[4]=" "+g[4]+" ";return g},PSEUDO:function(g,h,l,m,q){if(g[1]==="not")if((f.exec(g[3])||"").length>1||/^\w/.test(g[3]))g[3]=k(g[3],null,null,h);else{g=k.filter(g[3],h,l,true^q);l||m.push.apply(m,
g);return false}else if(n.match.POS.test(g[0])||n.match.CHILD.test(g[0]))return true;return g},POS:function(g){g.unshift(true);return g}},filters:{enabled:function(g){return g.disabled===false&&g.type!=="hidden"},disabled:function(g){return g.disabled===true},checked:function(g){return g.checked===true},selected:function(g){return g.selected===true},parent:function(g){return!!g.firstChild},empty:function(g){return!g.firstChild},has:function(g,h,l){return!!k(l[3],g).length},header:function(g){return/h\d/i.test(g.nodeName)},
text:function(g){return"text"===g.type},radio:function(g){return"radio"===g.type},checkbox:function(g){return"checkbox"===g.type},file:function(g){return"file"===g.type},password:function(g){return"password"===g.type},submit:function(g){return"submit"===g.type},image:function(g){return"image"===g.type},reset:function(g){return"reset"===g.type},button:function(g){return"button"===g.type||g.nodeName.toLowerCase()==="button"},input:function(g){return/input|select|textarea|button/i.test(g.nodeName)}},
setFilters:{first:function(g,h){return h===0},last:function(g,h,l,m){return h===m.length-1},even:function(g,h){return h%2===0},odd:function(g,h){return h%2===1},lt:function(g,h,l){return h<l[3]-0},gt:function(g,h,l){return h>l[3]-0},nth:function(g,h,l){return l[3]-0===h},eq:function(g,h,l){return l[3]-0===h}},filter:{PSEUDO:function(g,h,l,m){var q=h[1],p=n.filters[q];if(p)return p(g,l,h,m);else if(q==="contains")return(g.textContent||g.innerText||a([g])||"").indexOf(h[3])>=0;else if(q==="not"){h=
h[3];l=0;for(m=h.length;l<m;l++)if(h[l]===g)return false;return true}else k.error("Syntax error, unrecognized expression: "+q)},CHILD:function(g,h){var l=h[1],m=g;switch(l){case "only":case "first":for(;m=m.previousSibling;)if(m.nodeType===1)return false;if(l==="first")return true;m=g;case "last":for(;m=m.nextSibling;)if(m.nodeType===1)return false;return true;case "nth":l=h[2];var q=h[3];if(l===1&&q===0)return true;h=h[0];var p=g.parentNode;if(p&&(p.sizcache!==h||!g.nodeIndex)){var v=0;for(m=p.firstChild;m;m=
m.nextSibling)if(m.nodeType===1)m.nodeIndex=++v;p.sizcache=h}g=g.nodeIndex-q;return l===0?g===0:g%l===0&&g/l>=0}},ID:function(g,h){return g.nodeType===1&&g.getAttribute("id")===h},TAG:function(g,h){return h==="*"&&g.nodeType===1||g.nodeName.toLowerCase()===h},CLASS:function(g,h){return(" "+(g.className||g.getAttribute("class"))+" ").indexOf(h)>-1},ATTR:function(g,h){var l=h[1];g=n.attrHandle[l]?n.attrHandle[l](g):g[l]!=null?g[l]:g.getAttribute(l);l=g+"";var m=h[2];h=h[4];return g==null?m==="!=":m===
"="?l===h:m==="*="?l.indexOf(h)>=0:m==="~="?(" "+l+" ").indexOf(h)>=0:!h?l&&g!==false:m==="!="?l!==h:m==="^="?l.indexOf(h)===0:m==="$="?l.substr(l.length-h.length)===h:m==="|="?l===h||l.substr(0,h.length+1)===h+"-":false},POS:function(g,h,l,m){var q=n.setFilters[h[2]];if(q)return q(g,l,h,m)}}},r=n.match.POS;for(var u in n.match){n.match[u]=new RegExp(n.match[u].source+/(?![^\[]*\])(?![^\(]*\))/.source);n.leftMatch[u]=new RegExp(/(^(?:.|\r|\n)*?)/.source+n.match[u].source.replace(/\\(\d+)/g,function(g,
h){return"\\"+(h-0+1)}))}var z=function(g,h){g=Array.prototype.slice.call(g,0);if(h){h.push.apply(h,g);return h}return g};try{Array.prototype.slice.call(s.documentElement.childNodes,0)}catch(C){z=function(g,h){h=h||[];if(j.call(g)==="[object Array]")Array.prototype.push.apply(h,g);else if(typeof g.length==="number")for(var l=0,m=g.length;l<m;l++)h.push(g[l]);else for(l=0;g[l];l++)h.push(g[l]);return h}}var B;if(s.documentElement.compareDocumentPosition)B=function(g,h){if(!g.compareDocumentPosition||
!h.compareDocumentPosition){if(g==h)i=true;return g.compareDocumentPosition?-1:1}g=g.compareDocumentPosition(h)&4?-1:g===h?0:1;if(g===0)i=true;return g};else if("sourceIndex"in s.documentElement)B=function(g,h){if(!g.sourceIndex||!h.sourceIndex){if(g==h)i=true;return g.sourceIndex?-1:1}g=g.sourceIndex-h.sourceIndex;if(g===0)i=true;return g};else if(s.createRange)B=function(g,h){if(!g.ownerDocument||!h.ownerDocument){if(g==h)i=true;return g.ownerDocument?-1:1}var l=g.ownerDocument.createRange(),m=
h.ownerDocument.createRange();l.setStart(g,0);l.setEnd(g,0);m.setStart(h,0);m.setEnd(h,0);g=l.compareBoundaryPoints(Range.START_TO_END,m);if(g===0)i=true;return g};(function(){var g=s.createElement("div"),h="script"+(new Date).getTime();g.innerHTML="<a name='"+h+"'/>";var l=s.documentElement;l.insertBefore(g,l.firstChild);if(s.getElementById(h)){n.find.ID=function(m,q,p){if(typeof q.getElementById!=="undefined"&&!p)return(q=q.getElementById(m[1]))?q.id===m[1]||typeof q.getAttributeNode!=="undefined"&&
q.getAttributeNode("id").nodeValue===m[1]?[q]:w:[]};n.filter.ID=function(m,q){var p=typeof m.getAttributeNode!=="undefined"&&m.getAttributeNode("id");return m.nodeType===1&&p&&p.nodeValue===q}}l.removeChild(g);l=g=null})();(function(){var g=s.createElement("div");g.appendChild(s.createComment(""));if(g.getElementsByTagName("*").length>0)n.find.TAG=function(h,l){l=l.getElementsByTagName(h[1]);if(h[1]==="*"){h=[];for(var m=0;l[m];m++)l[m].nodeType===1&&h.push(l[m]);l=h}return l};g.innerHTML="<a href='#'></a>";
if(g.firstChild&&typeof g.firstChild.getAttribute!=="undefined"&&g.firstChild.getAttribute("href")!=="#")n.attrHandle.href=function(h){return h.getAttribute("href",2)};g=null})();s.querySelectorAll&&function(){var g=k,h=s.createElement("div");h.innerHTML="<p class='TEST'></p>";if(!(h.querySelectorAll&&h.querySelectorAll(".TEST").length===0)){k=function(m,q,p,v){q=q||s;if(!v&&q.nodeType===9&&!x(q))try{return z(q.querySelectorAll(m),p)}catch(t){}return g(m,q,p,v)};for(var l in g)k[l]=g[l];h=null}}();
(function(){var g=s.createElement("div");g.innerHTML="<div class='test e'></div><div class='test'></div>";if(!(!g.getElementsByClassName||g.getElementsByClassName("e").length===0)){g.lastChild.className="e";if(g.getElementsByClassName("e").length!==1){n.order.splice(1,0,"CLASS");n.find.CLASS=function(h,l,m){if(typeof l.getElementsByClassName!=="undefined"&&!m)return l.getElementsByClassName(h[1])};g=null}}})();var E=s.compareDocumentPosition?function(g,h){return!!(g.compareDocumentPosition(h)&16)}:
function(g,h){return g!==h&&(g.contains?g.contains(h):true)},x=function(g){return(g=(g?g.ownerDocument||g:0).documentElement)?g.nodeName!=="HTML":false},ga=function(g,h){var l=[],m="",q;for(h=h.nodeType?[h]:h;q=n.match.PSEUDO.exec(g);){m+=q[0];g=g.replace(n.match.PSEUDO,"")}g=n.relative[g]?g+"*":g;q=0;for(var p=h.length;q<p;q++)k(g,h[q],l);return k.filter(m,l)};c.find=k;c.expr=k.selectors;c.expr[":"]=c.expr.filters;c.unique=k.uniqueSort;c.text=a;c.isXMLDoc=x;c.contains=E})();var eb=/Until$/,fb=/^(?:parents|prevUntil|prevAll)/,
gb=/,/;R=Array.prototype.slice;var Ia=function(a,b,d){if(c.isFunction(b))return c.grep(a,function(e,j){return!!b.call(e,j,e)===d});else if(b.nodeType)return c.grep(a,function(e){return e===b===d});else if(typeof b==="string"){var f=c.grep(a,function(e){return e.nodeType===1});if(Ua.test(b))return c.filter(b,f,!d);else b=c.filter(b,f)}return c.grep(a,function(e){return c.inArray(e,b)>=0===d})};c.fn.extend({find:function(a){for(var b=this.pushStack("","find",a),d=0,f=0,e=this.length;f<e;f++){d=b.length;
c.find(a,this[f],b);if(f>0)for(var j=d;j<b.length;j++)for(var i=0;i<d;i++)if(b[i]===b[j]){b.splice(j--,1);break}}return b},has:function(a){var b=c(a);return this.filter(function(){for(var d=0,f=b.length;d<f;d++)if(c.contains(this,b[d]))return true})},not:function(a){return this.pushStack(Ia(this,a,false),"not",a)},filter:function(a){return this.pushStack(Ia(this,a,true),"filter",a)},is:function(a){return!!a&&c.filter(a,this).length>0},closest:function(a,b){if(c.isArray(a)){var d=[],f=this[0],e,j=
{},i;if(f&&a.length){e=0;for(var o=a.length;e<o;e++){i=a[e];j[i]||(j[i]=c.expr.match.POS.test(i)?c(i,b||this.context):i)}for(;f&&f.ownerDocument&&f!==b;){for(i in j){e=j[i];if(e.jquery?e.index(f)>-1:c(f).is(e)){d.push({selector:i,elem:f});delete j[i]}}f=f.parentNode}}return d}var k=c.expr.match.POS.test(a)?c(a,b||this.context):null;return this.map(function(n,r){for(;r&&r.ownerDocument&&r!==b;){if(k?k.index(r)>-1:c(r).is(a))return r;r=r.parentNode}return null})},index:function(a){if(!a||typeof a===
"string")return c.inArray(this[0],a?c(a):this.parent().children());return c.inArray(a.jquery?a[0]:a,this)},add:function(a,b){a=typeof a==="string"?c(a,b||this.context):c.makeArray(a);b=c.merge(this.get(),a);return this.pushStack(qa(a[0])||qa(b[0])?b:c.unique(b))},andSelf:function(){return this.add(this.prevObject)}});c.each({parent:function(a){return(a=a.parentNode)&&a.nodeType!==11?a:null},parents:function(a){return c.dir(a,"parentNode")},parentsUntil:function(a,b,d){return c.dir(a,"parentNode",
d)},next:function(a){return c.nth(a,2,"nextSibling")},prev:function(a){return c.nth(a,2,"previousSibling")},nextAll:function(a){return c.dir(a,"nextSibling")},prevAll:function(a){return c.dir(a,"previousSibling")},nextUntil:function(a,b,d){return c.dir(a,"nextSibling",d)},prevUntil:function(a,b,d){return c.dir(a,"previousSibling",d)},siblings:function(a){return c.sibling(a.parentNode.firstChild,a)},children:function(a){return c.sibling(a.firstChild)},contents:function(a){return c.nodeName(a,"iframe")?
a.contentDocument||a.contentWindow.document:c.makeArray(a.childNodes)}},function(a,b){c.fn[a]=function(d,f){var e=c.map(this,b,d);eb.test(a)||(f=d);if(f&&typeof f==="string")e=c.filter(f,e);e=this.length>1?c.unique(e):e;if((this.length>1||gb.test(f))&&fb.test(a))e=e.reverse();return this.pushStack(e,a,R.call(arguments).join(","))}});c.extend({filter:function(a,b,d){if(d)a=":not("+a+")";return c.find.matches(a,b)},dir:function(a,b,d){var f=[];for(a=a[b];a&&a.nodeType!==9&&(d===w||a.nodeType!==1||!c(a).is(d));){a.nodeType===
1&&f.push(a);a=a[b]}return f},nth:function(a,b,d){b=b||1;for(var f=0;a;a=a[d])if(a.nodeType===1&&++f===b)break;return a},sibling:function(a,b){for(var d=[];a;a=a.nextSibling)a.nodeType===1&&a!==b&&d.push(a);return d}});var Ja=/ jQuery\d+="(?:\d+|null)"/g,V=/^\s+/,Ka=/(<([\w:]+)[^>]*?)\/>/g,hb=/^(?:area|br|col|embed|hr|img|input|link|meta|param)$/i,La=/<([\w:]+)/,ib=/<tbody/i,jb=/<|&#?\w+;/,ta=/<script|<object|<embed|<option|<style/i,ua=/checked\s*(?:[^=]|=\s*.checked.)/i,Ma=function(a,b,d){return hb.test(d)?
a:b+"></"+d+">"},F={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]};F.optgroup=F.option;F.tbody=F.tfoot=F.colgroup=F.caption=F.thead;F.th=F.td;if(!c.support.htmlSerialize)F._default=[1,"div<div>","</div>"];c.fn.extend({text:function(a){if(c.isFunction(a))return this.each(function(b){var d=
c(this);d.text(a.call(this,b,d.text()))});if(typeof a!=="object"&&a!==w)return this.empty().append((this[0]&&this[0].ownerDocument||s).createTextNode(a));return c.text(this)},wrapAll:function(a){if(c.isFunction(a))return this.each(function(d){c(this).wrapAll(a.call(this,d))});if(this[0]){var b=c(a,this[0].ownerDocument).eq(0).clone(true);this[0].parentNode&&b.insertBefore(this[0]);b.map(function(){for(var d=this;d.firstChild&&d.firstChild.nodeType===1;)d=d.firstChild;return d}).append(this)}return this},
wrapInner:function(a){if(c.isFunction(a))return this.each(function(b){c(this).wrapInner(a.call(this,b))});return this.each(function(){var b=c(this),d=b.contents();d.length?d.wrapAll(a):b.append(a)})},wrap:function(a){return this.each(function(){c(this).wrapAll(a)})},unwrap:function(){return this.parent().each(function(){c.nodeName(this,"body")||c(this).replaceWith(this.childNodes)}).end()},append:function(){return this.domManip(arguments,true,function(a){this.nodeType===1&&this.appendChild(a)})},
prepend:function(){return this.domManip(arguments,true,function(a){this.nodeType===1&&this.insertBefore(a,this.firstChild)})},before:function(){if(this[0]&&this[0].parentNode)return this.domManip(arguments,false,function(b){this.parentNode.insertBefore(b,this)});else if(arguments.length){var a=c(arguments[0]);a.push.apply(a,this.toArray());return this.pushStack(a,"before",arguments)}},after:function(){if(this[0]&&this[0].parentNode)return this.domManip(arguments,false,function(b){this.parentNode.insertBefore(b,
this.nextSibling)});else if(arguments.length){var a=this.pushStack(this,"after",arguments);a.push.apply(a,c(arguments[0]).toArray());return a}},remove:function(a,b){for(var d=0,f;(f=this[d])!=null;d++)if(!a||c.filter(a,[f]).length){if(!b&&f.nodeType===1){c.cleanData(f.getElementsByTagName("*"));c.cleanData([f])}f.parentNode&&f.parentNode.removeChild(f)}return this},empty:function(){for(var a=0,b;(b=this[a])!=null;a++)for(b.nodeType===1&&c.cleanData(b.getElementsByTagName("*"));b.firstChild;)b.removeChild(b.firstChild);
return this},clone:function(a){var b=this.map(function(){if(!c.support.noCloneEvent&&!c.isXMLDoc(this)){var d=this.outerHTML,f=this.ownerDocument;if(!d){d=f.createElement("div");d.appendChild(this.cloneNode(true));d=d.innerHTML}return c.clean([d.replace(Ja,"").replace(/=([^="'>\s]+\/)>/g,'="$1">').replace(V,"")],f)[0]}else return this.cloneNode(true)});if(a===true){ra(this,b);ra(this.find("*"),b.find("*"))}return b},html:function(a){if(a===w)return this[0]&&this[0].nodeType===1?this[0].innerHTML.replace(Ja,
""):null;else if(typeof a==="string"&&!ta.test(a)&&(c.support.leadingWhitespace||!V.test(a))&&!F[(La.exec(a)||["",""])[1].toLowerCase()]){a=a.replace(Ka,Ma);try{for(var b=0,d=this.length;b<d;b++)if(this[b].nodeType===1){c.cleanData(this[b].getElementsByTagName("*"));this[b].innerHTML=a}}catch(f){this.empty().append(a)}}else c.isFunction(a)?this.each(function(e){var j=c(this),i=j.html();j.empty().append(function(){return a.call(this,e,i)})}):this.empty().append(a);return this},replaceWith:function(a){if(this[0]&&
this[0].parentNode){if(c.isFunction(a))return this.each(function(b){var d=c(this),f=d.html();d.replaceWith(a.call(this,b,f))});if(typeof a!=="string")a=c(a).detach();return this.each(function(){var b=this.nextSibling,d=this.parentNode;c(this).remove();b?c(b).before(a):c(d).append(a)})}else return this.pushStack(c(c.isFunction(a)?a():a),"replaceWith",a)},detach:function(a){return this.remove(a,true)},domManip:function(a,b,d){function f(u){return c.nodeName(u,"table")?u.getElementsByTagName("tbody")[0]||
u.appendChild(u.ownerDocument.createElement("tbody")):u}var e,j,i=a[0],o=[],k;if(!c.support.checkClone&&arguments.length===3&&typeof i==="string"&&ua.test(i))return this.each(function(){c(this).domManip(a,b,d,true)});if(c.isFunction(i))return this.each(function(u){var z=c(this);a[0]=i.call(this,u,b?z.html():w);z.domManip(a,b,d)});if(this[0]){e=i&&i.parentNode;e=c.support.parentNode&&e&&e.nodeType===11&&e.childNodes.length===this.length?{fragment:e}:sa(a,this,o);k=e.fragment;if(j=k.childNodes.length===
1?(k=k.firstChild):k.firstChild){b=b&&c.nodeName(j,"tr");for(var n=0,r=this.length;n<r;n++)d.call(b?f(this[n],j):this[n],n>0||e.cacheable||this.length>1?k.cloneNode(true):k)}o.length&&c.each(o,Qa)}return this}});c.fragments={};c.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){c.fn[a]=function(d){var f=[];d=c(d);var e=this.length===1&&this[0].parentNode;if(e&&e.nodeType===11&&e.childNodes.length===1&&d.length===1){d[b](this[0]);
return this}else{e=0;for(var j=d.length;e<j;e++){var i=(e>0?this.clone(true):this).get();c.fn[b].apply(c(d[e]),i);f=f.concat(i)}return this.pushStack(f,a,d.selector)}}});c.extend({clean:function(a,b,d,f){b=b||s;if(typeof b.createElement==="undefined")b=b.ownerDocument||b[0]&&b[0].ownerDocument||s;for(var e=[],j=0,i;(i=a[j])!=null;j++){if(typeof i==="number")i+="";if(i){if(typeof i==="string"&&!jb.test(i))i=b.createTextNode(i);else if(typeof i==="string"){i=i.replace(Ka,Ma);var o=(La.exec(i)||["",
""])[1].toLowerCase(),k=F[o]||F._default,n=k[0],r=b.createElement("div");for(r.innerHTML=k[1]+i+k[2];n--;)r=r.lastChild;if(!c.support.tbody){n=ib.test(i);o=o==="table"&&!n?r.firstChild&&r.firstChild.childNodes:k[1]==="<table>"&&!n?r.childNodes:[];for(k=o.length-1;k>=0;--k)c.nodeName(o[k],"tbody")&&!o[k].childNodes.length&&o[k].parentNode.removeChild(o[k])}!c.support.leadingWhitespace&&V.test(i)&&r.insertBefore(b.createTextNode(V.exec(i)[0]),r.firstChild);i=r.childNodes}if(i.nodeType)e.push(i);else e=
c.merge(e,i)}}if(d)for(j=0;e[j];j++)if(f&&c.nodeName(e[j],"script")&&(!e[j].type||e[j].type.toLowerCase()==="text/javascript"))f.push(e[j].parentNode?e[j].parentNode.removeChild(e[j]):e[j]);else{e[j].nodeType===1&&e.splice.apply(e,[j+1,0].concat(c.makeArray(e[j].getElementsByTagName("script"))));d.appendChild(e[j])}return e},cleanData:function(a){for(var b,d,f=c.cache,e=c.event.special,j=c.support.deleteExpando,i=0,o;(o=a[i])!=null;i++)if(d=o[c.expando]){b=f[d];if(b.events)for(var k in b.events)e[k]?
c.event.remove(o,k):Ca(o,k,b.handle);if(j)delete o[c.expando];else o.removeAttribute&&o.removeAttribute(c.expando);delete f[d]}}});var kb=/z-?index|font-?weight|opacity|zoom|line-?height/i,Na=/alpha\([^)]*\)/,Oa=/opacity=([^)]*)/,ha=/float/i,ia=/-([a-z])/ig,lb=/([A-Z])/g,mb=/^-?\d+(?:px)?$/i,nb=/^-?\d/,ob={position:"absolute",visibility:"hidden",display:"block"},pb=["Left","Right"],qb=["Top","Bottom"],rb=s.defaultView&&s.defaultView.getComputedStyle,Pa=c.support.cssFloat?"cssFloat":"styleFloat",ja=
function(a,b){return b.toUpperCase()};c.fn.css=function(a,b){return X(this,a,b,true,function(d,f,e){if(e===w)return c.curCSS(d,f);if(typeof e==="number"&&!kb.test(f))e+="px";c.style(d,f,e)})};c.extend({style:function(a,b,d){if(!a||a.nodeType===3||a.nodeType===8)return w;if((b==="width"||b==="height")&&parseFloat(d)<0)d=w;var f=a.style||a,e=d!==w;if(!c.support.opacity&&b==="opacity"){if(e){f.zoom=1;b=parseInt(d,10)+""==="NaN"?"":"alpha(opacity="+d*100+")";a=f.filter||c.curCSS(a,"filter")||"";f.filter=
Na.test(a)?a.replace(Na,b):b}return f.filter&&f.filter.indexOf("opacity=")>=0?parseFloat(Oa.exec(f.filter)[1])/100+"":""}if(ha.test(b))b=Pa;b=b.replace(ia,ja);if(e)f[b]=d;return f[b]},css:function(a,b,d,f){if(b==="width"||b==="height"){var e,j=b==="width"?pb:qb;function i(){e=b==="width"?a.offsetWidth:a.offsetHeight;f!=="border"&&c.each(j,function(){f||(e-=parseFloat(c.curCSS(a,"padding"+this,true))||0);if(f==="margin")e+=parseFloat(c.curCSS(a,"margin"+this,true))||0;else e-=parseFloat(c.curCSS(a,
"border"+this+"Width",true))||0})}a.offsetWidth!==0?i():c.swap(a,ob,i);return Math.max(0,Math.round(e))}return c.curCSS(a,b,d)},curCSS:function(a,b,d){var f,e=a.style;if(!c.support.opacity&&b==="opacity"&&a.currentStyle){f=Oa.test(a.currentStyle.filter||"")?parseFloat(RegExp.$1)/100+"":"";return f===""?"1":f}if(ha.test(b))b=Pa;if(!d&&e&&e[b])f=e[b];else if(rb){if(ha.test(b))b="float";b=b.replace(lb,"-$1").toLowerCase();e=a.ownerDocument.defaultView;if(!e)return null;if(a=e.getComputedStyle(a,null))f=
a.getPropertyValue(b);if(b==="opacity"&&f==="")f="1"}else if(a.currentStyle){d=b.replace(ia,ja);f=a.currentStyle[b]||a.currentStyle[d];if(!mb.test(f)&&nb.test(f)){b=e.left;var j=a.runtimeStyle.left;a.runtimeStyle.left=a.currentStyle.left;e.left=d==="fontSize"?"1em":f||0;f=e.pixelLeft+"px";e.left=b;a.runtimeStyle.left=j}}return f},swap:function(a,b,d){var f={};for(var e in b){f[e]=a.style[e];a.style[e]=b[e]}d.call(a);for(e in b)a.style[e]=f[e]}});if(c.expr&&c.expr.filters){c.expr.filters.hidden=function(a){var b=
a.offsetWidth,d=a.offsetHeight,f=a.nodeName.toLowerCase()==="tr";return b===0&&d===0&&!f?true:b>0&&d>0&&!f?false:c.curCSS(a,"display")==="none"};c.expr.filters.visible=function(a){return!c.expr.filters.hidden(a)}}var sb=J(),tb=/<script(.|\s)*?\/script>/gi,ub=/select|textarea/i,vb=/color|date|datetime|email|hidden|month|number|password|range|search|tel|text|time|url|week/i,N=/=\?(&|$)/,ka=/\?/,wb=/(\?|&)_=.*?(&|$)/,xb=/^(\w+:)?\/\/([^\/?#]+)/,yb=/%20/g,zb=c.fn.load;c.fn.extend({load:function(a,b,d){if(typeof a!==
"string")return zb.call(this,a);else if(!this.length)return this;var f=a.indexOf(" ");if(f>=0){var e=a.slice(f,a.length);a=a.slice(0,f)}f="GET";if(b)if(c.isFunction(b)){d=b;b=null}else if(typeof b==="object"){b=c.param(b,c.ajaxSettings.traditional);f="POST"}var j=this;c.ajax({url:a,type:f,dataType:"html",data:b,complete:function(i,o){if(o==="success"||o==="notmodified")j.html(e?c("<div />").append(i.responseText.replace(tb,"")).find(e):i.responseText);d&&j.each(d,[i.responseText,o,i])}});return this},
serialize:function(){return c.param(this.serializeArray())},serializeArray:function(){return this.map(function(){return this.elements?c.makeArray(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||ub.test(this.nodeName)||vb.test(this.type))}).map(function(a,b){a=c(this).val();return a==null?null:c.isArray(a)?c.map(a,function(d){return{name:b.name,value:d}}):{name:b.name,value:a}}).get()}});c.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "),
function(a,b){c.fn[b]=function(d){return this.bind(b,d)}});c.extend({get:function(a,b,d,f){if(c.isFunction(b)){f=f||d;d=b;b=null}return c.ajax({type:"GET",url:a,data:b,success:d,dataType:f})},getScript:function(a,b){return c.get(a,null,b,"script")},getJSON:function(a,b,d){return c.get(a,b,d,"json")},post:function(a,b,d,f){if(c.isFunction(b)){f=f||d;d=b;b={}}return c.ajax({type:"POST",url:a,data:b,success:d,dataType:f})},ajaxSetup:function(a){c.extend(c.ajaxSettings,a)},ajaxSettings:{url:location.href,
global:true,type:"GET",contentType:"application/x-www-form-urlencoded",processData:true,async:true,xhr:A.XMLHttpRequest&&(A.location.protocol!=="file:"||!A.ActiveXObject)?function(){return new A.XMLHttpRequest}:function(){try{return new A.ActiveXObject("Microsoft.XMLHTTP")}catch(a){}},accepts:{xml:"application/xml, text/xml",html:"text/html",script:"text/javascript, application/javascript",json:"application/json, text/javascript",text:"text/plain",_default:"*/*"}},lastModified:{},etag:{},ajax:function(a){function b(){e.success&&
e.success.call(k,o,i,x);e.global&&f("ajaxSuccess",[x,e])}function d(){e.complete&&e.complete.call(k,x,i);e.global&&f("ajaxComplete",[x,e]);e.global&&!--c.active&&c.event.trigger("ajaxStop")}function f(q,p){(e.context?c(e.context):c.event).trigger(q,p)}var e=c.extend(true,{},c.ajaxSettings,a),j,i,o,k=a&&a.context||e,n=e.type.toUpperCase();if(e.data&&e.processData&&typeof e.data!=="string")e.data=c.param(e.data,e.traditional);if(e.dataType==="jsonp"){if(n==="GET")N.test(e.url)||(e.url+=(ka.test(e.url)?
"&":"?")+(e.jsonp||"callback")+"=?");else if(!e.data||!N.test(e.data))e.data=(e.data?e.data+"&":"")+(e.jsonp||"callback")+"=?";e.dataType="json"}if(e.dataType==="json"&&(e.data&&N.test(e.data)||N.test(e.url))){j=e.jsonpCallback||"jsonp"+sb++;if(e.data)e.data=(e.data+"").replace(N,"="+j+"$1");e.url=e.url.replace(N,"="+j+"$1");e.dataType="script";A[j]=A[j]||function(q){o=q;b();d();A[j]=w;try{delete A[j]}catch(p){}z&&z.removeChild(C)}}if(e.dataType==="script"&&e.cache===null)e.cache=false;if(e.cache===
false&&n==="GET"){var r=J(),u=e.url.replace(wb,"$1_="+r+"$2");e.url=u+(u===e.url?(ka.test(e.url)?"&":"?")+"_="+r:"")}if(e.data&&n==="GET")e.url+=(ka.test(e.url)?"&":"?")+e.data;e.global&&!c.active++&&c.event.trigger("ajaxStart");r=(r=xb.exec(e.url))&&(r[1]&&r[1]!==location.protocol||r[2]!==location.host);if(e.dataType==="script"&&n==="GET"&&r){var z=s.getElementsByTagName("head")[0]||s.documentElement,C=s.createElement("script");C.src=e.url;if(e.scriptCharset)C.charset=e.scriptCharset;if(!j){var B=
false;C.onload=C.onreadystatechange=function(){if(!B&&(!this.readyState||this.readyState==="loaded"||this.readyState==="complete")){B=true;b();d();C.onload=C.onreadystatechange=null;z&&C.parentNode&&z.removeChild(C)}}}z.insertBefore(C,z.firstChild);return w}var E=false,x=e.xhr();if(x){e.username?x.open(n,e.url,e.async,e.username,e.password):x.open(n,e.url,e.async);try{if(e.data||a&&a.contentType)x.setRequestHeader("Content-Type",e.contentType);if(e.ifModified){c.lastModified[e.url]&&x.setRequestHeader("If-Modified-Since",
c.lastModified[e.url]);c.etag[e.url]&&x.setRequestHeader("If-None-Match",c.etag[e.url])}r||x.setRequestHeader("X-Requested-With","XMLHttpRequest");x.setRequestHeader("Accept",e.dataType&&e.accepts[e.dataType]?e.accepts[e.dataType]+", */*":e.accepts._default)}catch(ga){}if(e.beforeSend&&e.beforeSend.call(k,x,e)===false){e.global&&!--c.active&&c.event.trigger("ajaxStop");x.abort();return false}e.global&&f("ajaxSend",[x,e]);var g=x.onreadystatechange=function(q){if(!x||x.readyState===0||q==="abort"){E||
d();E=true;if(x)x.onreadystatechange=c.noop}else if(!E&&x&&(x.readyState===4||q==="timeout")){E=true;x.onreadystatechange=c.noop;i=q==="timeout"?"timeout":!c.httpSuccess(x)?"error":e.ifModified&&c.httpNotModified(x,e.url)?"notmodified":"success";var p;if(i==="success")try{o=c.httpData(x,e.dataType,e)}catch(v){i="parsererror";p=v}if(i==="success"||i==="notmodified")j||b();else c.handleError(e,x,i,p);d();q==="timeout"&&x.abort();if(e.async)x=null}};try{var h=x.abort;x.abort=function(){x&&h.call(x);
g("abort")}}catch(l){}e.async&&e.timeout>0&&setTimeout(function(){x&&!E&&g("timeout")},e.timeout);try{x.send(n==="POST"||n==="PUT"||n==="DELETE"?e.data:null)}catch(m){c.handleError(e,x,null,m);d()}e.async||g();return x}},handleError:function(a,b,d,f){if(a.error)a.error.call(a.context||a,b,d,f);if(a.global)(a.context?c(a.context):c.event).trigger("ajaxError",[b,a,f])},active:0,httpSuccess:function(a){try{return!a.status&&location.protocol==="file:"||a.status>=200&&a.status<300||a.status===304||a.status===
1223||a.status===0}catch(b){}return false},httpNotModified:function(a,b){var d=a.getResponseHeader("Last-Modified"),f=a.getResponseHeader("Etag");if(d)c.lastModified[b]=d;if(f)c.etag[b]=f;return a.status===304||a.status===0},httpData:function(a,b,d){var f=a.getResponseHeader("content-type")||"",e=b==="xml"||!b&&f.indexOf("xml")>=0;a=e?a.responseXML:a.responseText;e&&a.documentElement.nodeName==="parsererror"&&c.error("parsererror");if(d&&d.dataFilter)a=d.dataFilter(a,b);if(typeof a==="string")if(b===
"json"||!b&&f.indexOf("json")>=0)a=c.parseJSON(a);else if(b==="script"||!b&&f.indexOf("javascript")>=0)c.globalEval(a);return a},param:function(a,b){function d(i,o){if(c.isArray(o))c.each(o,function(k,n){b||/\[\]$/.test(i)?f(i,n):d(i+"["+(typeof n==="object"||c.isArray(n)?k:"")+"]",n)});else!b&&o!=null&&typeof o==="object"?c.each(o,function(k,n){d(i+"["+k+"]",n)}):f(i,o)}function f(i,o){o=c.isFunction(o)?o():o;e[e.length]=encodeURIComponent(i)+"="+encodeURIComponent(o)}var e=[];if(b===w)b=c.ajaxSettings.traditional;
if(c.isArray(a)||a.jquery)c.each(a,function(){f(this.name,this.value)});else for(var j in a)d(j,a[j]);return e.join("&").replace(yb,"+")}});var la={},Ab=/toggle|show|hide/,Bb=/^([+-]=)?([\d+-.]+)(.*)$/,W,va=[["height","marginTop","marginBottom","paddingTop","paddingBottom"],["width","marginLeft","marginRight","paddingLeft","paddingRight"],["opacity"]];c.fn.extend({show:function(a,b){if(a||a===0)return this.animate(K("show",3),a,b);else{a=0;for(b=this.length;a<b;a++){var d=c.data(this[a],"olddisplay");
this[a].style.display=d||"";if(c.css(this[a],"display")==="none"){d=this[a].nodeName;var f;if(la[d])f=la[d];else{var e=c("<"+d+" />").appendTo("body");f=e.css("display");if(f==="none")f="block";e.remove();la[d]=f}c.data(this[a],"olddisplay",f)}}a=0;for(b=this.length;a<b;a++)this[a].style.display=c.data(this[a],"olddisplay")||"";return this}},hide:function(a,b){if(a||a===0)return this.animate(K("hide",3),a,b);else{a=0;for(b=this.length;a<b;a++){var d=c.data(this[a],"olddisplay");!d&&d!=="none"&&c.data(this[a],
"olddisplay",c.css(this[a],"display"))}a=0;for(b=this.length;a<b;a++)this[a].style.display="none";return this}},_toggle:c.fn.toggle,toggle:function(a,b){var d=typeof a==="boolean";if(c.isFunction(a)&&c.isFunction(b))this._toggle.apply(this,arguments);else a==null||d?this.each(function(){var f=d?a:c(this).is(":hidden");c(this)[f?"show":"hide"]()}):this.animate(K("toggle",3),a,b);return this},fadeTo:function(a,b,d){return this.filter(":hidden").css("opacity",0).show().end().animate({opacity:b},a,d)},
animate:function(a,b,d,f){var e=c.speed(b,d,f);if(c.isEmptyObject(a))return this.each(e.complete);return this[e.queue===false?"each":"queue"](function(){var j=c.extend({},e),i,o=this.nodeType===1&&c(this).is(":hidden"),k=this;for(i in a){var n=i.replace(ia,ja);if(i!==n){a[n]=a[i];delete a[i];i=n}if(a[i]==="hide"&&o||a[i]==="show"&&!o)return j.complete.call(this);if((i==="height"||i==="width")&&this.style){j.display=c.css(this,"display");j.overflow=this.style.overflow}if(c.isArray(a[i])){(j.specialEasing=
j.specialEasing||{})[i]=a[i][1];a[i]=a[i][0]}}if(j.overflow!=null)this.style.overflow="hidden";j.curAnim=c.extend({},a);c.each(a,function(r,u){var z=new c.fx(k,j,r);if(Ab.test(u))z[u==="toggle"?o?"show":"hide":u](a);else{var C=Bb.exec(u),B=z.cur(true)||0;if(C){u=parseFloat(C[2]);var E=C[3]||"px";if(E!=="px"){k.style[r]=(u||1)+E;B=(u||1)/z.cur(true)*B;k.style[r]=B+E}if(C[1])u=(C[1]==="-="?-1:1)*u+B;z.custom(B,u,E)}else z.custom(B,u,"")}});return true})},stop:function(a,b){var d=c.timers;a&&this.queue([]);
this.each(function(){for(var f=d.length-1;f>=0;f--)if(d[f].elem===this){b&&d[f](true);d.splice(f,1)}});b||this.dequeue();return this}});c.each({slideDown:K("show",1),slideUp:K("hide",1),slideToggle:K("toggle",1),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"}},function(a,b){c.fn[a]=function(d,f){return this.animate(b,d,f)}});c.extend({speed:function(a,b,d){var f=a&&typeof a==="object"?a:{complete:d||!d&&b||c.isFunction(a)&&a,duration:a,easing:d&&b||b&&!c.isFunction(b)&&b};f.duration=c.fx.off?0:typeof f.duration===
"number"?f.duration:c.fx.speeds[f.duration]||c.fx.speeds._default;f.old=f.complete;f.complete=function(){f.queue!==false&&c(this).dequeue();c.isFunction(f.old)&&f.old.call(this)};return f},easing:{linear:function(a,b,d,f){return d+f*a},swing:function(a,b,d,f){return(-Math.cos(a*Math.PI)/2+0.5)*f+d}},timers:[],fx:function(a,b,d){this.options=b;this.elem=a;this.prop=d;if(!b.orig)b.orig={}}});c.fx.prototype={update:function(){this.options.step&&this.options.step.call(this.elem,this.now,this);(c.fx.step[this.prop]||
c.fx.step._default)(this);if((this.prop==="height"||this.prop==="width")&&this.elem.style)this.elem.style.display="block"},cur:function(a){if(this.elem[this.prop]!=null&&(!this.elem.style||this.elem.style[this.prop]==null))return this.elem[this.prop];return(a=parseFloat(c.css(this.elem,this.prop,a)))&&a>-10000?a:parseFloat(c.curCSS(this.elem,this.prop))||0},custom:function(a,b,d){function f(j){return e.step(j)}this.startTime=J();this.start=a;this.end=b;this.unit=d||this.unit||"px";this.now=this.start;
this.pos=this.state=0;var e=this;f.elem=this.elem;if(f()&&c.timers.push(f)&&!W)W=setInterval(c.fx.tick,13)},show:function(){this.options.orig[this.prop]=c.style(this.elem,this.prop);this.options.show=true;this.custom(this.prop==="width"||this.prop==="height"?1:0,this.cur());c(this.elem).show()},hide:function(){this.options.orig[this.prop]=c.style(this.elem,this.prop);this.options.hide=true;this.custom(this.cur(),0)},step:function(a){var b=J(),d=true;if(a||b>=this.options.duration+this.startTime){this.now=
this.end;this.pos=this.state=1;this.update();this.options.curAnim[this.prop]=true;for(var f in this.options.curAnim)if(this.options.curAnim[f]!==true)d=false;if(d){if(this.options.display!=null){this.elem.style.overflow=this.options.overflow;a=c.data(this.elem,"olddisplay");this.elem.style.display=a?a:this.options.display;if(c.css(this.elem,"display")==="none")this.elem.style.display="block"}this.options.hide&&c(this.elem).hide();if(this.options.hide||this.options.show)for(var e in this.options.curAnim)c.style(this.elem,
e,this.options.orig[e]);this.options.complete.call(this.elem)}return false}else{e=b-this.startTime;this.state=e/this.options.duration;a=this.options.easing||(c.easing.swing?"swing":"linear");this.pos=c.easing[this.options.specialEasing&&this.options.specialEasing[this.prop]||a](this.state,e,0,1,this.options.duration);this.now=this.start+(this.end-this.start)*this.pos;this.update()}return true}};c.extend(c.fx,{tick:function(){for(var a=c.timers,b=0;b<a.length;b++)a[b]()||a.splice(b--,1);a.length||
c.fx.stop()},stop:function(){clearInterval(W);W=null},speeds:{slow:600,fast:200,_default:400},step:{opacity:function(a){c.style(a.elem,"opacity",a.now)},_default:function(a){if(a.elem.style&&a.elem.style[a.prop]!=null)a.elem.style[a.prop]=(a.prop==="width"||a.prop==="height"?Math.max(0,a.now):a.now)+a.unit;else a.elem[a.prop]=a.now}}});if(c.expr&&c.expr.filters)c.expr.filters.animated=function(a){return c.grep(c.timers,function(b){return a===b.elem}).length};c.fn.offset="getBoundingClientRect"in s.documentElement?
function(a){var b=this[0];if(a)return this.each(function(e){c.offset.setOffset(this,a,e)});if(!b||!b.ownerDocument)return null;if(b===b.ownerDocument.body)return c.offset.bodyOffset(b);var d=b.getBoundingClientRect(),f=b.ownerDocument;b=f.body;f=f.documentElement;return{top:d.top+(self.pageYOffset||c.support.boxModel&&f.scrollTop||b.scrollTop)-(f.clientTop||b.clientTop||0),left:d.left+(self.pageXOffset||c.support.boxModel&&f.scrollLeft||b.scrollLeft)-(f.clientLeft||b.clientLeft||0)}}:function(a){var b=
this[0];if(a)return this.each(function(r){c.offset.setOffset(this,a,r)});if(!b||!b.ownerDocument)return null;if(b===b.ownerDocument.body)return c.offset.bodyOffset(b);c.offset.initialize();var d=b.offsetParent,f=b,e=b.ownerDocument,j,i=e.documentElement,o=e.body;f=(e=e.defaultView)?e.getComputedStyle(b,null):b.currentStyle;for(var k=b.offsetTop,n=b.offsetLeft;(b=b.parentNode)&&b!==o&&b!==i;){if(c.offset.supportsFixedPosition&&f.position==="fixed")break;j=e?e.getComputedStyle(b,null):b.currentStyle;
k-=b.scrollTop;n-=b.scrollLeft;if(b===d){k+=b.offsetTop;n+=b.offsetLeft;if(c.offset.doesNotAddBorder&&!(c.offset.doesAddBorderForTableAndCells&&/^t(able|d|h)$/i.test(b.nodeName))){k+=parseFloat(j.borderTopWidth)||0;n+=parseFloat(j.borderLeftWidth)||0}f=d;d=b.offsetParent}if(c.offset.subtractsBorderForOverflowNotVisible&&j.overflow!=="visible"){k+=parseFloat(j.borderTopWidth)||0;n+=parseFloat(j.borderLeftWidth)||0}f=j}if(f.position==="relative"||f.position==="static"){k+=o.offsetTop;n+=o.offsetLeft}if(c.offset.supportsFixedPosition&&
f.position==="fixed"){k+=Math.max(i.scrollTop,o.scrollTop);n+=Math.max(i.scrollLeft,o.scrollLeft)}return{top:k,left:n}};c.offset={initialize:function(){var a=s.body,b=s.createElement("div"),d,f,e,j=parseFloat(c.curCSS(a,"marginTop",true))||0;c.extend(b.style,{position:"absolute",top:0,left:0,margin:0,border:0,width:"1px",height:"1px",visibility:"hidden"});b.innerHTML="<div style='position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;'><div></div></div><table style='position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;' cellpadding='0' cellspacing='0'><tr><td></td></tr></table>";
a.insertBefore(b,a.firstChild);d=b.firstChild;f=d.firstChild;e=d.nextSibling.firstChild.firstChild;this.doesNotAddBorder=f.offsetTop!==5;this.doesAddBorderForTableAndCells=e.offsetTop===5;f.style.position="fixed";f.style.top="20px";this.supportsFixedPosition=f.offsetTop===20||f.offsetTop===15;f.style.position=f.style.top="";d.style.overflow="hidden";d.style.position="relative";this.subtractsBorderForOverflowNotVisible=f.offsetTop===-5;this.doesNotIncludeMarginInBodyOffset=a.offsetTop!==j;a.removeChild(b);
c.offset.initialize=c.noop},bodyOffset:function(a){var b=a.offsetTop,d=a.offsetLeft;c.offset.initialize();if(c.offset.doesNotIncludeMarginInBodyOffset){b+=parseFloat(c.curCSS(a,"marginTop",true))||0;d+=parseFloat(c.curCSS(a,"marginLeft",true))||0}return{top:b,left:d}},setOffset:function(a,b,d){if(/static/.test(c.curCSS(a,"position")))a.style.position="relative";var f=c(a),e=f.offset(),j=parseInt(c.curCSS(a,"top",true),10)||0,i=parseInt(c.curCSS(a,"left",true),10)||0;if(c.isFunction(b))b=b.call(a,
d,e);d={top:b.top-e.top+j,left:b.left-e.left+i};"using"in b?b.using.call(a,d):f.css(d)}};c.fn.extend({position:function(){if(!this[0])return null;var a=this[0],b=this.offsetParent(),d=this.offset(),f=/^body|html$/i.test(b[0].nodeName)?{top:0,left:0}:b.offset();d.top-=parseFloat(c.curCSS(a,"marginTop",true))||0;d.left-=parseFloat(c.curCSS(a,"marginLeft",true))||0;f.top+=parseFloat(c.curCSS(b[0],"borderTopWidth",true))||0;f.left+=parseFloat(c.curCSS(b[0],"borderLeftWidth",true))||0;return{top:d.top-
f.top,left:d.left-f.left}},offsetParent:function(){return this.map(function(){for(var a=this.offsetParent||s.body;a&&!/^body|html$/i.test(a.nodeName)&&c.css(a,"position")==="static";)a=a.offsetParent;return a})}});c.each(["Left","Top"],function(a,b){var d="scroll"+b;c.fn[d]=function(f){var e=this[0],j;if(!e)return null;if(f!==w)return this.each(function(){if(j=wa(this))j.scrollTo(!a?f:c(j).scrollLeft(),a?f:c(j).scrollTop());else this[d]=f});else return(j=wa(e))?"pageXOffset"in j?j[a?"pageYOffset":
"pageXOffset"]:c.support.boxModel&&j.document.documentElement[d]||j.document.body[d]:e[d]}});c.each(["Height","Width"],function(a,b){var d=b.toLowerCase();c.fn["inner"+b]=function(){return this[0]?c.css(this[0],d,false,"padding"):null};c.fn["outer"+b]=function(f){return this[0]?c.css(this[0],d,false,f?"margin":"border"):null};c.fn[d]=function(f){var e=this[0];if(!e)return f==null?null:this;if(c.isFunction(f))return this.each(function(j){var i=c(this);i[d](f.call(this,j,i[d]()))});return"scrollTo"in
e&&e.document?e.document.compatMode==="CSS1Compat"&&e.document.documentElement["client"+b]||e.document.body["client"+b]:e.nodeType===9?Math.max(e.documentElement["client"+b],e.body["scroll"+b],e.documentElement["scroll"+b],e.body["offset"+b],e.documentElement["offset"+b]):f===w?c.css(e,d):this.css(d,typeof f==="string"?f:f+"px")}});A.jQuery=A.$=c})(window);

// Move jQuery to $telerik
$telerik.$ = jQuery.noConflict(true);

var jQuery=window.jQuery=window.$=$telerik.$;

/*
 * jQuery Cycle Plugin (with Transition Definitions)
 * Examples and documentation at: http://jquery.malsup.com/cycle/
 * Copyright (c) 2007-2009 M. Alsup
 * Version: 2.73 (04-NOV-2009)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * Requires: jQuery v1.2.6 or later
 *
 * Originally based on the work of:
 *	1) Matt Oakes
 *	2) Torsten Baldes (http://medienfreunde.com/lab/innerfade/)
 *	3) Benjamin Sterling (http://www.benjaminsterling.com/experiments/jqShuffle/)
 */
(function(i){var l="2.73";if(i.support==undefined){i.support={opacity:!(i.browser.msie)}}function a(q){if(i.fn.cycle.debug){f(q)}}function f(){if(window.console&&window.console.log){window.console.log("[cycle] "+Array.prototype.join.call(arguments," "))}}i.fn.cycle=function(r,q){var s={s:this.selector,c:this.context};if(this.length===0&&r!="stop"){if(!i.isReady&&s.s){f("DOM not ready, queuing slideshow");i(function(){i(s.s,s.c).cycle(r,q)});return this}f("terminating; zero elements found by selector"+(i.isReady?"":" (DOM not ready)"));return this}return this.each(function(){var w=m(this,r,q);if(w===false){return}if(this.cycleTimeout){clearTimeout(this.cycleTimeout)}this.cycleTimeout=this.cyclePause=0;var x=i(this);var y=w.slideExpr?i(w.slideExpr,this):x.children();var u=y.get();if(u.length<2){f("terminating; too few slides: "+u.length);return}var t=k(x,y,u,w,s);if(t===false){return}var v=t.continuous?10:h(t.currSlide,t.nextSlide,t,!t.rev);if(v){v+=(t.delay||0);if(v<10){v=10}a("first timeout: "+v);this.cycleTimeout=setTimeout(function(){e(u,t,0,!t.rev)},v)}})};function m(q,t,r){if(q.cycleStop==undefined){q.cycleStop=0}if(t===undefined||t===null){t={}}if(t.constructor==String){switch(t){case"stop":q.cycleStop++;if(q.cycleTimeout){clearTimeout(q.cycleTimeout)}q.cycleTimeout=0;i(q).removeData("cycle.opts");return false;case"pause":q.cyclePause=1;return false;case"resume":q.cyclePause=0;if(r===true){t=i(q).data("cycle.opts");if(!t){f("options not found, can not resume");return false}if(q.cycleTimeout){clearTimeout(q.cycleTimeout);q.cycleTimeout=0}e(t.elements,t,1,1)}return false;case"prev":case"next":var u=i(q).data("cycle.opts");if(!u){f('options not found, "prev/next" ignored');return false}i.fn.cycle[t](u);return false;default:t={fx:t}}return t}else{if(t.constructor==Number){var s=t;t=i(q).data("cycle.opts");if(!t){f("options not found, can not advance slide");return false}if(s<0||s>=t.elements.length){f("invalid slide index: "+s);return false}t.nextSlide=s;if(q.cycleTimeout){clearTimeout(q.cycleTimeout);q.cycleTimeout=0}if(typeof r=="string"){t.oneTimeFx=r}e(t.elements,t,1,s>=t.currSlide);return false}}return t}function b(q,r){if(!i.support.opacity&&r.cleartype&&q.style.filter){try{q.style.removeAttribute("filter")}catch(s){}}}function k(y,J,u,t,E){var C=i.extend({},i.fn.cycle.defaults,t||{},i.metadata?y.metadata():i.meta?y.data():{});if(C.autostop){C.countdown=C.autostopCount||u.length}var r=y[0];y.data("cycle.opts",C);C.$cont=y;C.stopCount=r.cycleStop;C.elements=u;C.before=C.before?[C.before]:[];C.after=C.after?[C.after]:[];C.after.unshift(function(){C.busy=0});if(!i.support.opacity&&C.cleartype){C.after.push(function(){b(this,C)})}if(C.continuous){C.after.push(function(){e(u,C,0,!C.rev)})}n(C);if(!i.support.opacity&&C.cleartype&&!C.cleartypeNoBg){g(J)}if(y.css("position")=="static"){y.css("position","relative")}if(C.width){y.width(C.width)}if(C.height&&C.height!="auto"){y.height(C.height)}if(C.startingSlide){C.startingSlide=parseInt(C.startingSlide)}if(C.random){C.randomMap=[];for(var H=0;H<u.length;H++){C.randomMap.push(H)}C.randomMap.sort(function(L,w){return Math.random()-0.5});C.randomIndex=0;C.startingSlide=C.randomMap[0]}else{if(C.startingSlide>=u.length){C.startingSlide=0}}C.currSlide=C.startingSlide=C.startingSlide||0;var x=C.startingSlide;J.css({position:"absolute",top:0,left:0}).hide().each(function(w){var L=x?w>=x?u.length-(w-x):x-w:u.length-w;i(this).css("z-index",L)});i(u[x]).css("opacity",1).show();b(u[x],C);if(C.fit&&C.width){J.width(C.width)}if(C.fit&&C.height&&C.height!="auto"){J.height(C.height)}var D=C.containerResize&&!y.innerHeight();if(D){var v=0,B=0;for(var F=0;F<u.length;F++){var q=i(u[F]),K=q[0],A=q.outerWidth(),I=q.outerHeight();if(!A){A=K.offsetWidth}if(!I){I=K.offsetHeight}v=A>v?A:v;B=I>B?I:B}if(v>0&&B>0){y.css({width:v+"px",height:B+"px"})}}if(C.pause){y.hover(function(){this.cyclePause++},function(){this.cyclePause--})}if(c(C)===false){return false}var s=false;t.requeueAttempts=t.requeueAttempts||0;J.each(function(){var N=i(this);this.cycleH=(C.fit&&C.height)?C.height:N.height();this.cycleW=(C.fit&&C.width)?C.width:N.width();if(N.is("img")){var L=(i.browser.msie&&this.cycleW==28&&this.cycleH==30&&!this.complete);var O=(i.browser.mozilla&&this.cycleW==34&&this.cycleH==19&&!this.complete);var M=(i.browser.opera&&((this.cycleW==42&&this.cycleH==19)||(this.cycleW==37&&this.cycleH==17))&&!this.complete);var w=(this.cycleH==0&&this.cycleW==0&&!this.complete);if(L||O||M||w){if(E.s&&C.requeueOnImageNotLoaded&&++t.requeueAttempts<100){f(t.requeueAttempts," - img slide not loaded, requeuing slideshow: ",this.src,this.cycleW,this.cycleH);setTimeout(function(){i(E.s,E.c).cycle(t)},C.requeueTimeout);s=true;return false}else{f("could not determine size of image: "+this.src,this.cycleW,this.cycleH)}}}return true});if(s){return false}C.cssBefore=C.cssBefore||{};C.animIn=C.animIn||{};C.animOut=C.animOut||{};J.not(":eq("+x+")").css(C.cssBefore);if(C.cssFirst){i(J[x]).css(C.cssFirst)}if(C.timeout){C.timeout=parseInt(C.timeout);if(C.speed.constructor==String){C.speed=i.fx.speeds[C.speed]||parseInt(C.speed)}if(!C.sync){C.speed=C.speed/2}while((C.timeout-C.speed)<250){C.timeout+=C.speed}}if(C.easing){C.easeIn=C.easeOut=C.easing}if(!C.speedIn){C.speedIn=C.speed}if(!C.speedOut){C.speedOut=C.speed}C.slideCount=u.length;C.currSlide=C.lastSlide=x;if(C.random){C.nextSlide=C.currSlide;if(++C.randomIndex==u.length){C.randomIndex=0}C.nextSlide=C.randomMap[C.randomIndex]}else{C.nextSlide=C.startingSlide>=(u.length-1)?0:C.startingSlide+1}if(!C.multiFx){var G=i.fn.cycle.transitions[C.fx];if(i.isFunction(G)){G(y,J,C)}else{if(C.fx!="custom"&&!C.multiFx){f("unknown transition: "+C.fx,"; slideshow terminating");return false}}}var z=J[x];if(C.before.length){C.before[0].apply(z,[z,z,C,true])}if(C.after.length>1){C.after[1].apply(z,[z,z,C,true])}if(C.next){i(C.next).bind(C.prevNextEvent,function(){return o(C,C.rev?-1:1)})}if(C.prev){i(C.prev).bind(C.prevNextEvent,function(){return o(C,C.rev?1:-1)})}if(C.pager){d(u,C)}j(C,u);return C}function n(q){q.original={before:[],after:[]};q.original.cssBefore=i.extend({},q.cssBefore);q.original.cssAfter=i.extend({},q.cssAfter);q.original.animIn=i.extend({},q.animIn);q.original.animOut=i.extend({},q.animOut);i.each(q.before,function(){q.original.before.push(this)});i.each(q.after,function(){q.original.after.push(this)})}function c(w){var u,s,r=i.fn.cycle.transitions;if(w.fx.indexOf(",")>0){w.multiFx=true;w.fxs=w.fx.replace(/\s*/g,"").split(",");for(u=0;u<w.fxs.length;u++){var v=w.fxs[u];s=r[v];if(!s||!r.hasOwnProperty(v)||!i.isFunction(s)){f("discarding unknown transition: ",v);w.fxs.splice(u,1);u--}}if(!w.fxs.length){f("No valid transitions named; slideshow terminating.");return false}}else{if(w.fx=="all"){w.multiFx=true;w.fxs=[];for(p in r){s=r[p];if(r.hasOwnProperty(p)&&i.isFunction(s)){w.fxs.push(p)}}}}if(w.multiFx&&w.randomizeEffects){var t=Math.floor(Math.random()*20)+30;for(u=0;u<t;u++){var q=Math.floor(Math.random()*w.fxs.length);w.fxs.push(w.fxs.splice(q,1)[0])}a("randomized fx sequence: ",w.fxs)}return true}function j(r,q){r.addSlide=function(u,v){var t=i(u),w=t[0];if(!r.autostopCount){r.countdown++}q[v?"unshift":"push"](w);if(r.els){r.els[v?"unshift":"push"](w)}r.slideCount=q.length;t.css("position","absolute");t[v?"prependTo":"appendTo"](r.$cont);if(v){r.currSlide++;r.nextSlide++}if(!i.support.opacity&&r.cleartype&&!r.cleartypeNoBg){g(t)}if(r.fit&&r.width){t.width(r.width)}if(r.fit&&r.height&&r.height!="auto"){$slides.height(r.height)}w.cycleH=(r.fit&&r.height)?r.height:t.height();w.cycleW=(r.fit&&r.width)?r.width:t.width();t.css(r.cssBefore);if(r.pager){i.fn.cycle.createPagerAnchor(q.length-1,w,i(r.pager),q,r)}if(i.isFunction(r.onAddSlide)){r.onAddSlide(t)}else{t.hide()}}}i.fn.cycle.resetState=function(r,q){q=q||r.fx;r.before=[];r.after=[];r.cssBefore=i.extend({},r.original.cssBefore);r.cssAfter=i.extend({},r.original.cssAfter);r.animIn=i.extend({},r.original.animIn);r.animOut=i.extend({},r.original.animOut);r.fxFn=null;i.each(r.original.before,function(){r.before.push(this)});i.each(r.original.after,function(){r.after.push(this)});var s=i.fn.cycle.transitions[q];if(i.isFunction(s)){s(r.$cont,i(r.elements),r)}};function e(x,q,w,y){if(w&&q.busy&&q.manualTrump){i(x).stop(true,true);q.busy=false}if(q.busy){return}var u=q.$cont[0],A=x[q.currSlide],z=x[q.nextSlide];if(u.cycleStop!=q.stopCount||u.cycleTimeout===0&&!w){return}if(!w&&!u.cyclePause&&((q.autostop&&(--q.countdown<=0))||(q.nowrap&&!q.random&&q.nextSlide<q.currSlide))){if(q.end){q.end(q)}return}if(w||!u.cyclePause){var v=q.fx;A.cycleH=A.cycleH||i(A).height();A.cycleW=A.cycleW||i(A).width();z.cycleH=z.cycleH||i(z).height();z.cycleW=z.cycleW||i(z).width();if(q.multiFx){if(q.lastFx==undefined||++q.lastFx>=q.fxs.length){q.lastFx=0}v=q.fxs[q.lastFx];q.currFx=v}if(q.oneTimeFx){v=q.oneTimeFx;q.oneTimeFx=null}i.fn.cycle.resetState(q,v);if(q.before.length){i.each(q.before,function(B,C){if(u.cycleStop!=q.stopCount){return}C.apply(z,[A,z,q,y])})}var s=function(){i.each(q.after,function(B,C){if(u.cycleStop!=q.stopCount){return}C.apply(z,[A,z,q,y])})};if(q.nextSlide!=q.currSlide){q.busy=1;if(q.fxFn){q.fxFn(A,z,q,s,y)}else{if(i.isFunction(i.fn.cycle[q.fx])){i.fn.cycle[q.fx](A,z,q,s)}else{i.fn.cycle.custom(A,z,q,s,w&&q.fastOnEvent)}}}q.lastSlide=q.currSlide;if(q.random){q.currSlide=q.nextSlide;if(++q.randomIndex==x.length){q.randomIndex=0}q.nextSlide=q.randomMap[q.randomIndex]}else{var t=(q.nextSlide+1)==x.length;q.nextSlide=t?0:q.nextSlide+1;q.currSlide=t?x.length-1:q.nextSlide-1}if(q.pager){i.fn.cycle.updateActivePagerLink(q.pager,q.currSlide)}}var r=0;if(q.timeout&&!q.continuous){r=h(A,z,q,y)}else{if(q.continuous&&u.cyclePause){r=10}}if(r>0){u.cycleTimeout=setTimeout(function(){e(x,q,0,!q.rev)},r)}}i.fn.cycle.updateActivePagerLink=function(q,r){i(q).each(function(){i(this).find("a").removeClass("activeSlide").filter("a:eq("+r+")").addClass("activeSlide")})};function h(v,s,u,r){if(u.timeoutFn){var q=u.timeoutFn(v,s,u,r);while((q-u.speed)<250){q+=u.speed}a("calculated timeout: "+q+"; speed: "+u.speed);if(q!==false){return q}}return u.timeout}i.fn.cycle.next=function(q){o(q,q.rev?-1:1)};i.fn.cycle.prev=function(q){o(q,q.rev?1:-1)};function o(r,u){var q=r.elements;var t=r.$cont[0],s=t.cycleTimeout;if(s){clearTimeout(s);t.cycleTimeout=0}if(r.random&&u<0){r.randomIndex--;if(--r.randomIndex==-2){r.randomIndex=q.length-2}else{if(r.randomIndex==-1){r.randomIndex=q.length-1}}r.nextSlide=r.randomMap[r.randomIndex]}else{if(r.random){if(++r.randomIndex==q.length){r.randomIndex=0}r.nextSlide=r.randomMap[r.randomIndex]}else{r.nextSlide=r.currSlide+u;if(r.nextSlide<0){if(r.nowrap){return false}r.nextSlide=q.length-1}else{if(r.nextSlide>=q.length){if(r.nowrap){return false}r.nextSlide=0}}}}if(i.isFunction(r.prevNextClick)){r.prevNextClick(u>0,r.nextSlide,q[r.nextSlide])}e(q,r,1,u>=0);return false}function d(r,s){var q=i(s.pager);i.each(r,function(t,u){i.fn.cycle.createPagerAnchor(t,u,q,r,s)});i.fn.cycle.updateActivePagerLink(s.pager,s.startingSlide)}i.fn.cycle.createPagerAnchor=function(u,v,s,t,w){var r;if(i.isFunction(w.pagerAnchorBuilder)){r=w.pagerAnchorBuilder(u,v)}else{r='<a href="#">'+(u+1)+"</a>"}if(!r){return}var x=i(r);if(x.parents("body").length===0){var q=[];if(s.length>1){s.each(function(){var y=x.clone(true);i(this).append(y);q.push(y[0])});x=i(q)}else{x.appendTo(s)}}x.bind(w.pagerEvent,function(A){A.preventDefault();w.nextSlide=u;var z=w.$cont[0],y=z.cycleTimeout;if(y){clearTimeout(y);z.cycleTimeout=0}if(i.isFunction(w.pagerClick)){w.pagerClick(w.nextSlide,t[w.nextSlide])}e(t,w,1,w.currSlide<u);return false});if(w.pagerEvent!="click"){x.click(function(){return false})}if(w.pauseOnPagerHover){x.hover(function(){w.$cont[0].cyclePause++},function(){w.$cont[0].cyclePause--})}};i.fn.cycle.hopsFromLast=function(t,s){var r,q=t.lastSlide,u=t.currSlide;if(s){r=u>q?u-q:t.slideCount-q}else{r=u<q?q-u:q+t.slideCount-u}return r};function g(s){function r(t){t=parseInt(t).toString(16);return t.length<2?"0"+t:t}function q(w){for(;w&&w.nodeName.toLowerCase()!="html";w=w.parentNode){var t=i.css(w,"background-color");if(t.indexOf("rgb")>=0){var u=t.match(/\d+/g);return"#"+r(u[0])+r(u[1])+r(u[2])}if(t&&t!="transparent"){return t}}return"#ffffff"}s.each(function(){i(this).css("background-color",q(this))})}i.fn.cycle.commonReset=function(v,t,u,r,s,q){i(u.elements).not(v).hide();u.cssBefore.opacity=1;u.cssBefore.display="block";if(r!==false&&t.cycleW>0){u.cssBefore.width=t.cycleW}if(s!==false&&t.cycleH>0){u.cssBefore.height=t.cycleH}u.cssAfter=u.cssAfter||{};u.cssAfter.display="none";i(v).css("zIndex",u.slideCount+(q===true?1:0));i(t).css("zIndex",u.slideCount+(q===true?0:1))};i.fn.cycle.custom=function(B,v,q,s,r){var A=i(B),w=i(v);var t=q.speedIn,z=q.speedOut,u=q.easeIn,y=q.easeOut;w.css(q.cssBefore);if(r){if(typeof r=="number"){t=z=r}else{t=z=1}u=y=null}var x=function(){w.animate(q.animIn,t,u,s)};A.animate(q.animOut,z,y,function(){if(q.cssAfter){A.css(q.cssAfter)}if(!q.sync){x()}});if(q.sync){x()}};i.fn.cycle.transitions={fade:function(r,s,q){s.not(":eq("+q.currSlide+")").css("opacity",0);q.before.push(function(v,t,u){i.fn.cycle.commonReset(v,t,u);u.cssBefore.opacity=0});q.animIn={opacity:1};q.animOut={opacity:0};q.cssBefore={top:0,left:0}}};i.fn.cycle.ver=function(){return l};i.fn.cycle.defaults={fx:"fade",timeout:4000,timeoutFn:null,continuous:0,speed:1000,speedIn:null,speedOut:null,next:null,prev:null,prevNextClick:null,prevNextEvent:"click",pager:null,pagerClick:null,pagerEvent:"click",pagerAnchorBuilder:null,before:null,after:null,end:null,easing:null,easeIn:null,easeOut:null,shuffle:null,animIn:null,animOut:null,cssBefore:null,cssAfter:null,fxFn:null,height:"auto",startingSlide:0,sync:1,random:0,fit:0,containerResize:1,pause:0,pauseOnPagerHover:0,autostop:0,autostopCount:0,delay:0,slideExpr:null,cleartype:!i.support.opacity,cleartypeNoBg:false,nowrap:0,fastOnEvent:0,randomizeEffects:1,rev:0,manualTrump:true,requeueOnImageNotLoaded:true,requeueTimeout:250}})(jQuery);
/*
 * jQuery Cycle Plugin Transition Definitions
 * This script is a plugin for the jQuery Cycle Plugin
 * Examples and documentation at: http://malsup.com/jquery/cycle/
 * Copyright (c) 2007-2008 M. Alsup
 * Version:	 2.72
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 */
(function(a){a.fn.cycle.transitions.none=function(c,d,b){b.fxFn=function(g,e,f,h){a(e).show();a(g).hide();h()}};a.fn.cycle.transitions.scrollUp=function(d,e,c){d.css("overflow","hidden");c.before.push(a.fn.cycle.commonReset);var b=d.height();c.cssBefore={top:b,left:0};c.cssFirst={top:0};c.animIn={top:0};c.animOut={top:-b}};a.fn.cycle.transitions.scrollDown=function(d,e,c){d.css("overflow","hidden");c.before.push(a.fn.cycle.commonReset);var b=d.height();c.cssFirst={top:0};c.cssBefore={top:-b,left:0};c.animIn={top:0};c.animOut={top:b}};a.fn.cycle.transitions.scrollLeft=function(d,e,c){d.css("overflow","hidden");c.before.push(a.fn.cycle.commonReset);var b=d.width();c.cssFirst={left:0};c.cssBefore={left:b,top:0};c.animIn={left:0};c.animOut={left:0-b}};a.fn.cycle.transitions.scrollRight=function(d,e,c){d.css("overflow","hidden");c.before.push(a.fn.cycle.commonReset);var b=d.width();c.cssFirst={left:0};c.cssBefore={left:-b,top:0};c.animIn={left:0};c.animOut={left:b}};a.fn.cycle.transitions.scrollHorz=function(c,d,b){c.css("overflow","hidden").width();b.before.push(function(h,f,g,e){a.fn.cycle.commonReset(h,f,g);g.cssBefore.left=e?(f.cycleW-1):(1-f.cycleW);g.animOut.left=e?-h.cycleW:h.cycleW});b.cssFirst={left:0};b.cssBefore={top:0};b.animIn={left:0};b.animOut={top:0}};a.fn.cycle.transitions.scrollVert=function(c,d,b){c.css("overflow","hidden");b.before.push(function(h,f,g,e){a.fn.cycle.commonReset(h,f,g);g.cssBefore.top=e?(1-f.cycleH):(f.cycleH-1);g.animOut.top=e?h.cycleH:-h.cycleH});b.cssFirst={top:0};b.cssBefore={left:0};b.animIn={top:0};b.animOut={left:0}};a.fn.cycle.transitions.slideX=function(c,d,b){b.before.push(function(g,e,f){a(f.elements).not(g).hide();a.fn.cycle.commonReset(g,e,f,false,true);f.animIn.width=e.cycleW});b.cssBefore={left:0,top:0,width:0};b.animIn={width:"show"};b.animOut={width:0}};a.fn.cycle.transitions.slideY=function(c,d,b){b.before.push(function(g,e,f){a(f.elements).not(g).hide();a.fn.cycle.commonReset(g,e,f,true,false);f.animIn.height=e.cycleH});b.cssBefore={left:0,top:0,height:0};b.animIn={height:"show"};b.animOut={height:0}};a.fn.cycle.transitions.shuffle=function(e,f,d){var c,b=e.css("overflow","visible").width();f.css({left:0,top:0});d.before.push(function(i,g,h){a.fn.cycle.commonReset(i,g,h,true,true,true)});if(!d.speedAdjusted){d.speed=d.speed/2;d.speedAdjusted=true}d.random=0;d.shuffle=d.shuffle||{left:-b,top:15};d.els=[];for(c=0;c<f.length;c++){d.els.push(f[c])}for(c=0;c<d.currSlide;c++){d.els.push(d.els.shift())}d.fxFn=function(m,j,l,g,i){var h=i?a(m):a(j);a(j).css(l.cssBefore);var k=l.slideCount;h.animate(l.shuffle,l.speedIn,l.easeIn,function(){var o=a.fn.cycle.hopsFromLast(l,i);for(var q=0;q<o;q++){i?l.els.push(l.els.shift()):l.els.unshift(l.els.pop())}if(i){for(var r=0,n=l.els.length;r<n;r++){a(l.els[r]).css("z-index",n-r+k)}}else{var s=a(m).css("z-index");h.css("z-index",parseInt(s)+1+k)}h.animate({left:0,top:0},l.speedOut,l.easeOut,function(){a(i?this:m).hide();if(g){g()}})})};d.cssBefore={display:"block",opacity:1,top:0,left:0}};a.fn.cycle.transitions.turnUp=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,true,false);f.cssBefore.top=e.cycleH;f.animIn.height=e.cycleH});b.cssFirst={top:0};b.cssBefore={left:0,height:0};b.animIn={top:0};b.animOut={height:0}};a.fn.cycle.transitions.turnDown=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,true,false);f.animIn.height=e.cycleH;f.animOut.top=g.cycleH});b.cssFirst={top:0};b.cssBefore={left:0,top:0,height:0};b.animOut={height:0}};a.fn.cycle.transitions.turnLeft=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,false,true);f.cssBefore.left=e.cycleW;f.animIn.width=e.cycleW});b.cssBefore={top:0,width:0};b.animIn={left:0};b.animOut={width:0}};a.fn.cycle.transitions.turnRight=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,false,true);f.animIn.width=e.cycleW;f.animOut.left=g.cycleW});b.cssBefore={top:0,left:0,width:0};b.animIn={left:0};b.animOut={width:0}};a.fn.cycle.transitions.zoom=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,false,false,true);f.cssBefore.top=e.cycleH/2;f.cssBefore.left=e.cycleW/2;f.animIn={top:0,left:0,width:e.cycleW,height:e.cycleH};f.animOut={width:0,height:0,top:g.cycleH/2,left:g.cycleW/2}});b.cssFirst={top:0,left:0};b.cssBefore={width:0,height:0}};a.fn.cycle.transitions.fadeZoom=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,false,false);f.cssBefore.left=e.cycleW/2;f.cssBefore.top=e.cycleH/2;f.animIn={top:0,left:0,width:e.cycleW,height:e.cycleH}});b.cssBefore={width:0,height:0};b.animOut={opacity:0}};a.fn.cycle.transitions.blindX=function(d,e,c){var b=d.css("overflow","hidden").width();c.before.push(function(h,f,g){a.fn.cycle.commonReset(h,f,g);g.animIn.width=f.cycleW;g.animOut.left=h.cycleW});c.cssBefore={left:b,top:0};c.animIn={left:0};c.animOut={left:b}};a.fn.cycle.transitions.blindY=function(d,e,c){var b=d.css("overflow","hidden").height();c.before.push(function(h,f,g){a.fn.cycle.commonReset(h,f,g);g.animIn.height=f.cycleH;g.animOut.top=h.cycleH});c.cssBefore={top:b,left:0};c.animIn={top:0};c.animOut={top:b}};a.fn.cycle.transitions.blindZ=function(e,f,d){var c=e.css("overflow","hidden").height();var b=e.width();d.before.push(function(i,g,h){a.fn.cycle.commonReset(i,g,h);h.animIn.height=g.cycleH;h.animOut.top=i.cycleH});d.cssBefore={top:c,left:b};d.animIn={top:0,left:0};d.animOut={top:c,left:b}};a.fn.cycle.transitions.growX=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,false,true);f.cssBefore.left=this.cycleW/2;f.animIn={left:0,width:this.cycleW};f.animOut={left:0}});b.cssBefore={width:0,top:0}};a.fn.cycle.transitions.growY=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,true,false);f.cssBefore.top=this.cycleH/2;f.animIn={top:0,height:this.cycleH};f.animOut={top:0}});b.cssBefore={height:0,left:0}};a.fn.cycle.transitions.curtainX=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,false,true,true);f.cssBefore.left=e.cycleW/2;f.animIn={left:0,width:this.cycleW};f.animOut={left:g.cycleW/2,width:0}});b.cssBefore={top:0,width:0}};a.fn.cycle.transitions.curtainY=function(c,d,b){b.before.push(function(g,e,f){a.fn.cycle.commonReset(g,e,f,true,false,true);f.cssBefore.top=e.cycleH/2;f.animIn={top:0,height:e.cycleH};f.animOut={top:g.cycleH/2,height:0}});b.cssBefore={left:0,height:0}};a.fn.cycle.transitions.cover=function(f,g,e){var i=e.direction||"left";var b=f.css("overflow","hidden").width();var c=f.height();e.before.push(function(j,d,h){a.fn.cycle.commonReset(j,d,h);if(i=="right"){h.cssBefore.left=-b}else{if(i=="up"){h.cssBefore.top=c}else{if(i=="down"){h.cssBefore.top=-c}else{h.cssBefore.left=b}}}});e.animIn={left:0,top:0};e.animOut={opacity:1};e.cssBefore={top:0,left:0}};a.fn.cycle.transitions.uncover=function(f,g,e){var i=e.direction||"left";var b=f.css("overflow","hidden").width();var c=f.height();e.before.push(function(j,d,h){a.fn.cycle.commonReset(j,d,h,true,true,true);if(i=="right"){h.animOut.left=b}else{if(i=="up"){h.animOut.top=-c}else{if(i=="down"){h.animOut.top=c}else{h.animOut.left=-b}}}});e.animIn={left:0,top:0};e.animOut={opacity:1};e.cssBefore={top:0,left:0}};a.fn.cycle.transitions.toss=function(e,f,d){var b=e.css("overflow","visible").width();var c=e.height();d.before.push(function(i,g,h){a.fn.cycle.commonReset(i,g,h,true,true,true);if(!h.animOut.left&&!h.animOut.top){h.animOut={left:b*2,top:-c/2,opacity:0}}else{h.animOut.opacity=0}});d.cssBefore={left:0,top:0};d.animIn={left:0}};a.fn.cycle.transitions.wipe=function(s,m,e){var q=s.css("overflow","hidden").width();var j=s.height();e.cssBefore=e.cssBefore||{};var g;if(e.clip){if(/l2r/.test(e.clip)){g="rect(0px 0px "+j+"px 0px)"}else{if(/r2l/.test(e.clip)){g="rect(0px "+q+"px "+j+"px "+q+"px)"}else{if(/t2b/.test(e.clip)){g="rect(0px "+q+"px 0px 0px)"}else{if(/b2t/.test(e.clip)){g="rect("+j+"px "+q+"px "+j+"px 0px)"}else{if(/zoom/.test(e.clip)){var o=parseInt(j/2);var f=parseInt(q/2);g="rect("+o+"px "+f+"px "+o+"px "+f+"px)"}}}}}}e.cssBefore.clip=e.cssBefore.clip||g||"rect(0px 0px 0px 0px)";var k=e.cssBefore.clip.match(/(\d+)/g);var u=parseInt(k[0]),c=parseInt(k[1]),n=parseInt(k[2]),i=parseInt(k[3]);e.before.push(function(w,h,t){if(w==h){return}var d=a(w),b=a(h);a.fn.cycle.commonReset(w,h,t,true,true,false);t.cssAfter.display="block";var r=1,l=parseInt((t.speedIn/13))-1;(function v(){var y=u?u-parseInt(r*(u/l)):0;var z=i?i-parseInt(r*(i/l)):0;var A=n<j?n+parseInt(r*((j-n)/l||1)):j;var x=c<q?c+parseInt(r*((q-c)/l||1)):q;b.css({clip:"rect("+y+"px "+x+"px "+A+"px "+z+"px)"});(r++<=l)?setTimeout(v,13):d.css("display","none")})()});e.cssBefore={display:"block",opacity:1,top:0,left:0};e.animIn={left:0};e.animOut={left:0}}})(jQuery);
//my first jqurey plug-in
//izak coen
//18.5.2010

(function($){  
 $.fn.simpleScroll = function(options) {  
 
   var defaults = {  
        scrollDuration : 1400,
        scrollPause : 3000,
        animationType : "swing"
    };  
    
   var options = $.extend(defaults, options);  
  
    return this.each(function() {  
    
        obj = $(this);
        
        obj.mouseenter(function(){
            obj.stop();
        })
        obj.mouseleave(function(){
            scrollMe();
        })
        
        scrollMe();
        
        function scrollMe(){
            itemHeight = (obj.find('li:first').outerHeight(true));
            itemHeight = (-1)*itemHeight;
            objTop = obj.css("top").replace("px","")*1;
            
            if (objTop == 0){
                sTime = options.scrollDuration;
            }
            else {
                sTime = options.scrollDuration*(itemHeight-objTop)/itemHeight;
            }
            
            obj.animate({left:0}, options.scrollPause, function(){
                obj.animate({top:itemHeight}, sTime, options.animationType, function(){
                    obj.css("top", 0);
                    obj.append(obj.find('li:first'));
                    
                    scrollMe();
                });
                
            });
            
        }
      
    });  
 };  
})(jQuery); 
function populateBanners() {  var acronyms = document.getElementsByTagName("acronym"), ids = []; for (var i = 0, len = acronyms.length; i < len; i++) ids[ids.length] = acronyms[i].id.split("_BANNER_")[1]; if (ids.length && ids.length > 0) { var bannersiframe = document.createElement('iframe'); bannersiframe.id = 'bannersiframe'; bannersiframe.style.display = 'none'; bannersiframe.src = "BannersHandler.axd?mainID=" + nodeId + "&langID=" + langId + "&ids=" + ids.join(","); document.body.appendChild(bannersiframe); } }
function CreateFlashControl(DivID, WIDTH, HEIGHT, URL, WMODE, MENU) { var d = document.getElementById(DivID); FlObj = '<object classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0  width=' + WIDTH + ' height=' + HEIGHT + '>'; FlObj = FlObj + '<param name="movie" value=' + URL + '>'; FlObj = FlObj + '<param name="wmode" value=' + WMODE + '>'; FlObj = FlObj + '<param name="menu" value=' + MENU + '>'; FlObj = FlObj + '<embed src=' + URL + '  wmode=' + WMODE + ' quality=high pluginspage=http://www.macromedia.com/go/getflashplayer type=application/x-shockwave-flash width=' + WIDTH + ' height=' + HEIGHT + '></embed></object>'; d.innerHTML = FlObj; }
function clearf() { for (var i = 0; i < document.forms[0].elements.length; i++) { if (document.forms[0].elements[i].type == "text" || document.forms[0].elements[i].type == "textarea" || document.forms[0].elements[i].type == "password") document.forms[0].elements[i].value = ""; else if (document.forms[0].elements[i].type == "select-one") document.forms[0].elements[i].selectedIndex = 0; else if (document.forms[0].elements[i].type == "checkbox") document.forms[0].elements[i].checked = false; } }
function SetJS(location, tag) { var objRef = document.getElementById('__BANNER_' + location); objRef.innerHTML = tag; }
function setListeners() {
    inputList = document.getElementsByTagName("INPUT"); for (i = 0; i < inputList.length; i++) {
        if (inputList[i].attachEvent) inputList[i].attachEvent("onpropertychange", restoreStyles); else if (inputList[i].addEventListener) inputList[i].addEventListener("propertychange", restoreStyles, false); else
            inputList[i].onpropertychange = restoreStyles; inputList[i].style.backgroundColor = "";
    } selectList = document.getElementsByTagName("SELECT"); for (i = 0; i < selectList.length; i++) {
        if (selectList[i].attachEvent) selectList[i].attachEvent("onpropertychange", restoreStyles); else if (selectList[i].addEventListener) selectList[i].addEventListener("propertychange", restoreStyles, false); else
            selectList[i].onpropertychange = restoreStyles; selectList[i].style.backgroundColor = "";
    }
}
function restoreStyles() { if (event.srcElement.style.backgroundColor != "") event.srcElement.style.backgroundColor = ""; }
function SetFlashJS(location, d, s, tag, width, height) { CreateFlashControl('__BANNER_' + location, width, height, tag, 'Transparent', ''); }
function showPicture(src) { window.open('ImageView.aspx?img=' + src, 'picture', 'scrollbar:no statusbar:no'); }
function createBookmarkLink() { if (window.sidebar) window.sidebar.addPanel(document.title, location.href, ''); else if (window.external) window.external.AddFavorite(location.href, document.title); else if (window.opera && window.print) return true; }
$.fn.watch = function(props, func, interval, id) {
    /// <summary>
    /// Allows you to monitor changes in a specific
    /// CSS property of an element by polling the value.
    /// when the value changes a function is called.
    /// The function called is called in the context
    /// of the selected element (ie. this)
    /// </summary>    
    /// <param name="prop" type="String">CSS Property to watch. If not specified (null) code is called on interval</param>    
    /// <param name="func" type="Function">
    /// Function called when the value has changed.
    /// </param>    
    /// <param name="func" type="Function">
    /// optional id that identifies this watch instance. Use if
    /// if you have multiple properties you're watching.
    /// </param>
    /// <param name="id" type="String">A unique ID that identifies this watch instance on this element</param>  
    /// <returns type="jQuery" /> 
    if (!interval)
        interval = 200;
    if (!id)
        id = "_watcher";

    return this.each(function() {
        var _t = this;
        var el = $(this);
        var fnc = function() { __watcher.call(_t, id) };
        var itId = null;

        if (typeof (this.onpropertychange) == "object")
            el.bind("propertychange." + id, fnc);
        else if ($.browser.mozilla)
            el.bind("DOMAttrModified." + id, fnc);
        else
            itId = setInterval(fnc, interval);

        var data = { id: itId,
            props: props.split(","),
            func: func,
            vals: []
        };
        $.each(data.props, function(i) { data.vals[i] = el.css(data.props[i]); });
        el.data(id, data);
    });

    function __watcher(id) {
        var el = $(this);
        var w = el.data(id);

        var changed = false;
        var i = 0;
        for (i; i < w.props.length; i++) {
            var newVal = el.css(w.props[i]);
            if (w.vals[i] != newVal) {
                w.vals[i] = newVal;
                changed = true;
                break;
            }
        }
        if (changed && w.func) {
            var _t = this;
            w.func.call(_t, w, i)
        }
    }
}
$.fn.unwatch = function(id) {
    this.each(function() {
        var w = $(this).data(id);
        var el = $(this);
        el.removeData();

        if (typeof (this.onpropertychange) == "object")
            el.unbind("propertychange." + id, fnc);
        else if ($.browser.mozilla)
            el.unbind("DOMAttrModified." + id, fnc);
        else
            clearInterval(w.id);
    });
    return this;
}

function QueryString(name) { var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search); return match && decodeURIComponent(match[1].replace(/\+/g, ' ')); }

function showPrintPopup(url) {
    mywindow = window.open(url, "mywindow", "location=1,status=0,scrollbars=0,  width=650,height=400");
    mywindow.moveTo(0, 0);
}

}
/*
     FILE ARCHIVED ON 12:18:25 Jun 14, 2017 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 12:39:58 Dec 03, 2020.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  RedisCDXSource: 4.739
  esindex: 0.016
  CDXLines.iter: 25.767 (3)
  exclusion.robots: 0.253
  PetaboxLoader3.datanode: 383.689 (5)
  LoadShardBlock: 133.734 (3)
  exclusion.robots.policy: 0.236
  captures_list: 168.832
  PetaboxLoader3.resolve: 86.849 (2)
  load_resource: 392.999 (2)
*/