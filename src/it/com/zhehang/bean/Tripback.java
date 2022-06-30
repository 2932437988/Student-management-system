package it.com.zhehang.bean;

import java.util.Date;

public class Tripback{
	private String userid;
	private Date subtime;
	private int category=2;
	private Date backtime;
	private String residentialaddress;
	private String tutorapprovalvoucher;
	private String travelcard;
	private String healthcodegreencode;
	private String nucleicacidproof;
	private int approve;
	
	public Tripback() {
		super();
	}
	public Tripback(String userid,Date subtime,Date backtime,String residentialaddress,String tutorapprovalvoucher,String travelcard,String healthcodegreencode,String nucleicacidproof) {
		super();
		this.userid=userid;
		this.subtime=subtime;
		this.backtime=backtime;
		this.residentialaddress=residentialaddress;
		this.tutorapprovalvoucher=tutorapprovalvoucher;
		this.travelcard=travelcard;
		this.healthcodegreencode=healthcodegreencode;
		this.nucleicacidproof=nucleicacidproof;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid=userid;
	}
	public Date getSubtime() {
		return subtime;
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
	public Date getBacktime() {
		return backtime;
	}
	public void setBacktime(Date backtime) {
		this.backtime=backtime;
	}
	public String getResidentialaddress() {
		return residentialaddress;
	}
	public void setResidentialaddress(String residentialaddress) {
		this.residentialaddress=residentialaddress;
	}
	public String getTutorapprovalvoucher() {
		return tutorapprovalvoucher;
	}
	public void setTutorapprovalvoucher(String tutorapprovalvoucher) {
		this.tutorapprovalvoucher=tutorapprovalvoucher;
	}
	public String getTravelcard() {
		return travelcard;
	}
	public void setTravelcard(String travelcard) {
		this.travelcard=travelcard;
	}
	public String getHealthcodegreencode() {
		return healthcodegreencode;
	}
	public void setHealthcodegreencode(String healthcodegreencode) {
		this.healthcodegreencode=healthcodegreencode;
	}
	public String getNucleicacidproof() {
		return nucleicacidproof;
	}
	public void setNucleicacidproof(String nucleicacidproof) {
		this.nucleicacidproof=nucleicacidproof;
	}
	public int getApprove() {
		return approve;
	}
	public void setApprove(int approve) {
		this.approve=approve;
	}
}