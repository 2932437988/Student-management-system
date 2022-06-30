package it.com.zhehang.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.User;

public class UserDaoImpl extends BaseDao implements UserDao{
	
	@Override
	public User login(Connection coon, User user) {
		String sql = "select * from login where userid=? and userpasswd=?";
		User resultUser = select(coon,sql,User.class,user.getUserid(),user.getUserpasswd());
		return resultUser;
	}
	@Override
	public int modify(Connection coon, User user) {
		String sql = "update login set userpasswd=? where userid=?";
		System.out.println(sql);
		return update(coon,sql,user.getUserpasswd(),user.getUserid());
	}
	@Override
	public User define(Connection coon, User user) {
		String sql = "select userpasswd from login where userid=?";
		return select(coon,sql,User.class,user.getUserid());
	}
	@Override
	public ResultSet userList(Connection coon) {
		StringBuffer sql=new StringBuffer("select *,(case when login.userlevel='0' then '普通用户' when login.userlevel='1' then '管理员' when login.userlevel='2' then '高级管理员' else '异常' end) as level from login,userinfo where login.userid=userinfo.userid");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public int userCount(Connection coon,User user) {
		StringBuffer sql=new StringBuffer("select count(*) as total from login");
		if(user.getUserid()!=null) {
			sql.append("where userid='"+user.getUserid()+"'");
		}
		return getCount(coon,sql.toString());
	}
	@Override
	public int deleteUser(Connection coon, String userid) {
		String sql = "delete from login where userid in('"+userid+"')";
		return update(coon,sql);
	}
	
	@Override
	public int addUser(Connection coon, User user) {
		String sql = "insert into login(userid,userpasswd,userlevel) value(?,?,?)";
		return update(coon,sql,user.getUserid(),user.getUserpasswd(),user.getUserlevel());
	}
	@Override
	public int modifyUser(Connection coon,User user) {
		String sql ="update login set userpasswd=?,userlevel=? where userid=?";
		return update(coon,sql,user.getUserpasswd(),user.getUserlevel(),user.getUserid());
	}
	@Override
	public int modifyUser1(Connection coon,User user) {
		String sql ="update login set userlevel=? where userid=?";
		return update(coon,sql,user.getUserlevel(),user.getUserid());
	}
}
