<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<body bgcolor="#ffffff" topmargin="0" leftmargin="0" onload="pagestart();">
<SCRIPT language=JavaScript>
<!--
//游标star
var brOK=false;
var mie=false;
var aver=parseInt(navigator.appVersion.substring(0,1));
var aname=navigator.appName;
function checkbrOK()
{if(aname.indexOf("Internet Explorer")!=-1)
   {if(aver>=4) brOK=navigator.javaEnabled();
    mie=true;
   }
 if(aname.indexOf("Netscape")!=-1)
   {if(aver>=4) brOK=navigator.javaEnabled();}
}
var vmin=2;
var vmax=5;
var vr=0.02;
var timer1;
function Chip(chipname,width,height)
{this.named=chipname;
 this.vx=vmin+vmax*Math.random();
 this.vy=vmin+vmax*Math.random();
 this.w=width;
 this.h=height;
 this.xx=800;
 this.yy=600;
 this.timer1=null;
}
function movechip(chipname)
{
 if(brOK)
  {eval("chip="+chipname);
   if(!mie)
    {pageX=window.pageXOffset;
     pageW=window.innerWidth;
     pageY=window.pageYOffset;
     pageH=window.innerHeight;
    }
   else
    {pageX=window.document.body.scrollLeft;
     pageW=window.document.body.offsetWidth-22;
     pageY=window.document.body.scrollTop;
     pageH=window.document.body.offsetHeight-34;
    }

   chip.xx=chip.xx+chip.vx;
   chip.yy=chip.yy+chip.vy;

   chip.vx+=vr*(Math.random()-0.5);
   chip.vy+=vr*(Math.random()-0.5);
   if(chip.vx>(vmax+vmin))  chip.vx=(vmax+vmin)*2-chip.vx;
   if(chip.vx<(-vmax-vmin)) chip.vx=(-vmax-vmin)*2-chip.vx;
   if(chip.vy>(vmax+vmin))  chip.vy=(vmax+vmin)*2-chip.vy;
   if(chip.vy<(-vmax-vmin)) chip.vy=(-vmax-vmin)*2-chip.vy;


   if(chip.xx<=pageX)
     {chip.xx=pageX;
      chip.vx=vmin+vmax*Math.random();
     }
   if(chip.xx>=pageX+pageW-chip.w)
     {chip.xx=pageX+pageW-chip.w;
      chip.vx=-vmin-vmax*Math.random();
     }
   if(chip.yy<=pageY)
     {chip.yy=pageY;
      chip.vy=vmin+vmax*Math.random();
     }
   if(chip.yy>=pageY+pageH-chip.h)
     {chip.yy=pageY+pageH-chip.h;
      chip.vy=-vmin-vmax*Math.random();
     }

   if(!mie)
      {eval('document.'+chip.named+'.top ='+chip.yy);
       eval('document.'+chip.named+'.left='+chip.xx);
      }
   else
      {eval('document.all.'+chip.named+'.style.pixelLeft='+chip.xx);
       eval('document.all.'+chip.named+'.style.pixelTop ='+chip.yy);
      }
   chip.timer1=setTimeout("movechip('"+chip.named+"')",140);
  }
}

function hide(chipname){
        if(brOK){
                eval("chip="+chipname);
                if(!mie)
                        eval('document.'+chip.named+'.visibility ='+"'hide'");
                else
                        eval('document.all.'+chip.named+'.style.visibility ='+"'hidden'");
        }
}

function stopme(chipname)
{if(brOK)
  {//alert(chipname)
   eval("chip="+chipname);
   if(chip.timer1!=null)
    {clearTimeout(chip.timer1)}
  }
}
var chip1;
function pagestart()
{checkbrOK();
 chip1=new Chip("chip1",117,75);
  if(brOK)
   { movechip("chip1");
    }
}
</SCRIPT>
<DIV id=chip1 
style="HEIGHT: 89px; LEFT: 586px; POSITION: absolute; TOP: 39px; WIDTH: 126px; Z-INDEX: 7; visibility: visible"><a href="index.jsp"><img src="Image/shop.gif" width="120" height="87" border="0" alt="明日科技" class="dz"></a> 
</DIV>
<table width="740" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="744" height="80" border="0" cellpadding="0" cellspacing="0" background="Image/Logo.jpg" bgcolor="#f9f9f9">
      <tr>
        <td width="344" height="55" rowspan="2" align="center" valign="middle">&nbsp;</td>
        <td width="400" height="30" align="right" valign="middle"><table width="200" height="20" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="80"><div align="center"><a href="index.jsp" style="color:#000000;">本站首页</a> |</div></td>
            <td width="80"><div align="center"><a href="About.jsp" style="color:#000000;">关于集团</a> |</div></td>
            <td width="80"><div align="center"><a href="mailto:mingrisoft@mingrisoft.com" style="color:#000000;">联系我们</a> </div></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="33" align="right" valign="middle"><table width="400" height="20" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><a href="Usher.jsp" style="color:#000000;">展示中心</a> | </div></td>
            <td><div align="center"><a href="SpeakFor.jsp" style="color:#000000;">订购中心</a> | </div></td>
            <td><div align="center"><a href="Tenancy.jsp" style="color:#000000;">租赁中心</a> | </div></td>
            <td><div align="center"><a href="Permute.jsp" style="color:#000000;">置换中心</a> | </div></td>
            <td><div align="center"><a href="Customers.jsp" style="color:#000000;">客服中心</a> | </div></td>
            <td><div align="center"><a href="News.jsp" style="color:#000000;">新闻中心</a> </div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="740" height="200" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f9f9f9">
  <tr>
    <td valign="bottom" background="Image/Fla.jpg"><div align="center">
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="740" height="200">
        <param name="movie" value="Image/7.swf">
        <param name="quality" value="high">
		 <param name='wmode' value='transparent'>
        <embed src="Image/7.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="740" height="200"></embed>
      </object>
</div></td>
  </tr>
</table>
