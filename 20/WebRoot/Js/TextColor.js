// JavaScript Document
var rate = 20;
var obj;
var act = 0;
var elmH = 0;
var elmS = 128;
var elmV = 255;
var clrOrg;
var TimerID;
if (navigator.appName.indexOf("Microsoft",0) != -1 && parseInt(navigator.appVersion) >= 4) {
Browser = true;
} else {
Browser = false;
}
if (Browser) {
document.onmouseover = doRainbowAnchor;
document.onmouseout = stopRainbowAnchor;
}
function doRainbow()
{
if (Browser && act != 1) {
act = 1;
obj = event.srcElement;
clrOrg = obj.style.color;
TimerID = setInterval("ChangeColor()",100);
}
}
function stopRainbow()
{
if (Browser && act != 0) {
obj.style.color = clrOrg;
clearInterval(TimerID);
act = 0;
}
}
function doRainbowAnchor()
{
if (Browser && act != 1) {
obj = event.srcElement;
while (obj.tagName != 'A' && obj.tagName != 'BODY') {
obj = obj.parentElement;
if (obj.tagName == 'A' || obj.tagName == 'BODY')
break;
}
if (obj.tagName == 'A' && obj.href != '') {
act = 1;
clrOrg = obj.style.color;
TimerID = setInterval("ChangeColor()",100);
}
}
}
function stopRainbowAnchor()
{
if (Browser && act != 0) {
if (obj.tagName == 'A') {
obj.style.color = clrOrg;
clearInterval(TimerID);
act = 0;
}
}
}
function ChangeColor()
{
obj.style.color = makeColor();
}
function makeColor()
{
if (elmS == 0) {
elmR = elmV; elmG = elmV; elmB = elmV;
}
else {
t1 = elmV;
t2 = (255 - elmS) * elmV / 255;
t3 = elmH % 60;
t3 = (t1 - t2) * t3 / 60;
if (elmH < 60) {
elmR = t1; elmB = t2; elmG = t2 + t3;
}
else if (elmH < 120) {
elmG = t1; elmB = t2; elmR = t1 - t3;
}
else if (elmH < 180) {
elmG = t1; elmR = t2; elmB = t2 + t3;
}
else if (elmH < 240) {
elmB = t1; elmR = t2; elmG = t1 - t3;
}
else if (elmH < 300) {
elmB = t1; elmG = t2; elmR = t2 + t3;
}
else if (elmH < 360) {
elmR = t1; elmG = t2; elmB = t1 - t3;
}
else {
elmR = 0; elmG = 0; elmB = 0;
}
}
elmR = Math.floor(elmR);
elmG = Math.floor(elmG);
elmB = Math.floor(elmB);
clrRGB = '#' + elmR.toString(16) + elmG.toString(16) + elmB.toString(16);
elmH = elmH + rate;
if (elmH >= 360)
elmH = 0;
return clrRGB;
}