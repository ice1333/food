package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import util.CommonUtil;

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
			model.addAttribute("url", "/res/admin/board/index.do");
			return "include/return";
		} else {
			model.addAttribute("msg", "이메일, 비밀번호를 확인해 주세요");
			model.addAttribute("url", "/res/admin/login.do");
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
	@GetMapping("/admin/logout.do")
	public String logOut(Model model, HttpSession sess) {
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/res/admin/login.do");
		sess.invalidate();
		return "include/return";
	}
	@GetMapping("/admin/user/index.do")
	public String userList(Model model, HttpServletRequest req, UserVo vo) {
		int totCount = service.count(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		 
		
		List<UserVo> list = service.selectList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
		return "admin/board/user";
	}
	@GetMapping("/admin/user/delete.do")
	public String delete(Model model, UserVo vo) {
		int r = service.delete(vo); 
		if(r > 0) {
			model.addAttribute("msg","정상적으로 삭제되었습니다.");
			model.addAttribute("url","index.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","삭제 오류");
			model.addAttribute("url","view.do?boardno="+vo.getU_no()); //실패했을때 상세페이지 이동 
		}
		return "include/return";
	}
}


