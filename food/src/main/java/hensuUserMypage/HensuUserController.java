package hensuUserMypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import user.UserVo;
import util.CommonUtil;

@Controller
public class HensuUserController {

	@Autowired
	HensuMyService service;
	
	@GetMapping("user/mypage/mylist.do")
	public String restaurantList(VisitVo vo, Model model,HttpSession sess) {
		if(sess.getAttribute("userInfo") != null) {
			vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
		}
		
		int totCount = service.visitCount(vo);
		int totPage = totCount / 5; //총페이지수 
		if(totCount % 5 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*5;
		vo.setStartIdx(startIdx);
		 
		List<VisitVo> list = service.mylist(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("mylist.do", vo.getPage(), totPage, 5));
		System.out.println(vo.getVisit());
		return "user/mylist";
	}
	@RequestMapping("user/mypage/listDelAjax.do")
	public String admindelAjax(HttpServletRequest req, Model model,VisitVo vo,HttpSession sess) {
		if(sess.getAttribute("userInfo") != null) {
			vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
		}
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			if(sess.getAttribute("userInfo") != null) {
				vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
				int r_no = Integer.parseInt(Msg[i]);
				vo.setR_no(r_no);
				service.listDelete(vo);
			}
		}
		return "include/result";
	}
	
	@GetMapping("user/mypage/myLove.do")
	public String wishList(WishlistVo vo, Model model,HttpSession sess) {
		if(sess.getAttribute("userInfo") != null) {
			vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
		}
		
		int totCount = service.wishlCount(vo);
		int totPage = totCount / 5; //총페이지수 
		if(totCount % 5 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*5;
		vo.setStartIdx(startIdx);
		
		List<WishlistVo> list = service.wishllist(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("mylist.do", vo.getPage(), totPage, 5));
		System.out.println(vo.getVisit());
		return "user/myWish";
	}
	@RequestMapping("user/mypage/wishDelAjax.do")
	public String wishdelAjax(HttpServletRequest req, Model model,WishlistVo vo,HttpSession sess) {
		if(sess.getAttribute("userInfo") != null) {
			vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
		}
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			if(sess.getAttribute("userInfo") != null) {
				vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
				int r_no = Integer.parseInt(Msg[i]);
				vo.setR_no(r_no);
				service.wishlDelete(vo);
			}
		}
		return "include/result";
	}
	
}
