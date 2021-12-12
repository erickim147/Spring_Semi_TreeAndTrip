package kr.co.airbnb.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.airbnb.mvc.dto.PageVO;
import kr.co.airbnb.mvc.dto.ResTotalVO;
import kr.co.airbnb.mvc.dto.UserVO;

@Repository
public class UserDaoImple implements UserDaoInter{
	
	@Autowired
	SqlSessionTemplate ss; 
	
	@Override
	public void addUser(UserVO vo) {
		ss.insert("user.addUser", vo);
	}

	@Override
	public UserVO loginChk(UserVO vo) {
		return ss.selectOne("user.loginChk", vo);
	}

	@Override
	public int emailChk(String emali) {
		return ss.selectOne("user.idchk", emali);
	}

	@Override
	public void updateHostChk(int no) {
		ss.update("user.updateHostChk", no);
	}

	@Override
	public int selectHostChk(int no) {
		return ss.selectOne("user.selectHostChk", no);
	}

	@Override
	public UserVO addSession(UserVO vo) {
		return ss.selectOne("user.addSession", vo);
	}	
	
	

}
