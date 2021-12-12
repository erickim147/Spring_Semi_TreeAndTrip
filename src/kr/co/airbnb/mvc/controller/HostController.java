package kr.co.airbnb.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.airbnb.mvc.dao.HostDaoInter;
import kr.co.airbnb.mvc.dao.ReviewDaoInter;
import kr.co.airbnb.mvc.dao.UserDaoInter;
import kr.co.airbnb.mvc.dto.HostSubVO;
import kr.co.airbnb.mvc.dto.HostVO;
import kr.co.airbnb.mvc.dto.PageVO;
import kr.co.airbnb.mvc.dto.ResTotalVO;
import kr.co.airbnb.mvc.dto.ResVO;
import kr.co.airbnb.mvc.dto.ReviewVO;
import kr.co.airbnb.mvc.dto.UserVO;
import kr.co.airbnb.mvc.service.UserServiceInter;

@Controller
public class HostController {
	@Autowired
	private UserServiceInter userServiceInter;
	@Autowired
	private HostDaoInter hostDaoInter;
	@Autowired
	UserDaoInter userDaoInter;
	@Autowired
	private ReviewDaoInter reviewDaoInter;

	@RequestMapping("/hostJoin")
	public String hostJoin() {
		return "host/hostJoin";
	}

	@PostMapping("/hostUp")
	public String hostUp(HostVO hvo, HttpSession session, HttpServletRequest request) {
		String img_path = "resources\\imgfile";
		String r_path = request.getRealPath("/");

		List<HostSubVO> imglist = new ArrayList<HostSubVO>();
		int mfNum = 1;
		for (MultipartFile mf : hvo.getMfile2()) {
			String oriFn = mfNum + "_" + mf.getOriginalFilename();

			// 파일 경로와 이름 조합
			StringBuffer path = new StringBuffer();
			path.append(r_path).append(img_path).append("\\");
			path.append(oriFn);
			// 지정한 파일 경로에 파일 객체를 생성해서 복사
			File f = new File(path.toString());
			try {
				mf.transferTo(f);
				HostSubVO hsvo = new HostSubVO();
				hsvo.setImg1(oriFn);
				hsvo.setUpno(hvo.getHno());
				imglist.add(hsvo);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			mfNum += 1;
		} // for문 끝
		int hostChk = userServiceInter.addHostUpUser(hvo);
		session.removeAttribute("sessionHostchk");
		session.setAttribute("sessionHostchk", hostChk);
		hostDaoInter.addSubUp(imglist);
		return "redirect:/";
	}

	@RequestMapping("/roomList1")
	public String hostList(Model m, HttpServletRequest request, HttpSession session, ResVO rvo) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		List<HostVO> list = hostDaoInter.getList(rvo);
		for (HostVO hvo : list) {
			String fotPrice = formatter.format((Integer.parseInt(hvo.getHprice())));
			hvo.setHprice(fotPrice);
		}

		m.addAttribute("list", list);
		m.addAttribute("location", request.getParameter("location"));
		return "room/roomList1";
	}

