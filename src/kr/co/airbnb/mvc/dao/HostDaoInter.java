package kr.co.airbnb.mvc.dao;

import java.util.List;
import java.util.Map;

import org.apache.catalina.Host;

import kr.co.airbnb.mvc.dto.HostSubVO;
import kr.co.airbnb.mvc.dto.HostVO;
import kr.co.airbnb.mvc.dto.PageVO;
import kr.co.airbnb.mvc.dto.ResTotalVO;
import kr.co.airbnb.mvc.dto.ResVO;
import kr.co.airbnb.mvc.dto.UserVO;

public interface HostDaoInter {

	public void addHost(HostVO vo);
	public void addSubUp(List<HostSubVO> list);
	public List<HostVO> getList(ResVO rvo);
	public List<Map<String, String>> getDetail(int hno);
	public List<String> getResRno(int hno);
	public List<String> getResDate(ResVO rvo);
	public int getHostPwChk(UserVO uvo);
	public void updateHostToUser(int no);
	public void delHost(int hno);
	public void hostReUp(HostVO vo);
    public void hostSubDel(int subno);
    public void hostSubUp(List<HostSubVO> list);
    public List<HostVO> getTypeList(String htype);
    public List<ResTotalVO> getTetsList(PageVO vo);
    public int getTotalCount(String location);
    public void detailHitUp(int hno);
}
