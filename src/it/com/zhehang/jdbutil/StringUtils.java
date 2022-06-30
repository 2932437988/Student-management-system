package it.com.zhehang.jdbutil;

public class StringUtils {
	/**
	 * 字符串判断空或不为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		if("".equals(str)||str==null){
			return true;
		}else{
			return false;
		}
	}
	public static boolean isNotEmpty(String str){
		if(!"".equals(str)&&str!=null){
			return true;
		}else{
			return false;
		}
	}
}
