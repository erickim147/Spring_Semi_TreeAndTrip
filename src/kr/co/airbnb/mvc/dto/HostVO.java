package kr.co.airbnb.mvc.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HostVO {

	private int hno;
	private String hname;
	private String haddress; 
	private String haddressdo; 
	
	public String getHaddressdo() {
		return haddressdo;
	}
	public void setHaddressdo(String haddressdo) {
		this.haddressdo = haddressdo;
	}
	private String hpernum;
	private String hrnum;
	private String htnum;
	private String htype;
	private String hprice;

	public String getHprice() {
		return hprice;
	}
	public void setHprice(String hprice) {
		this.hprice = hprice;
	}
	private String hinfo;
	private int wishcnt;
	private String img1;

	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	private List<MultipartFile> mfile2;
	
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHaddress() {
		return haddress;
	}
	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}
	public String getHpernum() {
		return hpernum;
	}
	public void setHpernum(String hpernum) {
		this.hpernum = hpernum;
	}
	public String getHrnum() {
		return hrnum;
	}
	public void setHrnum(String hrnum) {
		this.hrnum = hrnum;
	}
	public String getHtnum() {
		return htnum;
	}
	public void setHtnum(String htnum) {
		this.htnum = htnum;
	}
	public String getHtype() {
		return htype;
	}
	public void setHtype(String htype) {
		this.htype = htype;
	}

	public String getHinfo() {
		return hinfo;
	}
	public void setHinfo(String hinfo) {
		this.hinfo = hinfo;
	}
	public int getWishcnt() {
		return wishcnt;
	}
	public void setWishcnt(int wishcnt) {
		this.wishcnt = wishcnt;
	}
	public List<MultipartFile> getMfile2() {
		return mfile2;
	}
	public void setMfile2(List<MultipartFile> mfile2) {
		this.mfile2 = mfile2;
	}
	
}
