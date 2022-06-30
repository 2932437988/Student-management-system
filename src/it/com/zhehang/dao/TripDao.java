package it.com.zhehang.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Trip;

public interface TripDao {
	//定义Student方法的标准
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripList0(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripList1(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripList2(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripAll0(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripAllIn(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripAll1(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripAllOut(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripAll2(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取申请列表结果集合
		 * @param coon
		 * @param page
		 * @return
		 */
		ResultSet tripAllBack(Connection coon,Page page,Trip trip);
		
		/**
		 * 获取结果总数
		 * @param coon
		 * @return
		 */
		int tripAllCount(Connection coon,Trip trip);
		
		/**
		 * 获取结果总数
		 * @param coon
		 * @return
		 */
		int tripCount(Connection coon,Trip trip);
		/**
		 * 修改申请信息
		 * @param coon
		 * @param trip
		 * @return
		 */
		int modifyTrip(Connection coon,Trip trip);
		/**
		 * 根据编号删除某个班级
		 * @param coon
		 * @param delId
		 * @return
		 */
		int deleteTrip(Connection coon,Trip trip);
}
