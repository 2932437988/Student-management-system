package it.com.zhehang.jdbutil;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonUtils {
	/**
	 * 对查询返回的结果集进行处理转化为JSON格式
	 * @param rs
	 * @return
	 * @throws Exception
	 */
	public static JSONArray formatRsToJsonArray(ResultSet rs)throws Exception{
		//获取元数据
		ResultSetMetaData rsm = rs.getMetaData();
		//列 数据总数
		int num =rsm.getColumnCount();
		
		JSONArray array = new JSONArray();
		
		while(rs.next())
		{
			JSONObject mapOfColValues = new JSONObject();
			
			for(int i=1;i <=num;i++)
			{
				Object object = rs.getObject(i);
				if(object instanceof Date)
				{
					mapOfColValues.put(rsm.getColumnName(i),DateUtils.formatDate((Date)object, "yyyy-MM-dd HH:mm:ss"));
					
				}else
				{
					mapOfColValues.put(rsm.getColumnName(i), rs.getObject(i));
				}
			}
			array.add(mapOfColValues);
		}
		return array;

	}
}
