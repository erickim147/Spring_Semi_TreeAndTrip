package kr.co.airbnb.mvc.dto;

public class UserVO {
	private int no;
	private String email;
	private String pwd;
	private String name;
	private String address;
	private String addressdo;
	private String pnum;
	private int hostchk;
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressdo() {
		return addressdo;
	}
	public void setAddressdo(String addressdo) {
		this.addressdo = addressdo;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public int getHostchk() {
		return hostchk;
	}
	public void setHostchk(int hostchk) {
		this.hostchk = hostchk;
	}

}
