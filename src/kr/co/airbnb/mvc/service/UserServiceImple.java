package kr.co.airbnb.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.airbnb.mvc.dao.HostDaoInter;
import kr.co.airbnb.mvc.dao.UserDaoInter;
import kr.co.airbnb.mvc.dto.HostVO;
@Service
@Transactional
public class UserServiceImple implements UserServiceInter{
	@Autowired
	private HostDaoInter hostDaoInter;
	@Autowired
	private UserDaoInter userDaoInter;
	
	@Override
	public int addHostUpUser(HostVO hvo) {
		hostDaoInter.addHost(hvo);
		int no = hvo.getHno();
		userDaoInter.updateHostChk(no);
		
		return userDaoInter.selectHostChk(no);
	}

	@Override
	public int delHost(int no) {
		int hno = no;
		hostDaoInter.delHost(hno);
		hostDaoInter.updateHostToUser(no);
		return userDaoInter.selectHostChk(no);
	}

}
