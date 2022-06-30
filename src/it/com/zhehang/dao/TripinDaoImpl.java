package it.com.zhehang.dao;

import it.com.zhehang.bean.Page;
import it.com.zhehang.bean.Tripin;
import it.com.zhehang.jdbutil.StringUtils;

import java.sql.Connection;
import java.sql.ResultSet;

public class TripinDaoImpl extends BaseDao implements TripinDao {
	@Override
	public int addTripin(Connection coon,Tripin tripin) {
		String sql="insert into admission(userid,subtime,category,admissiontime,admissionreason,residentialaddress,tutorapprovalvoucher,travelcard,healthcodegreencode,nucleicacidproof) value(?,?,?,?,?,?,?,?,?,?)";
		return update(coon,sql,tripin.getUserid(),tripin.getSubtime(),tripin.getCategory(),tripin.getAdmissiontime(),tripin.getAdmissionreason(),tripin.getResidentialaddress(),tripin.getTutorapprovalvoucher(),tripin.getTravelcard(),tripin.getHealthcodegreencode(),tripin.getNucleicacidproof());
	}
	@Override
	public ResultSet List(Connection coon,Tripin tripin) {
		StringBuffer sql=new StringBuffer("select *,(case when admission.approve='-2' then '取消' when admission.approve='-1' then '未审批' when admission.approve='0' then '不通过' when admission.approve='1' then '通过' else '异常' end) as a from admission,userinfo where admission.userid=userinfo.userid order by admission.subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public ResultSet MyList(Connection coon,Tripin tripin) {
		StringBuffer sql=new StringBuffer("select *,(case when admission.approve='-2' then '取消' when admission.approve='-1' then '未审批' when admission.approve='0' then '不通过' when admission.approve='1' then '通过' else '异常' end) as a from admission where userid='"+tripin.getUserid()+"' order by subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public ResultSet ListNo(Connection coon,Tripin tripin) {
		StringBuffer sql=new StringBuffer("select *,(case when admission.approve='-2' then '取消' when admission.approve='-1' then '未审批' when admission.approve='0' then '不通过' when admission.approve='1' then '通过' else '异常' end) as a from admission,userinfo where admission.userid=userinfo.userid and admission.approve='-1' order by admission.subtime desc");
		System.out.println(sql.toString());
		return getList(coon,sql.toString());
	}
	@Override
	public int deleteTripin(Connection coon, Tripin tripin) {
		String sql = "delete from admission where userid=? && subtime=? && category=?";
		return update(coon,sql,tripin.getUserid(),tripin.getSubtime(),tripin.getCategory());
	}
}
