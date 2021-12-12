package kr.co.airbnb.mvc.dao;

import java.util.List;

import kr.co.airbnb.mvc.dto.HostVO;
import kr.co.airbnb.mvc.dto.WishVO;

public interface WishDaoInter {
   public void addWish(WishVO wvo);
   public void deleteWish(WishVO wvo);
   public int wishChk(WishVO wvo);
   public List<HostVO> getList(int uno);
}