package com.eltag;

import java.util.Date;
import java.text.SimpleDateFormat;

public class DateUtil {
	
	private static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
	public static String format(Date date) {
		return formatter.format(date);
	}
}
