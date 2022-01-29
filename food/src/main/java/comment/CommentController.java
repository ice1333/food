package comment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import admin.AdminVo;

@Controller
public class CommentController {
	
	@Autowired
	CommentService service;
	
	@GetMapping("/comment/adqlist.do")
	public String list(Model model, CommentVo com,HttpSession sess) {
		model.addAttribute("list",service.adqselectList(com));
		return "admin/include/commentList";
	}
	
	@GetMapping("/comment/adqcominsert.do")
	public String insert(Model model, CommentVo com, HttpSession sess) {
		AdminVo av = (AdminVo)sess.getAttribute("adminInfo");
		int a_no = av.getA_no();
		com.setA_no(a_no);
		model.addAttribute("vo",service.adqcominsert(com));
		return "admin/include/result";
	}
	
	@GetMapping("/comment/adqdelete.do")
	public String delete(Model model, CommentVo com) {
		model.addAttribute("result",service.adqdelete(com.getC_no()));
		return "admin/include/result";
	}
	
	@GetMapping("/comment/adqlist2.do")
	public String ulist(Model model, CommentVo com) {
		model.addAttribute("list",service.adqselectList(com));
		return "admin/include/usercommentlist";
	}
	
	
}
