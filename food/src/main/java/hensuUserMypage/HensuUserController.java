package hensuUserMypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import user.UserVo;
import util.CommonUtil;

@Controller
public class HensuUserController {

	@Autowired
	HensuMyService service;
	
	@GetMapping("user/mypage/myLove.do")
	public String love(Model model, @RequestParam int u_no) {
		model.addAttribute("data", service.selectone(u_no));
		return "user/myLove";
	}
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
		System.out.println(vo.getPage());
		System.out.println(totPage);
		return "user/mylist";
	}
	
}
