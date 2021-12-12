package kr.co.airbnb.mvc.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.airbnb.mvc.dao.WishDaoInter;
import kr.co.airbnb.mvc.dto.HostVO;
import kr.co.airbnb.mvc.dto.WishVO;

@Controller
public class WishController {

   @Autowired
   private WishDaoInter wishDaoInter; 
   
   @RequestMapping("/wishda")
   public String Wishdelete(Model m,WishVO wvo) {
	  int cnt = wishDaoInter.wishChk(wvo);
	  if(cnt==0) {
		  wishDaoInter.addWish(wvo);
	  }else {
		  wishDaoInter.deleteWish(wvo);  
	  }
      int uno=wvo.getUno();
      int hno=wvo.getHno();
      m.addAttribute("res", cnt);
      return "redirect:wishcheck?uno="+uno+"&hno="+hno;
   }

	@RequestMapping("/wishcheck")
	public String wishCheck(Model m, WishVO wvo) {
		int cnt = wishDaoInter.wishChk(wvo);
		m.addAttribute("res", cnt);
		System.out.println(cnt);
		return "wishCheck";
	}
	
	@RequestMapping("/wishlist")
	public String wishList(HttpServletRequest request, Model m,HttpSession session) {
		
		int uno = (Integer) session.getAttribute("sessionNo");
		DecimalFormat formatter = new DecimalFormat("###,###");
		List<HostVO> list =wishDaoInter.getList(uno); 
		  for (HostVO hvo : list) {
		         String fotPrice = formatter.format((Integer.parseInt(hvo.getHprice())));
		         hvo.setHprice(fotPrice);
		      }
		  m.addAttribute("list", list);
	      m.addAttribute("location", request.getParameter("location"));
		
		return "wish/wishList";
	}
	
}