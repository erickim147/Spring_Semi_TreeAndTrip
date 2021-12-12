package kr.co.airbnb.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping("/")
	public String defaultUrl(HttpSession session) {
		return "main/main";
	}

	@RequestMapping("/main")
	public String mainUrl() {
		return "main/main";
	}

	@RequestMapping("/boardList")
	public String boardList() {
		return "board/boardList";
	}

	@RequestMapping("/boardForm")
	public String boardForm() {
		return "board/boardForm";
	}

	@RequestMapping("/resCheck22")
	public String memberJoinUrl() {
		return "user/resCheck";
	}

	@RequestMapping("/rescheckdetail22")
	public String rescheckdetail() {
		return "user/rescheckdetail";
	}

}
