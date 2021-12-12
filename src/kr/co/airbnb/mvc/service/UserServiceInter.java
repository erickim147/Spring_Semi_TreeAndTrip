package kr.co.airbnb.mvc.service;


import kr.co.airbnb.mvc.dto.HostVO;

public interface UserServiceInter {
	public int addHostUpUser(HostVO hvo);
	public int delHost(int hno);
}
