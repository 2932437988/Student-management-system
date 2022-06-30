package it.com.zhehang.bean;

import java.util.Date;

public class Tripout {
	private String userid;
	private Date subtime;
	private int category=1;
	private Date starttime;
	private Date endtime;
	private String destination;
	private String outreason;
	private String letterofcommitment;
	private String tutorapprovalvoucher;
	private int approve;
	
	
	public Tripout() {
		super();
	}
	public Tripout(String userid,Date subtime,Date starttime,Date endtime,String destination,String outreason,String letterofcommitment,String tutorapprovalvoucher) {
		super();
		this.userid=userid;
		this.subtime=subtime;
		this.starttime=starttime;
		this.endtime=endtime;
		this.destination=destination;
		this.outreason=outreason;
		this.letterofcommitment=letterofcommitment;
		this.tutorapprovalvoucher=tutorapprovalvoucher;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public Date getStarttime() {
		return starttime;
	}
	public void setStrattime(Date starttime) {
		this.starttime=starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime=endtime;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination=destination;
	}
	public String getOutreason() {
		return outreason;
	}
	public void setOutreason(String outreason) {
		this.outreason=outreason;
	}
	public String getLetterofcommitment() {
		return letterofcommitment;
	}
	public void setLetterofcommitment(String letterofcommitment) {
		this.letterofcommitment=letterofcommitment;
	}
	public String getTutorapprovalvoucher() {
		return tutorapprovalvoucher;
	}
	public void setTutorapprovalvoucher(String tutorapprovalvoucher) {
		this.tutorapprovalvoucher=tutorapprovalvoucher;
	}
	public int getApprove() {
		return approve;
	}
	public void setApprove(int approve) {
		this.approve=approve;
	}
}
