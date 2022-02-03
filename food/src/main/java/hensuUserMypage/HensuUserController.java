package hensuUserMypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String list() {
		return "user/mylist";
	}
	
}
