package restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import util.CommonUtil;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService service; 
	
	@GetMapping("/admin/board/restaurantList.do")
	public String restaurantList(RestaurantVo vo, Model model) {
		int totCount = service.restaurantCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		 
		
		List<RestaurantVo> list = service.restaurantList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
		return "admin/board/restaurantList";
	}
	@RequestMapping("/admin/board/restWrite.do")
	public String restWrite() {
		return "admin/board/restWrite";
	}
	@GetMapping("/admin/board/requestList.do")
	public String reqeustList(RestaurantQnaVo vo, Model model) {
		int totCount = service.restaurantQnaCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		 
		
		List<RestaurantQnaVo> list = service.restaurantQnaList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
		return "admin/board/requestList";
	}
	
}
