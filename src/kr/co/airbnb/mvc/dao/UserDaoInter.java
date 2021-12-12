package kr.co.airbnb.mvc.dao;

import kr.co.airbnb.mvc.dto.UserVO;

public interface UserDaoInter {
	
	public void addUser(UserVO vo);
	public UserVO loginChk(UserVO vo);
	public UserVO addSession(UserVO vo);
	public int emailChk(String emali);
	public int selectHostChk(int no);
	public void updateHostChk(int no);
	
}
