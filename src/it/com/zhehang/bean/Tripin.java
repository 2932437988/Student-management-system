package it.com.zhehang.bean;

import java.util.Date;

public class Tripin{
	private String userid;
	private Date subtime;
	private int category=0;
	private Date admissiontime;
	private String admissionreason;
	private String residentialadress;
	private String tutorapprovalvoucher;
	private String travelcard;
	private String healthcodegreencode;
	private String nucleicacidproof;
	private int approve;
	
	public Tripin() {
		super();
	}
	public Tripin(String userid,Date subtime,Date admissiontime,String admissionreason,String residentialadress,String tutorapprovalvoucher,String travelcard,String healthcodegreencode,String nucleicacidproof) {
		super();
		this.userid=userid;
		this.subtime=subtime;
		this.admissiontime=admissiontime;
		this.admissionreason=admissionreason;
		this.residentialadress=residentialadress;
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
	public Date getAdmissiontime() {
		return admissiontime;
	}
	public void setAdmissiontime(Date admissiontime) {
		this.admissiontime=admissiontime;
	}
	public String getAdmissionreason() {
		return admissionreason;
	}
	public void setAdmissionreason(String admissionreason) {
		this.admissionreason=admissionreason;
	}
	public String getResidentialaddress() {
		return residentialadress;
	}
	public void setResidentialaddress(String residentialadress) {
		this.residentialadress=residentialadress;
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