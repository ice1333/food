
package admincomment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.UserVo;
import util.CommonUtil;



@Controller
public class AdminCommentController {
			
	@Autowired
	AdminCommentService service;
	
	@GetMapping("admin/comment/index.do")
	public String index(Model model, HttpServletRequest req, AdminCommentVo vo) {
		
		int totCount = service.count(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		

		List<AdminCommentVo> list = service.selectList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("PageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));

		return "admin/comment/index";
	}
	
	@RequestMapping("comment/admincommentDelAjax.do")
	public String userdelAjax(HttpServletRequest req, Model model, UserVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			service.admincommentDelete(null);
		}
		return "include/result";
	}

}	
