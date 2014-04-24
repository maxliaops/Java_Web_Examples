package com.bwm.time;

import java.text.*;
import java.util.*;

/**
 *class explain:Time operate
 *set up name:  crazyadept
 *set up time:  11/21/2004
 */
public class Time {
    private Date time;
    private String strtime;
    private SimpleDateFormat format;

    /**
     *method explain:   initialization Time
     *modify time:      12/07/2004
     */
    public Time() {
        strtime = "";
        format = null;
    }

    /**
     *output parameter: Get String type year-month-data
     *modify time:      12/07/2004
     */
    public String getYMD() {
        time = new Date();
        format = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
        strtime = format.format(time);
        return strtime;
    }
}
