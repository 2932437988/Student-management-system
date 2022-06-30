package it.com.zhehang.bean;

import java.util.Date;

import it.com.zhehang.jdbutil.DateUtils;

public class Trip {
	private String userid;
	private Date subtime;
	private int category;
	private int approve;
	private String opinion;
	
	public Trip() {
		super();
	}
	public Trip(String userid,Date subtime,int category,int approve,String opinion) {
		super();
		this.userid=userid;
		this.subtime=subtime;
		this.category=category;
		this.approve=approve;
		this.opinion=opinion;
	}
	public Trip(String userid,Date subtime,int category,int approve) {
		super();
		this.userid=userid;
		this.subtime=subtime;
		this.category=category;
		this.approve=approve;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid=userid;
	}
	public String getSubtime() {
		return DateUtils.formatDate(subtime, "yyyy-MM-dd HH:mm:ss");
	}
	public void setSubtime(Date subtime) {
		this.subtime=subtime;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category=category;
	}
	public int getApprove() {
		return approve;
	}
	public void setApprove(int approve) {
		this.approve=approve;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion=opinion;
	}
}
