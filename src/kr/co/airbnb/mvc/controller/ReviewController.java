package kr.co.airbnb.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.airbnb.mvc.dao.ReviewDaoInter;
import kr.co.airbnb.mvc.dao.WishDaoInter;
import kr.co.airbnb.mvc.dto.HostVO;
import kr.co.airbnb.mvc.dto.ReviewVO;
import kr.co.airbnb.mvc.dto.UserVO;
import kr.co.airbnb.mvc.dto.WishVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDaoInter reviewDaointer;
	@Autowired
	private WishDaoInter wishDaoInter;

	@RequestMapping("/addReview")
	public String addRivew(ReviewVO revo) {
		reviewDaointer.addReview(revo);
		System.out.println(revo.getHno());
		return "main/main";
	}

	@RequestMapping("/userReviewList")
	public String userRivewList(Model m, int uno) {
		List<ReviewVO> rlist = reviewDaointer.getListUserReview(uno);
		m.addAttribute("rlist", rlist);
		return "review/myReview";

	}

	@RequestMapping("/userRivewdelete")
	public String userRivewdelete(ReviewVO revo) {
		reviewDaointer.deleteReview(revo);
		return "redirect:userReviewList?uno=" + revo.getUno();

	}

	@RequestMapping("/roomReviewList")
	public String roomRivewList(Model m, int hno) {
		List<ReviewVO> rlist = reviewDaointer.getListRoomReview(hno);
		m.addAttribute("rlist", rlist);
		List<UserVO> list = reviewDaointer.getwishReview(hno);
		m.addAttribute("list", list);
		return "review/roomReview";

	}
	
	
	
	
}