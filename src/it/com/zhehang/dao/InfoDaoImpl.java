package it.com.zhehang.dao;

import it.com.zhehang.bean.Info;

import java.sql.Connection;
import java.sql.ResultSet;

public class InfoDaoImpl extends BaseDao implements InfoDao{
	@Override
	public int addInfo(Connection coon,Info info) {
		String sql="insert into userinfo(userid,username,usergender,userphone,userroom,userstatus) value(?,?,?,?,?,?)";
		return update(coon,sql,info.getUserid(),info.getUsername(),info.getUsergender(),info.getUserphone(),info.getUserroom(),info.getUserstatus());
	}
	@Override
	public int modifyInfo(Connection coon,Info info) {
		String sql="update userinfo set username=?,usergender=?,userphone=?,userroom=?,userstatus=? where userid=?";
		return update(coon,sql,info.getUsername(),info.getUsergender(),info.getUserphone(),info.getUserroom(),info.getUserstatus(),info.getUserid());
	}
	@Override
	public ResultSet findInfo(Connection coon,Info info) {
		StringBuffer sql=new StringBuffer("select * from userinfo where userid='"+info.getUserid()+"'");
		return getList(coon,sql.toString());
	}
}
