package kr.co.airbnb.mvc.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.airbnb.mvc.dto.HostSubVO;
import kr.co.airbnb.mvc.dto.HostVO;
import kr.co.airbnb.mvc.dto.PageVO;
import kr.co.airbnb.mvc.dto.ResTotalVO;
import kr.co.airbnb.mvc.dto.ResVO;
import kr.co.airbnb.mvc.dto.UserVO;

@Repository
public class HostDaoImple implements HostDaoInter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addHost(HostVO vo) {
		ss.insert("host.add", vo);
	}

	@Override
	public void addSubUp(List<HostSubVO> list) {
		ss.insert("host.subAdd", list);
	}

	@Override
	public List<HostVO> getList(ResVO rvo) {
		return ss.selectList("host.list",rvo);
	}

	@Override
	public List<Map<String, String>> getDetail(int hno) {
		List<Map<String, String>> listMap = ss.selectList("host.detail",hno);
		return listMap;
	}

	@Override
	public List<String> getResRno(int hno) {
		return ss.selectList("res.resRno", hno);
	}

	@Override
	public List<String> getResDate(ResVO rvo) {
		return ss.selectList("res.resDate", rvo);
	}

	@Override
	public int getHostPwChk(UserVO uvo) {
		return ss.selectOne("host.pwchk", uvo);
	}

	@Override
	public void updateHostToUser(int no) {
		ss.update("host.updateHostToUser", no);
		
	}

	@Override
	public void delHost(int hno) {
		ss.delete("host.delHost", hno);
	}
	
	@Override
	public void hostReUp(HostVO vo) {
		ss.update("host.hostreup", vo);
		
	}

	@Override
	public void hostSubDel(int subno) {
		ss.delete("host.hostde", subno);
		
	}

	@Override
	public void hostSubUp(List<HostSubVO> list) {
		ss.insert("host.hostsubAdd", list);
		
	}

	@Override
	public List<HostVO> getTypeList(String htype) {
		return ss.selectList("host.typeList",htype);
	}

	@Override
	public List<ResTotalVO> getTetsList(PageVO vo) {
		return ss.selectList("host.betalist",vo);
	}

	@Override
	public int getTotalCount(String location) {
		return ss.selectOne("host.tatalCnt",location);
	}
	
	@Override
	public void detailHitUp(int hno) {
		ss.update("host.detailHit", hno);
		
	}



	


}
