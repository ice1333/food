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
	
	// 레스토랑 상세페이지 댓글
	@GetMapping("/comment/restlist.do")
	public String restlist(Model model, CommentVo com,HttpSession sess) {
		/*
		 * user.UserVo vo = (user.UserVo)sess.getAttribute("userInfo");
		 *  int u_no = vo.getU_no();
			com.setU_no(u_no);
		 */
		model.addAttribute("list",service.restselectList(com));
		return "admin/include/restCommentList";
	}
	@GetMapping("/comment/restinsert.do")
	public String restinsert(Model model, CommentVo com, HttpSession sess) {
		user.UserVo uv= (user.UserVo)sess.getAttribute("userInfo");
		int u_no = uv.getU_no();
		com.setU_no(u_no);
		model.addAttribute("vo",service.restinsert(com));
		return "admin/include/result";
	}
	@GetMapping("/comment/restdelete.do")
	public String restdelete(Model model, CommentVo com) {
		model.addAttribute("result",service.restdelete(com.getC_no()));
		return "admin/include/result";
	}
	
}
