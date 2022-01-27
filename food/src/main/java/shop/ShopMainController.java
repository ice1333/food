package shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopMainController {

	@GetMapping("shop/shopmain")
	public String main() {
		return "shop/shopmain";
	}
}
