package com.jy.task.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateStringUtil {
	
	private static SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm", Locale.getDefault());
	
	private static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault());
	
	private static SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
	
	private static SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
	
	private static SimpleDateFormat sdf5 = new SimpleDateFormat("HH:mm:ss", Locale.getDefault());
	
	private static Calendar c = Calendar.getInstance();
	
	// 日期字符串转换成日期
	public static Date stringToDate(String dataString) {
		Date date = null;
		try {
			date = sdf1.parse(dataString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	// 日期字符串转换成日期
	public static Date stringToDate3(String dataString) {
		Date date = null;
		try {
			date = sdf3.parse(dataString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	
	
	// 只保留日期的时间(小时，分钟)
	public static String dateToString(Date date) {
		return sdf1.format(date);
	}
	
	// 保留 年-月-日 小时:分钟
	public static String dateToString2(Date date) {
		return sdf2.format(date);
	}
	
	// 保留 年-月
	public static String dateToString3(Date date) {
		return sdf3.format(date);
	}
	
	// 保留 年-月-日 小时:分钟:秒
	public static String dateToString4(Date date) {
		return sdf4.format(date);
	}
	
	// 保留 年-月-日 小时:分钟:秒
	public static String dateToString5(Date date) {
		return sdf5.format(date);
	}
	
	/**
	 * 比较date的小时分钟与otherDate的小时分钟大小
	 * date < otherdate --- -1
	 * date = otherdate --- 0
	 * date > otherdate --- 1
	 * @param date ---现在的时间
	 * @param otherDate ---设置的时间
	 * @return
	 */
	public static int compare(Date date, Date otherDate) {
		int flag;
		c.setTime(date);
		int dateHour = c.get(Calendar.HOUR_OF_DAY);
		int dateMinute = c.get(Calendar.MINUTE);
		c.setTime(otherDate);
		int otherHour = c.get(Calendar.HOUR_OF_DAY);
		int otherMinute = c.get(Calendar.MINUTE);
		
		if(dateHour < otherHour) {
			flag = -1;
		}else if(dateHour == otherHour) {
			if(dateMinute < otherMinute) {
				flag = -1;
			}else if(dateMinute == otherMinute) {
				flag = 0;
			}else {
				flag = 1;
			}
		}else {
			flag = 1;
		}
		return flag;
	}

	/**
	 * 当前时间time,加上分钟数
	 * @param date
	 * @param minute
	 * @return
	 */
	public static Date calculate(Date date, Integer minute) {
		c.setTime(date);
		int hours = c.get(Calendar.HOUR_OF_DAY);
		int minutes = c.get(Calendar.MINUTE);
		minutes = minutes + minute;
		if(minutes > 60) {
			minutes %= 60;
			int hour = minutes%60;
			hours += hour;
		}
		c.set(Calendar.HOUR_OF_DAY, hours);
		c.set(Calendar.MINUTE, minutes);
		return c.getTime();
	}
	
	/**
	 * 计算两个时间（HH：mm）间隔的分钟数
	 * @param date(较大的日期)
	 * @param otherDate(较小的日期)
	 * @return
	 */
	public static Integer calculateMinutes(Date date, Date otherDate) {
		c.setTime(date);
		int dateHour = c.get(Calendar.HOUR_OF_DAY);
		int dateMinute = c.get(Calendar.MINUTE);
		c.setTime(otherDate);
		int otherHour = c.get(Calendar.HOUR_OF_DAY);
		int otherMinute = c.get(Calendar.MINUTE);
		int hours = dateHour - otherHour;
		int minutes = dateMinute - otherMinute;
		minutes = hours*60 + minutes;
		return minutes;
	}
	
}
