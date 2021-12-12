package kr.co.airbnb.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.airbnb.mvc.dao.UserDaoInter;
import kr.co.airbnb.mvc.dto.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserDaoInter userDaoInter; 
	
	@RequestMapping("/memberJoin")
	public String memberJoin() {
		return "user/memberJoin";
	}
	
	@PostMapping("/userJoin")
	public String userJoin(UserVO vo) {
		userDaoInter.addUser(vo);
		return "main/main";
	}
	
	@RequestMapping("/emailCheck")
	public String emailCheck(Model m, String email) {
		System.out.println(email);
		int res = userDaoInter.emailChk(email);
		System.out.println(res);
		m.addAttribute("res", res);
		return "emailChk";
	}
}
