<%@ page language="java" contentType="text/html; charset=gb2312" %>
<%@ page language="java" import="java.util.*" %>
<%
    String[] weekdays={"","日","一","二","三","四","五","六"};
    String[] days=new String[42];
    for(int i=0;i<42;i++)
    	days[i]="";

    GregorianCalendar currentDay = new GregorianCalendar();
    int year= currentDay.get(Calendar.YEAR);
    int month=currentDay.get(Calendar.MONTH);
    int today=currentDay.get(Calendar.DAY_OF_MONTH);
    int weekday=currentDay.get(Calendar.DAY_OF_WEEK);
    
    String now=year+"年"+(month+1)+"月"+today+"日"+" 星期"+weekdays[weekday];
    
    Calendar thisMonth=Calendar.getInstance();
    thisMonth.set(Calendar.MONTH, month );
    thisMonth.set(Calendar.YEAR, year );
    thisMonth.setFirstDayOfWeek(Calendar.SUNDAY);
    thisMonth.set(Calendar.DAY_OF_MONTH,1);
    
    int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1;
    int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);
    for(int i=0;i<maxIndex;i++){
        days[firstIndex+i]=String.valueOf(i+1);
    }
%>

<html>
    <head>
      <title>简易万年历</title>
      <link type="text/css" rel="stylesheet" href="<s2:url value='css/style.css'/>">
      <script type="text/javascript">
        function showTime(showWhere){
            var now=new Date();
	        var hour=now.getHours();
	        var minu=now.getMinutes();
	        var sec=now.getSeconds();
         
            if(hour<10) hour="0"+hour;
         	if(minu<10) minu="0"+minu;
         	if(sec<10) sec="0"+sec;
         	
         	showWhere.value=hour+":"+minu+":"+sec;
            setTimeout("showTime(time)",1000)
        }
      </script>
    </head>
    <body onload="showTime(time)">
        <table width="210" border="0" align="center" cellspacing="1" >            
            <tr height="25"><td colspan="7" align="center" style="border:0 solid"><%=now%> <input type="text" style="border:0;background-color:#F9F9F9" disable="true" id="time" size="9"></td></tr>
            <tr height="25" bgcolor="#F0F0F0" align="center">
                <td style="border:1 solid">日</td>
                <td style="border:1 solid">一</td>
                <td style="border:1 solid">二</td>
                <td style="border:1 solid">三</td>
                <td style="border:1 solid">四</td>
                <td style="border:1 solid">五</td>
                <td style="border:1 solid">六</td>
            </tr>
            <tr height="4"><td colspan="7"></td></tr>
            <% for(int j=0;j<6;j++) { %>
            <tr>
                <% 
                  for(int i=j*7;i<(j+1)*7;i++) { 
                      if((i-firstIndex+1)==today){%>    
                      <td width="30" height="23" align="center" bgcolor="gray" style="border:1 solid"><font color="#FFFFFF"><b><%=days[i]%></b></font></td>
                <%    }else{ %>
                      <td width="30" height="23" align="center" style="border:1 solid"><%=days[i]%></td>
                <%    }
                  }%>
            </tr>
            <% } %>
            <tr height="10"><td colspan="7"></td></tr>
        </table>
    </body>
</html>
