package it.com.zhehang.bean;

public class User {
	private String userid;
	private String userpasswd;
	private int userlevel;
	public User() {
		super();
	}
	
	public User(String userid, String userpasswd) {
		super();
		this.userid = userid;
		this.userpasswd = userpasswd;
	}

	public User(String userid, String userpasswd, int userlevel) {
		super();
		this.userid = userid;
		this.userpasswd = userpasswd;
		this.userlevel=userlevel;
	}
	public int getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(int userlevel) {
		this.userlevel = userlevel;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpasswd() {
		return userpasswd;
	}
	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}
	@Override
	public String toString() {
		return "User [userlevel=" + userlevel + ", userid=" + userid + ", userpasswd="
				+ userpasswd + "]";
	}
}
