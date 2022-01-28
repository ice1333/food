package user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import admin.AdminVo;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
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
	@PostMapping("/user/login.do")
	public String loginProcess(Model model, UserVo vo, HttpSession sess) {
		if (service.login(vo, sess)) {
			model.addAttribute("url", "/res/user/main.do");
			return "include/return";
		} else {
			model.addAttribute("msg", "아이디, 비밀번호를 확인해 주세요");
			model.addAttribute("url", "/res/user/login.do");
			return "include/return";
		}
	}
	@GetMapping("/user/logout.do")
	public String logOut(Model model, HttpSession sess) {
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/res/user/login.do");
		sess.invalidate();
		return "include/return";
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
	
