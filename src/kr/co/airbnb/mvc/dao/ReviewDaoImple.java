package kr.co.airbnb.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.airbnb.mvc.dto.ReviewVO;
import kr.co.airbnb.mvc.dto.UserVO;
import kr.co.airbnb.mvc.dto.WishVO;


@Repository
public class ReviewDaoImple implements ReviewDaoInter{

	
	@Autowired
	private SqlSessionTemplate ss;
	
	
	
	@Override
	public void addReview(ReviewVO revo) {
		ss.insert("review.add",revo);
		
	}

	@Override
	public void deleteReview(ReviewVO revo) {
		ss.delete("review.delete", revo);
		
	}

	@Override
	public List<ReviewVO> getListRoomReview(int hno) {
		
		return ss.selectList("review.roomReviewList", hno);
	}

	@Override
	public List<ReviewVO> getListUserReview(int uno) {
		
		return ss.selectList("review.userReviewList", uno);
	}

	@Override
	public List<UserVO> getwishReview(int hno) {
		
		return ss.selectList("wish.hostwishlist", hno);
	}

}
