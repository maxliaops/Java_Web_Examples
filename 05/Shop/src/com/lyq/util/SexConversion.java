package com.lyq.util;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.lyq.model.Sex;
/**
 * 性别类型转换器
 * @author Li Yongqiang
 */
public class SexConversion extends StrutsTypeConverter {

	@SuppressWarnings("unchecked")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		Sex sexs[] = Sex.values();
		for (Sex sex : sexs) {
			if(sex.getName().equals(arg1[0])){
				return sex;
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		Sex sex = (Sex) arg1;
		return sex.getName();
	}
}
