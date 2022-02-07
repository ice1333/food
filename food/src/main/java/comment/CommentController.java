package comment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.AdminVo;
import user.UserVo;
import util.CommonUtil;

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
	
	
	
	@GetMapping("admin/comment/index.do")
	public String index(Model model, HttpServletRequest req, CommentVo vo) {
		
		int totCount = service.count(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		
		List<CommentVo> list = service.selectList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("PageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));

		return "admin/comment/index";
	}
	
	@RequestMapping("admin/admincommentdelAjax.do")
	public String delAjax(HttpServletRequest req, Model model, CommentVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			System.out.println("Msg[i]:"+Msg[i]);
			vo.setC_no(Integer.parseInt(Msg[i]));
			service.adcdelete(vo);
		}
		return "admin/include/result";
	}
	
	@GetMapping("admin/comment/delete.do") 
	public String abcodelete(Model model, CommentVo vo) {
		model.addAttribute("vo",service.adcdelete(vo));
		return "admin/comment/index";
	}
	@GetMapping("user/mypage/myComment")
	   public String userList1(UserVo uvo, HttpSession sess, Model model, CommentVo vo) {
	      vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
	      System.out.println("uvo :"+uvo.getU_no());
	      
	      int totCount = service.count(vo);
	      int totPage = totCount / 10; //총페이지수 
	      if(totCount % 10 > 0) totPage++;
	      
	      int startIdx = (vo.getPage()-1)*10;
	      vo.setStartIdx(startIdx);
	      
	      List<CommentVo> list = service.selectList(vo);
	      model.addAttribute("list",list);
	      model.addAttribute("totPage",totPage);      
	      model.addAttribute("totCount",totCount);
	      model.addAttribute("PageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
	      
	      return "user/myComment";      
	   }
	   

}
