package kr.co.airbnb.mvc.dto;

public class ResVO {

	private int res;
	private int uno;
	private int hno;
	private String chkin;
	private String chkout;
	private String pernum;
	private String resdate;
	private String rprice;
	private String location;
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRprice() {
		return rprice;
	}
	public void setRprice(String rprice) {
		this.rprice = rprice;
	}
	public int getRes() {
		return res;
	}
	public void setRes(int res) {
		this.res = res;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getChkin() {
		return chkin;
	}
	public void setChkin(String chkin) {
		this.chkin = chkin;
	}
	public String getChkout() {
		return chkout;
	}
	public void setChkout(String chkout) {
		this.chkout = chkout;
	}
	public String getPernum() {
		return pernum;
	}
	public void setPernum(String pernum) {
		this.pernum = pernum;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	
}