	@GetMapping("/roomDetail")
	public String roomDetail(Model m, ResVO rvo, String hugi) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		List<Map<String, String>> vo = hostDaoInter.getDetail(rvo.getHno());
		for (int i = 0; i < vo.size(); i++) {
			int hprice = Integer.parseInt(vo.get(i).get("HPRICE"));
			String fotPrice = formatter.format(hprice);
			vo.get(i).replace("HPRICE", fotPrice);
		}
		m.addAttribute("vo", vo);
		if (hugi != null) {
			m.addAttribute("hugi", hugi);

		}
		List<ReviewVO> rlist = reviewDaoInter.getListRoomReview(rvo.getHno());
		m.addAttribute("rlist", rlist);
		return "room/roomDetail";
	}

	@RequestMapping("/resChk")
	public String resChk(Model m, ResVO rvo, HttpServletRequest request) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		List<Map<String, String>> vo = hostDaoInter.getDetail(rvo.getHno());
		for (int i = 0; i < vo.size(); i++) {
			int hprice = Integer.parseInt(vo.get(i).get("HPRICE"));
			String fotPrice = formatter.format(hprice);
			vo.get(i).replace("HPRICE", fotPrice);
		}
		m.addAttribute("vo", vo);
		m.addAttribute("chkin", request.getParameter("chkin"));
		m.addAttribute("chkout", request.getParameter("chkout"));
		m.addAttribute("pnum", request.getParameter("pernum"));

		return "user/shkin111";
	}

	@ResponseBody
	@RequestMapping("cal")
	public List<String> calDate(int hno) {
		List<String> totalDate = new ArrayList<String>(); // 결과값을 담을 그릇을 리스트로 만듦
		List<String> resRno = hostDaoInter.getResRno(hno); // 레스넘버를 담는 리스트 그릇
		for (int i = 0; i < resRno.size(); i++) {
			ResVO rvo = new ResVO(); // 객체생성
			rvo.setRes(Integer.parseInt(resRno.get(i)));
			rvo.setHno(hno);
			List<String> resDate = hostDaoInter.getResDate(rvo);

			for (String e : resDate) {
				totalDate.add(e);
			}

		}
		return totalDate;
	}

	@RequestMapping("hostPwChk")
	public String hostPwChk(UserVO uvo, Model m) {
		int res = hostDaoInter.getHostPwChk(uvo);
		m.addAttribute("res", res);
		return "hostPwChk";
	}

	@RequestMapping("changeUser")
	public String delHost(int no, HttpSession session) {
		int hostChk = userServiceInter.delHost(no);
		session.removeAttribute("sessionHostchk");
		session.setAttribute("sessionHostchk", hostChk);
		return "main/main";
	}

	@RequestMapping("/hostInfo")
	public String hostInfo(Model m, ResVO rvo) {

		List<Map<String, String>> vo = hostDaoInter.getDetail(rvo.getHno());

		m.addAttribute("vo", vo);
		return "host/hostinfo";

	}

	@RequestMapping("/hostreup")
	public String hostreup(HostVO hvo, HttpServletRequest request) {
		String img_path = "resources\\imgfile";
		String r_path = request.getRealPath("/");

		List<HostSubVO> imglist = new ArrayList<HostSubVO>();
		int mfNum = 1;
		for (MultipartFile mf : hvo.getMfile2()) {
			String oriFn = mfNum + "_" + mf.getOriginalFilename();
			System.out.println("oriFn:" + oriFn);

			// 파일 경로와 이름 조합
			StringBuffer path = new StringBuffer();
			path.append(r_path).append(img_path).append("\\");
			path.append(oriFn);
			System.out.println();
			System.out.println("FullPath:" + path);
			// 지정한 파일 경로에 파일 객체를 생성해서 복사
			File f = new File(path.toString());
			try {
				mf.transferTo(f);
				HostSubVO hsvo = new HostSubVO();
				hsvo.setImg1(oriFn);
				hsvo.setUpno(hvo.getHno());
				imglist.add(hsvo);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			mfNum += 1;
		}
		hostDaoInter.hostReUp(hvo);
		int upno = hvo.getHno();
		hostDaoInter.hostSubDel(upno);
		hostDaoInter.hostSubUp(imglist);
		return "redirect:/";
	}

	@RequestMapping("/selectType")
	public String selectType(int type, Model m) {
		String htype = "";
		switch (type) {
		case 1:
			htype = "게스트하우스";
			break;
		case 2:
			htype = "카라반&캠핑";
			break;
		case 3:
			htype = "풀빌라";
			break;
		case 4:
			htype = "아파트형숙소";
			break;
		}

		DecimalFormat formatter = new DecimalFormat("###,###");
		List<HostVO> list = hostDaoInter.getTypeList(htype);
		for (HostVO hvo : list) {
			String fotPrice = formatter.format((Integer.parseInt(hvo.getHprice())));
			hvo.setHprice(fotPrice);
		}
		m.addAttribute("list", list);
		return "room/roomList";
	}

	@RequestMapping("/roomList")
	public String hostListBeta(Model m, HttpServletRequest request, HttpSession session, String cntPerPage,
			String nowPage, String location) {
		int spage = 1;
		if (nowPage != null && !nowPage.equals("")) {
			spage = Integer.parseInt(nowPage);
		}
		if (cntPerPage == null) {
			cntPerPage = "3";
		}
		int total = hostDaoInter.getTotalCount(location);
		PageVO vo = new PageVO(total, spage, Integer.parseInt(cntPerPage));

		vo.setLocation(request.getParameter("location"));

		List<ResTotalVO> list = hostDaoInter.getTetsList(vo);

		m.addAttribute("list", list);
		m.addAttribute("location", request.getParameter("location"));
		m.addAttribute("paging", vo);
		return "room/roomList";
	}

}
