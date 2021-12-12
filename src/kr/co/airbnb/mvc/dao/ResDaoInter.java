package kr.co.airbnb.mvc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.airbnb.mvc.dto.AopVO;
import kr.co.airbnb.mvc.dto.PageVO;
import kr.co.airbnb.mvc.dto.ResTotalVO;
import kr.co.airbnb.mvc.dto.ResVO;

public interface ResDaoInter {

	public void addRes(ResVO vo);
	public List<ResVO> getDays(ResVO vo);
	public List<ResTotalVO> hbTotal(int hno);
	public List<ResTotalVO> haTotal(int hno);
	public ResTotalVO receipe(int resno);
	public List<ResTotalVO> getaList(PageVO vo);
	public List<ResTotalVO> getbList(PageVO vo);
	public int getATotalCount(int uno);
	public int getBTotalCount(int uno);
	
	public void addReserAop();
	public List<AopVO> selectAopVo(AopVO aopvo);
	public List<ResTotalVO> selectReserData(AopVO aopvo);

}
