package it.com.zhehang.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Tripin;
import it.com.zhehang.bean.Tripout;

public interface TripoutDao {

	/**
	 * 添加行程
	 * @param coon
	 * @return
	 */
	int addTripout(Connection coon,Tripout tripout);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet List(Connection coon,Tripout tripout);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet MyList(Connection coon,Tripout tripout);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet ListNo(Connection coon,Tripout tripout);
	/**
	 * 根据编号删除某个班级
	 * @param coon
	 * @param delId
	 * @return
	 */
	int deleteTripout(Connection coon,Tripout tripout);
}
