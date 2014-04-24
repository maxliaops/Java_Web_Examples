package com.spring.controller;

import java.beans.PropertyEditorSupport;
import java.sql.Date;

public class DateEditor extends PropertyEditorSupport {
	public String getAsText() {
		Object o = getValue();
		if (o == null || !(o instanceof Date)) {
			return null;
		}
		return o.toString();
	}

	public void setAsText(String text) throws IllegalArgumentException {
		Date date;
		if (text != null && text != "")
			date = Date.valueOf(text);
		else
			date = new Date(System.currentTimeMillis());
		setValue(date);
	}

}
