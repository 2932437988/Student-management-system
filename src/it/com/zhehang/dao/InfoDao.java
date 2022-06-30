package it.com.zhehang.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import it.com.zhehang.bean.Info;

public interface InfoDao{
	/**
	 * 添加信息
	 * @param coon
	 * @param info
	 * @return
	 */
	int addInfo(Connection coon,Info info);
	
	/**
	 * 修改信息
	 * @param coon
	 * @param info
	 * @return
	 */
	int modifyInfo(Connection coon,Info info);
	
	/**
	 * 查找信息
	 * @param coon
	 * @param info
	 * @return
	 */
	ResultSet findInfo(Connection coon,Info info);
}
