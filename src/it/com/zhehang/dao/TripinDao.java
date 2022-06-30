package it.com.zhehang.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Trip;
import it.com.zhehang.bean.Tripin;

public interface TripinDao {
	
	/**
	 * 添加行程
	 * @param coon
	 * @return
	 */
	int addTripin(Connection coon,Tripin tripin);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet List(Connection coon,Tripin tripin);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet MyList(Connection coon,Tripin tripin);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet ListNo(Connection coon,Tripin tripin);
	/**
	 * 根据编号删除某个班级
	 * @param coon
	 * @param delId
	 * @return
	 */
	int deleteTripin(Connection coon,Tripin tripin);
}
