package hensuUserMypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import restaurant.RestaurantVo;
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
	public String restaurantList(VisitVo vo, Model model) {
		int totCount = service.restaurantCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		 
		List<VisitVo> list = service.mylist(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("mylist.do", vo.getPage(), totPage, 5));
		return "user/mylist";
	}
	
}
