package kr.co.airbnb.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.airbnb.mvc.dto.HostVO;
import kr.co.airbnb.mvc.dto.WishVO;

@Repository
public class WishDaoImple implements WishDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addWish(WishVO wvo) {
		ss.insert("wish.add", wvo);
	}

	@Override
	public int wishChk(WishVO wvo) {
		return ss.selectOne("wish.wishchk", wvo);
	}

	@Override
	public void deleteWish(WishVO wvo) {
		ss.delete("wish.delete", wvo);

	}

	@Override
	public List<HostVO> getList(int uno) {
		return ss.selectList("wish.list",uno);
	}


}