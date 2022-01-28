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
	

}
	
