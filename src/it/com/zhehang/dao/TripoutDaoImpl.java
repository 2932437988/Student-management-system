package it.com.zhehang.dao;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Tripout;
import it.com.zhehang.jdbutil.StringUtils;

import java.sql.Connection;
import java.sql.ResultSet;

public class TripoutDaoImpl extends BaseDao implements TripoutDao {

	@Override
	public int addTripout(Connection coon,Tripout tripout) {
		String sql="insert into leaveschool(userid,subtime,category,starttime,endtime,destination,outreason,letterofcommitment,tutorapprovalvoucher) value(?,?,?,?,?,?,?,?,?)";
		System.out.println(sql);
		return update(coon,sql,tripout.getUserid(),tripout.getSubtime(),tripout.getCategory(),tripout.getStarttime(),tripout.getEndtime(),tripout.getDestination(),tripout.getOutreason(),tripout.getLetterofcommitment(),tripout.getTutorapprovalvoucher());
	}
	@Override
	public ResultSet List(Connection coon,Tripout tripout) {
		StringBuffer sql=new StringBuffer("select *,(case when leaveschool.approve='-2' then '取消' when leaveschool.approve='-1' then '未审批' when leaveschool.approve='0' then '不通过' when leaveschool.approve='1' then '通过' else '异常' end) as a from leaveschool,userinfo where leaveschool.userid=userinfo.userid order by leaveschool.subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public ResultSet MyList(Connection coon,Tripout tripout) {
		StringBuffer sql=new StringBuffer("select *,(case when leaveschool.approve='-2' then '取消' when leaveschool.approve='-1' then '未审批' when leaveschool.approve='0' then '不通过' when leaveschool.approve='1' then '通过' else '异常' end) as a from leaveschool where leaveschool.userid='"+tripout.getUserid()+"' order by leaveschool.subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public ResultSet ListNo(Connection coon,Tripout tripout) {
		StringBuffer sql=new StringBuffer("select *,(case when leaveschool.approve='-2' then '取消' when leaveschool.approve='-1' then '未审批' when leaveschool.approve='0' then '不通过' when leaveschool.approve='1' then '通过' else '异常' end) as a from leaveschool,userinfo where leaveschool.userid=userinfo.userid and leaveschool.approve='-1' order by leaveschool.subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public int deleteTripout(Connection coon, Tripout tripout) {
		String sql = "delete from leaveschool where userid=? && subtime=? && category=?";
		return update(coon,sql,tripout.getUserid(),tripout.getSubtime(),tripout.getCategory());
	}
	
}
