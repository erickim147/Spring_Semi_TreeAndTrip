package kr.co.airbnb.mvc.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.airbnb.mvc.dao.HostDaoInter;
import kr.co.airbnb.mvc.dao.ResDaoInter;
import kr.co.airbnb.mvc.dto.AopVO;
import kr.co.airbnb.mvc.dto.HostVO;
import kr.co.airbnb.mvc.dto.PageVO;
import kr.co.airbnb.mvc.dto.ResTotalVO;
import kr.co.airbnb.mvc.dto.ResVO;

@Controller
public class ResController {

	@Autowired
	private ResDaoInter resDaoInter;

	@RequestMapping("/addRes")
	public String addRes(ResVO rvo) {
		String price = rvo.getRprice().trim();
		String[] strnum = price.split(",");
		String strnum2 = "";
		for (String e : strnum) {
			strnum2 += e;
		}
		rvo.setRprice(strnum2);
		resDaoInter.addRes(rvo);
		return "redirect:/";
	}

	@RequestMapping("/resbTotal")
	public String resbTotal(Model m, int hno) {
		List<ResTotalVO> list = resDaoInter.hbTotal(hno);
		m.addAttribute("list", list);

		return "reservation/rblist";
	}

	@RequestMapping("/resaTotal")
	public String resaTotal(Model m, int hno) {
		List<ResTotalVO> list = resDaoInter.haTotal(hno);
		m.addAttribute("list", list);

		return "reservation/rblist";
	}

	@RequestMapping("/resMybTotal")
	public String resMybTotal(Model m, String cntPerPage, String nowPage, int uno, String comment) {

		int spage = 1;
		if (nowPage != null && !nowPage.equals("")) {
			spage = Integer.parseInt(nowPage);
		}
		if (cntPerPage == null) {
			cntPerPage = "6";
		}
		int total = resDaoInter.getBTotalCount(uno);
		PageVO vo = new PageVO(total, spage, Integer.parseInt(cntPerPage));

		vo.setUno(uno);
		List<ResTotalVO> list = resDaoInter.getbList(vo);

		m.addAttribute("list", list);
		m.addAttribute("paging", vo);
		m.addAttribute("comment", comment);

		return "user/resCheck";
	}

	@RequestMapping("/resMyaTotal")
	public String resMyaTotal(Model m, String cntPerPage, String nowPage, int uno) {

		int spage = 1;
		if (nowPage != null && !nowPage.equals("")) {
			spage = Integer.parseInt(nowPage);
		}
		if (cntPerPage == null) {
			cntPerPage = "6";
		}
		int total = resDaoInter.getATotalCount(uno);

		PageVO vo = new PageVO(total, spage, Integer.parseInt(cntPerPage));
		vo.setUno(uno);
		List<ResTotalVO> list = resDaoInter.getaList(vo);

		m.addAttribute("list", list);
		m.addAttribute("paging", vo);

		return "user/resCheck";
	}

	@RequestMapping("/rescheckdetail")
	public String rescheckdetail(Model m, int resno) {

		ResTotalVO rtvo = resDaoInter.receipe(resno);
		String chkin = rtvo.getChkin();
		String chkout = rtvo.getChkout();

		Date date1 = null;
		try {
			date1 = new SimpleDateFormat("yyyy-MM-dd").parse(chkin);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cmpDate1 = Calendar.getInstance();
		cmpDate1.setTime(date1); // 특정 일자

		Date date2 = null;
		try {
			date2 = new SimpleDateFormat("yyyy-MM-dd").parse(chkout);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cmpDate2 = Calendar.getInstance();
		cmpDate2.setTime(date2); // 특정 일자

		long diffSec = (cmpDate2.getTimeInMillis() - cmpDate1.getTimeInMillis()) / 1000;
		long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

		System.out.println("날짜:" + diffDays);

		String price = rtvo.getRprice().trim();

		System.out.println("가격 :" + price);
		String[] strnum = price.split(",");
		String strnum2 = "";
		for (String e : strnum) {
			strnum2 += e;
		}
		System.out.println("쉼표없앰:" + strnum2);

		int strnum3 = Integer.parseInt(strnum2);

		int resPrice = (int) (strnum3 * diffDays);

		System.out.println(resPrice);
		m.addAttribute("rtvo", rtvo);
		m.addAttribute("total", resPrice);
		m.addAttribute("days", diffDays);

		return "user/rescheckdetail";
	}

	@RequestMapping("/searchSales")
	public String searchSales(AopVO aopvo, Model m) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		List<AopVO> list = resDaoInter.selectAopVo(aopvo);
		List<ResTotalVO> resList = resDaoInter.selectReserData(aopvo);
		List<String> locationList = new ArrayList<String>();
		for (AopVO e : list) {
			locationList.add(e.getUaddressdo());
		}
		Map<String, Integer> locationMap = new HashMap<String, Integer>();
		for (String loStr : locationList) {
			Integer count = locationMap.get(loStr);
			if (count == null) {
				locationMap.put(loStr, 1);
			} else {
				locationMap.put(loStr, count + 1);
			}
		}
		int totalSales = 0;
		String averagePrice = "";
		String changeTotalSales = "";
		for (AopVO e : list) {
			totalSales += Integer.parseInt(e.getResprice());
			e.setResprice(formatter.format((Integer.parseInt(e.getResprice()))));
		}
		changeTotalSales = formatter.format((totalSales));
		if(totalSales != 0) {
			averagePrice = formatter.format(totalSales / list.size());
		};
		m.addAttribute("list", list);
		m.addAttribute("resList", resList);
		m.addAttribute("locationMap", locationMap);
		m.addAttribute("reserNum", list.size());
		m.addAttribute("totalPrice", changeTotalSales);
		m.addAttribute("searchIn", aopvo.getSearchIn());
		m.addAttribute("searchOut", aopvo.getSearchOut());
		m.addAttribute("averagePrice", averagePrice);
		return "sales/salesStatus";
	}

}