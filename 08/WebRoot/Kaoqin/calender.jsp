<%@ page language="java" pageEncoding="gb2312"%>
<script language=javascript>
<!--
    var monthNames = new Array ( "", "1","2","3","4","5","6","7", "8", "9", "10", "11", "12" );
    var endDay = new Array ( 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );
    var dayNow = 0;
    var monthNow = 0;
    var yearNow = 0;

    function load ( form ) {
    	  set_month_year_now ();
        var found = false;

        for ( var month=0; month<form.monthList.length; month++ )
            if ( form.monthList[month].text == monthNames[monthNow] ) {
                form.monthList[month].selected = true;
                found = true;
            }

        if ( !found) {
            error ();
            return;
        }

        var found = false;
        for ( var year=0; year<form.yearList.length; year++ )
             if ( form.yearList[year].text == yearNow ) {
                form.yearList[year].selected = true;
                found = true;
             }
        if ( !found) {
            error ();
            return;
        }
        display_month ( form );
    }

    function preceding_month ( form ) {
        var month_selected = form.monthList.selectedIndex;
        var year_selected = form.yearList.selectedIndex;

        if ( !month_selected && !year_selected )  {
            error ();
            return;
        }

        if ( month_selected > 0 )
            month_selected --;
        else {
            month_selected = 11;
            year_selected --;
        }
        form.monthList[month_selected].selected = true;
        form.yearList[year_selected].selected = true;
        display_month ( form );
    }

    function following_month ( form ) {
        var month_selected = form.monthList.selectedIndex;
        var year_selected = form.yearList.selectedIndex;
        if ( month_selected >= ( form.monthList.length - 1 ) && year_selected >= ( form.yearList.length - 1 ) ) {
            error ();
            return;
        }

        if ( month_selected < 11 )
            month_selected ++;
        else {
            month_selected = 0;
            year_selected ++;
        }

        form.monthList[month_selected].selected = true;
        form.yearList[year_selected].selected = true;
        display_month ( form );
    }

    function set_month_year_now ()   {
        var form = document.calendar;
        var now = new Date ();
        monthNow = now.getMonth () + 1;
        yearNow = now.getYear ();
        dayNow = now.getDate();
        yearNow = ( yearNow < 100 ) ? yearNow + 1900 : yearNow;

        var count = 0

        for (var i = yearNow-103; i < yearNow + 50; i++) {
          eval("form.yearList.options[count] = new Option('"+i+"', '"+i+"')");
          count++;
        }
        form.yearList.selectedIndex = 103;
        form.yearList.length = count;
    }

    function error ()   {
        alert ( "超出范围!" );
    }

    function display_month ( form )  
	{
        var month = form.monthList.selectedIndex + 1;
        var year = parseInt ( form.yearList.options[ form.yearList.selectedIndex].text );
        var start_day = start_day_in_month ( year, month );
        var count = 0;

        for ( var row=0; row<6; row++) {
            for ( var col=0; col<7; col++ )
            {
                if ( row == 0 && col < ( start_day - 1 ) )
                    var day = "";
                else if ( count < endDay[month] )
                    day = ++count;
                else
                    day = "";

                form.dayBox[(row*7)+col].style.display = "";
                form.dayBox[(row*7)+col].style.color = "black";

                if (day == "") {
                  form.dayBox[(row*7)+col].style.display = "none";
                } else {
	                form.dayBox[(row*7)+col].value = day;
	                if (col%7 == 0) form.dayBox[(row*7)+col].style.color = "red";
	                if (yearNow == year && monthNow == month && dayNow == day) form.dayBox[(row*7)+col].style.color = "blue";;
	              }
            }
        }
    }

    function start_day_in_month ( year, month )   {
        var  day, daynum, ndays, mnum;
        sday = start_day_in_year ( year );
        endDay[2] = ( year % 4 ) ? 28 : 29;

        if ( month == 1 )
            daynum = sday;
        else {
            ndays = sday;
            for ( mnum=2; mnum<month+1; mnum++ )
                ndays = ndays + endDay[mnum-1];
            daynum = ndays % 7;
        }

        daynum = (!daynum) ? 7 : daynum;
        return (daynum);
    }

    function start_day_in_year ( year )   {
        var y, m, d;
        var n;

        y = year - 1; m = 13; d = 1;
        n = d + 2 * m + ( Math.floor ( ( 0.6 + (m + 1) ) ) + y );
        n = n + Math.floor ( ((y / 4) - Math.floor ( (y / 100 ) ) + Math.floor ( ( y / 400 ) ) )                                                                               ) + 2 ;
        n = Math.floor ( ( (n / 7 - Math.floor ( (n / 7) ) ) * 7 + 0.5 ) );
        return (n+1);
    }

  function CheckDate(strDay) {
   var docFrm = document.calendar;
   var choice_daynum = 0;
   var current_daynum = 0;
   var day_temp;

   if (strDay != "") {
     var strY = docFrm.yearList.value;
     var strM = docFrm.monthList.value;
     var curr_y = new String(yearNow);
     var curr_m = new String(monthNow);
     var curr_d = new String(dayNow);
     if (curr_m.length == 1) curr_m = "0"+curr_m;
     if (curr_d.length == 1) curr_d = "0"+curr_d;
     current_daynum = new Number(curr_y + curr_m + curr_d) ;

     if (strM.length == 1) strM = "0"+strM;
     if (strDay.length == 1) strDay = "0"+strDay;

       choice_daynum = new Number(strY + strM + strDay);
       parent.window.returnValue = strY+"-"+strM+"-"+strDay;  //将选择的日期传递到父窗口中
       parent.window.close();

   }
   return false;
  }
-->
</script>
<body onLoad="load(document.calendar)" topmargin="0">
<center>
  <form name="calendar">
    <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3" height="24"></td>
      </tr>
      <tr>
        <td width="205" nowrap="nowrap" align="right"><select name="yearList" onChange="display_month(this.form)">
          </select>
        </td>
        <td width="65" nowrap="nowrap" align="left"><select name="monthList" size="1" onChange="display_month(this.form)">
            <%for ( int i=1;i<=12;i++){%>
            <option value="<%=i%>"><%=i%></option>
            <%}%>
          </select>
        </td>
        <td width="10"></td>
      </tr>
      <tr>
        <td colspan="3" height="6"></td>
      </tr>
      <tr>
        <td colspan="3"><table border="0" cellpadding="1" cellspacing="0" align="center">
            <tr>
              <td bgcolor="#82664F"><table border="0" cellpadding="0" cellspacing="0">
                  <tr bgcolor="#82664F" height="18">
                    <td width="31" align="center" nowrap="nowrap"><font color="#FF0000">日</font></td>
                    <td width="31" align="center" nowrap="nowrap">一</td>
                    <td width="31" align="center" nowrap="nowrap">二</td>
                    <td width="31" align="center" nowrap="nowrap">三</td>
                    <td width="31" align="center" nowrap="nowrap">四</td>
                    <td width="31" align="center" nowrap="nowrap">五</td>
                    <td width="31" align="center" nowrap="nowrap">六</td>
                  </tr>
                  <%for (int j=0;j<=5;j++){%>
                  <tr bgcolor="#FFFFFF" height="18">
                    <%for(int k=0;k<=6;k++){%>
                    <td align="center"><input type="text" size="2" name="dayBox" readOnly onClick="javascript:CheckDate(this.value);" onMouseOver="this.style.background='#9966FF'"  onmouseout="this.style.background='white'">
                    </td>
                    <%}%>
                  </tr>
                  <%}%>
                </table></td>
            </tr>
          </table></td>
      </tr>
    </table>
  </form>
</center>
</body>