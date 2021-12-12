package kr.co.airbnb.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.airbnb.mvc.dao.UserDaoInter;
import kr.co.airbnb.mvc.dto.UserVO;

@Controller
public class LoginCheckController {
	@Autowired
	private UserDaoInter userDaoInter;

	@RequestMapping("/loginForm")
	public String loginForm(String hno, Model m) {
		if (hno == null) {
			return "login/loginForm";
		} else {
			m.addAttribute("hnoCheck", hno);
			return "login/loginForm";
		}
	}

	@RequestMapping("/loginProcess")
	public String loginProcess(HttpSession session, UserVO vo, String hno) {
		if (hno != null) {
			UserVO uvo = userDaoInter.loginChk(vo);
			if (uvo.getCnt() > 0) {
				uvo = userDaoInter.addSession(vo);
				System.out.println("로그인 인증");
				session.setAttribute("sessionHostchk", uvo.getHostchk());
				session.setAttribute("sessionName", uvo.getName());
				session.setAttribute("sessionNo", uvo.getNo());
				return "redirect:/roomDetail?hno=" + hno;
			} else {
				System.out.println("로그인 실패");
				return "redirect:/loginForm?hno=" + hno;
			}
		} else {
			UserVO uvo = userDaoInter.loginChk(vo);
			if (uvo.getCnt() > 0) {
				uvo = userDaoInter.addSession(vo);
				System.out.println("로그인 인증");
				session.setAttribute("sessionHostchk", uvo.getHostchk());
				session.setAttribute("sessionName", uvo.getName());
				session.setAttribute("sessionNo", uvo.getNo());
				return "redirect:/";
			} else {
				System.out.println("로그인 실패");
				return "redirect:/loginForm";
			}
		}
	}
	

	@RequestMapping("/logoutProcess")
	public String logoutProcess(HttpSession session) {
		if (session != null) {
			session.removeAttribute("sessionHostchk");
			session.removeAttribute("sessionName");
			session.removeAttribute("sessionNo");
		}
		return "redirect:/";
	}
}
