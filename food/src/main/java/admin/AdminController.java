package admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@GetMapping("/admin/login.do")
	public String adminIndex() {
		return "admin/index";
	}
	
	@PostMapping("/admin/login.do")
	public String loginProcess(Model model, AdminVo vo, HttpSession sess) {
		if (service.login(vo, sess)) {
			return "/admin/board/index.do";
		} else {
			model.addAttribute("msg", "이메일, 비밀번호를 확인해 주세요");
			model.addAttribute("url", "/admin/index.do");
			return "include/return";
		}
	}
	@GetMapping("/admin/board/index.do")
	public String adminBoardIndex() {
		return "admin/board/index";
	} 
	@GetMapping("/admin/board/view.do")
	public String adminBoardView() {
		return "admin/board/view";
	}
	@GetMapping("/admin/board/write.do")
	public String adminBoardWrite() {
		return "admin/board/write";
	}
	
	
}


