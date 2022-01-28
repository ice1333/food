package shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import restaurant.RestaurantService;
import restaurant.RestaurantVo;

@Controller
public class ShopMainController {

	@Autowired
	RestaurantService service; 
	
	@GetMapping("shop/shopmain.do")
	public String main(Model model, @RequestParam int r_no) {
		RestaurantVo vo = new RestaurantVo();
		
		model.addAttribute("data", service.selectone(r_no));
		
		System.out.println(vo.getR_address());
		return "shop/shopmain";
	}
	
	
}