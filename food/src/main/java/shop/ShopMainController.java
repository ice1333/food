package shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import restaurant.RestaurantService;

@Controller
public class ShopMainController {

	@Autowired
	RestaurantService service; 
	
	@GetMapping("shop/shopmain")
	public String main(Model model, @RequestParam int r_no) {
		model.addAttribute("data", service.selectone(r_no));
		return "shop/shopmain";
	}
	
	
}