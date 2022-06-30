package it.com.zhehang.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Tripback;

public interface TripbackDao {

	/**
	 * 添加行程
	 * @param coon
	 * @return
	 */
	int addTripback(Connection coon,Tripback tripback);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet List(Connection coon,Tripback tripback);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet MyList(Connection coon,Tripback tripback);
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @return
	 */
	ResultSet ListNo(Connection coon,Tripback tripback);
	/**
	 * 根据编号删除某个班级
	 * @param coon
	 * @param delId
	 * @return
	 */
	int deleteTripback(Connection coon,Tripback tripback);
}
