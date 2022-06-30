package it.com.zhehang.dao;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Trip;
import it.com.zhehang.jdbutil.StringUtils;

import java.sql.Connection;
import java.sql.ResultSet;

public class TripDaoImpl extends BaseDao implements TripDao {
	@Override
	public ResultSet tripList0(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,admission,userinfo where examine.userid=");
		sql.append("'"+trip.getUserid()+"' and userinfo.userid=examine.userid and admission.userid=examine.userid and admission.subtime=examine.subtime and admission.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	
	@Override
	public ResultSet tripList1(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,leaveschool,userinfo where examine.userid=");
		sql.append("'"+trip.getUserid()+"' and userinfo.userid=examine.userid and leaveschool.userid=examine.userid and leaveschool.subtime=examine.subtime and leaveschool.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	
	@Override
	public ResultSet tripList2(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,backtoschool,userinfo where examine.userid=");
		sql.append("'"+trip.getUserid()+"' and userinfo.userid=examine.userid and backtoschool.userid=examine.userid and backtoschool.subtime=examine.subtime and backtoschool.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public ResultSet tripAll0(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,admission,userinfo where examine.approve=");
		sql.append("'"+trip.getApprove()+"' and userinfo.userid=examine.userid and admission.userid=examine.userid and admission.subtime=examine.subtime and admission.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	
	@Override
	public ResultSet tripAllIn(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,admission,userinfo where examine.category=");
		sql.append("'"+trip.getCategory()+"' and userinfo.userid=examine.userid and admission.userid=examine.userid and admission.subtime=examine.subtime and admission.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	
	@Override
	public ResultSet tripAll1(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,leaveschool,userinfo where examine.approve=");
		sql.append("'"+trip.getApprove()+"' and userinfo.userid=examine.userid and leaveschool.userid=examine.userid and leaveschool.subtime=examine.subtime and leaveschool.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	
	@Override
	public ResultSet tripAllOut(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,leaveschool,userinfo where examine.category=");
		sql.append("'"+trip.getCategory()+"' and userinfo.userid=examine.userid and leaveschool.userid=examine.userid and leaveschool.subtime=examine.subtime and leaveschool.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	
	@Override
	public ResultSet tripAll2(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,backtoschool,userinfo where examine.approve=");
		sql.append("'"+trip.getApprove()+"' and userinfo.userid=examine.userid and backtoschool.userid=examine.userid and backtoschool.subtime=examine.subtime and backtoschool.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	
	@Override
	public ResultSet tripAllBack(Connection coon,Page page,Trip trip) {
		StringBuffer sql=new StringBuffer("select *,(case when examine.approve='-2' then '取消' when examine.approve='-1' then '未审批' when examine.approve='0' then '不通过' when examine.approve='1' then '通过' else '异常' end) as a,(case when examine.category='0' then '入校' when examine.category='1' then '出校' when examine.category='2' then '寒暑假返校' else '异常' end) as c from examine,backtoschool,userinfo where examine.category=");
		sql.append("'"+trip.getCategory()+"' and userinfo.userid=examine.userid and backtoschool.userid=examine.userid and backtoschool.subtime=examine.subtime and backtoschool.category=examine.category order by examine.subtime");
		if(page!=null){
			sql.append(" limit "+page.getStart()+","+page.getRows());
		}
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	
	@Override
	public int tripAllCount(Connection coon,Trip trip) {
		StringBuffer sql=new StringBuffer("select count(*) as total from examine where approve=");
		sql.append("'%"+trip.getApprove()+"%'");
		return getCount(coon,sql.toString());
	}
	
	@Override
	public int tripCount(Connection coon,Trip trip) {
		StringBuffer sql=new StringBuffer("select count(*) as total from examine where userid=");
		sql.append("'%"+trip.getUserid()+"%'");
		return getCount(coon,sql.toString());
	}
	
	@Override
	public int modifyTrip(Connection coon, Trip trip) {
		String sql="update examine set approve=?,opinion=? where userid=? && subtime=? && category=?";
		return update(coon,sql,trip.getApprove(),trip.getOpinion(),trip.getUserid(),trip.getSubtime(),trip.getCategory());
	}
	@Override
	public int deleteTrip(Connection coon, Trip trip) {
		String sql = "delete from examine where userid=? && subtime=? && category=?";
		return update(coon,sql,trip.getUserid(),trip.getSubtime(),trip.getCategory());
	}
}
