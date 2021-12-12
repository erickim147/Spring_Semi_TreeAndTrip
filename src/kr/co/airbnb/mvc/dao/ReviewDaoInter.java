package kr.co.airbnb.mvc.dao;

import java.util.List;

import kr.co.airbnb.mvc.dto.ReviewVO;
import kr.co.airbnb.mvc.dto.UserVO;
import kr.co.airbnb.mvc.dto.WishVO;

public interface ReviewDaoInter {

	
	public void addReview(ReviewVO revo);
	public void deleteReview(ReviewVO revo);
	public List<ReviewVO> getListRoomReview(int hno);
	public List<ReviewVO> getListUserReview(int uno);
	public List<UserVO> getwishReview(int hno);
}
