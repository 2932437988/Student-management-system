package it.com.zhehang.dao;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Tripback;
import it.com.zhehang.jdbutil.StringUtils;

import java.sql.Connection;
import java.sql.ResultSet;

public class TripbackDaoImpl extends BaseDao implements TripbackDao {
	@Override
	public int addTripback(Connection coon,Tripback tripback) {
		String sql="insert into backtoschool(userid,subtime,category,backtime,residentialaddress,tutorapprovalvoucher,travelcard,healthcodegreencode,nucleicacidproof) value(?,?,?,?,?,?,?,?,?)";
		return update(coon,sql,tripback.getUserid(),tripback.getSubtime(),tripback.getCategory(),tripback.getBacktime(),tripback.getResidentialaddress(),tripback.getTutorapprovalvoucher(),tripback.getTravelcard(),tripback.getHealthcodegreencode(),tripback.getNucleicacidproof());
	}
	@Override
	public ResultSet List(Connection coon,Tripback tripback) {
		StringBuffer sql=new StringBuffer("select *,(case when backtoschool.approve='-2' then '取消' when backtoschool.approve='-1' then '未审批' when backtoschool.approve='0' then '不通过' when backtoschool.approve='1' then '通过' else '异常' end) as a from backtoschool,userinfo where backtoschool.userid=userinfo.userid order by backtoschool.subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public ResultSet MyList(Connection coon,Tripback tripback) {
		StringBuffer sql=new StringBuffer("select *,(case when backtoschool.approve='-2' then '取消' when backtoschool.approve='-1' then '未审批' when backtoschool.approve='0' then '不通过' when backtoschool.approve='1' then '通过' else '异常' end) as a from backtoschool where backtoschool.userid='"+tripback.getUserid()+"' order by backtoschool.subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public ResultSet ListNo(Connection coon,Tripback tripback) {
		StringBuffer sql=new StringBuffer("select *,(case when backtoschool.approve='-2' then '取消' when backtoschool.approve='-1' then '未审批' when backtoschool.approve='0' then '不通过' when backtoschool.approve='1' then '通过' else '异常' end) as a from backtoschool,userinfo where backtoschool.userid=userinfo.userid and backtoschool.approve='-1' order by backtoschool.subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public int deleteTripback(Connection coon, Tripback tripback) {
		String sql = "delete from backtoschool where userid=? && subtime=? && category=?";
		return update(coon,sql,tripback.getUserid(),tripback.getSubtime(),tripback.getCategory());
	}
}
