package it.com.zhehang.bean;

public class Info {
	private String userid;
	private String username;
	private String userphone;
	private String usergender;
	private String userroom;
	private String userstatus;
	public Info() {
		super();
	}
	
	public Info(String userid) {
		super();
		this.userid=userid;
	}
	
	public Info(String userid,String username,String userphone,String usergender,String userroom,String userstatus) {
		super();
		this.userid=userid;
		this.username=username;
		this.usergender=usergender;
		this.userphone=userphone;
		this.userroom=userroom;
		this.userstatus=userstatus;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid=userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username=username;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone=userphone;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender=usergender;
	}
	public String getUserroom() {
		return userroom;
	}
	public void setUserroom(String userroom) {
		this.userroom=userroom;
	}
	public String getUserstatus() {
		return userstatus;
	}
	public void setUserstatus(String userstatus) {
		this.userstatus=userstatus;
	}
	@Override
	public String toString() {
		return "Info [userid="+userid+",username="+username+",usergender="+usergender+",userphone="+userphone+",userroom="+userroom+",userstatus="+userstatus+"]";
	}
}
