package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
			model.addAttribute("msg", "아이디, 비밀번호를 확인해 주세요");
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
	@GetMapping("/admin/board/userList.do")
	public String userList(Model model, HttpServletRequest req, UserVo vo) {
		int totCount = service.userCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		 
		
		List<UserVo> list = service.userList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("userList.do", vo.getPage(), totPage, 10));
		return "admin/board/userList";
	}
	@GetMapping("/admin/board/adminList.do")
	public String adminList(Model model, HttpServletRequest req, AdminVo vo) {
		int totCount = service.adminCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		
		
		List<AdminVo> list = service.adminList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("adminList.do", vo.getPage(), totPage, 10));
		return "admin/board/adminList";
	}
	@RequestMapping("admin/userDelAjax.do")
	public String userdelAjax(HttpServletRequest req, Model model, UserVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			service.userDelete(Msg[i]);
		}
		return "include/result";
	}

	@RequestMapping("admin/adminDelAjax.do")
	public String admindelAjax(HttpServletRequest req, Model model, UserVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			service.adminDelete(Msg[i]);
		}
		return "include/result";
	}
	
}
