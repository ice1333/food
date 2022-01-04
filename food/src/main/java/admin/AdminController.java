package admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("/admin/index.do")
	public String adminIndex() {
		return "admin/index";
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


