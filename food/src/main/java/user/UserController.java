package user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("user/main.do")
	public String main() {
		return "user/main";
	}
	
	@GetMapping("user/list.do")
	public String list() {
		return "user/restrantlist";
	}
}
