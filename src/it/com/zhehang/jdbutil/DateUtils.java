package it.com.zhehang.jdbutil;


import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	/**
	 * 日期类型按格式转化为字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String formatDate(Date date,String format)
	{
		String result = "";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		if(date != null)
		{
			result = sdf.format(date);
		}
		return result;
	}
	
	/**
	 * 字符串类型转化为日期类型
	 * @param string
	 * @param format
	 * @return
	 * @throws Exception
	 */
	public static Date formatString(String string,String format) throws Exception
	{
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.parse(string);
		
	}
}
