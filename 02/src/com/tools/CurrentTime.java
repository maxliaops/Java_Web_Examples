package com.tools;

import java.text.DateFormat;
import java.util.Date;

public class CurrentTime {
	public String currentlyTime() {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL);
		return dateFormat.format(date);
	}

	public long autoNumber() {
		Date date = new Date();
		long autoNumber = date.getTime();
		return autoNumber;
	}
}
