package it.com.zhehang.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Trip;
import it.com.zhehang.bean.User;

public interface UserDao {
	/**
	 * 用户登录
	 * @param coon
	 * @param user
	 * @return
	 */
	User login(Connection coon,User user);
	
	/**
	 * 修改密码
	 * @param coon
	 * @param user
	 * @return
	 */
	int modify(Connection coon,User user);
	
	/**
	 * 确认密码
	 * @param coon
	 * @param user
	 * @return
	 */
	User define(Connection coon,User user);
	
	/**
	 * 获取申请列表结果集合
	 * @param coon
	 * @param page
	 * @return
	 */
	ResultSet userList(Connection coon);
	/**
	 * 获取结果总数
	 * @param coon
	 * @return
	 */
	int userCount(Connection coon,User user);
	
	/**
	 * 根据编号删除某个班级
	 * @param coon
	 * @param delId
	 * @return
	 */
	int deleteUser(Connection coon,String userid);
	
	/**
	 * 根据信息添加班级信息
	 * @param coon
	 * @param grade
	 * @return
	 */
	int addUser(Connection coon,User user);
	
	/**
	 * 根据信息修改班级信息
	 * @param coon
	 * @param grade
	 * @return
	 */
	int modifyUser(Connection coon,User user);
	/**
	 * 根据信息修改班级信息
	 * @param coon
	 * @param grade
	 * @return
	 */
	int modifyUser1(Connection coon,User user);
}
