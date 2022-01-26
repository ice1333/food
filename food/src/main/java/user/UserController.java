package user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	//수연 페이지 확인	
	@GetMapping("user/main.do")
	public String main() {
		return "user/main";
	}
	@GetMapping("user/list.do")
	public String list() {
		return "user/restaurantlist";
	}
	@GetMapping("user/login.do")
	public String login() {
		return "user/login";
	}
	@GetMapping("user/searchid.do")
	public String searchid() {
		return "user/searchId";
	}
	@GetMapping("user/searchpwd.do")
	public String searchidpwd() {
		return "user/searchPwd";
	}
	@GetMapping("user/notice.do")
	public String notice() {
		return "user/notice";
	}
	//수연 페이지 끝 
	
	@GetMapping("user/join.do")
	public String join() {
		return "user/join";
	}
	@GetMapping("user/privacy.do")
	public String privacy() {
		return "user/privacy";
	}
	@GetMapping("user/adqnaindex.do")
	public String adqnaindex() {
		return "adqna/index";
	}
	@GetMapping("user/adqnaedit.do")
	public String adqnaedit() {
		return "adqna/edit";
	}
	@GetMapping("user/adqnaview.do")
	public String adqnaview() {
		return "adqna/view";
	}
	@GetMapping("user/adqnawrite.do")
	public String adqnawrite() {
		return "adqna/write";
	}
}
	
