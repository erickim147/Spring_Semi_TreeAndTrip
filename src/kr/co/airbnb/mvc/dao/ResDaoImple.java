package kr.co.airbnb.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.airbnb.mvc.dto.AopVO;
import kr.co.airbnb.mvc.dto.PageVO;
import kr.co.airbnb.mvc.dto.ResTotalVO;
import kr.co.airbnb.mvc.dto.ResVO;

@Repository
public class ResDaoImple implements ResDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addRes(ResVO vo) {
		ss.insert("res.add", vo);

	}

	@Override
	public List<ResVO> getDays(ResVO vo) {

		return ss.selectList("host.datys", vo);
	}

	@Override
	public List<ResTotalVO> hbTotal(int hno) {
		return ss.selectList("res.hblist", hno);
	}

	@Override
	public List<ResTotalVO> haTotal(int hno) {
		return ss.selectList("res.halist", hno);
	}

	@Override
	public ResTotalVO receipe(int resno) {
		return ss.selectOne("res.receipe", resno);
	}

	@Override
	public List<ResTotalVO> getaList(PageVO vo) {
		return ss.selectList("res.alist", vo);
	}

	@Override
	public List<ResTotalVO> getbList(PageVO vo) {
		return ss.selectList("res.blist", vo);
	}

	@Override
	public int getATotalCount(int uno) {
		return ss.selectOne("res.atotalCnt", uno);
	}

	@Override
	public int getBTotalCount(int uno) {
		return ss.selectOne("res.btotalCnt", uno);
	}

	@Override
	public void addReserAop() {
		ss.insert("res.addReserAop");

	}

	@Override
	public List<AopVO> selectAopVo(AopVO aopvo) {
		return ss.selectList("res.selectReserAop", aopvo);
	}

	@Override
	public List<ResTotalVO> selectReserData(AopVO aopvo) {
		return ss.selectList("res.selectReserData", aopvo);
	}

}
