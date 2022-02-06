package restaurant;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.UserVo;
import comment.CommentService;
import comment.CommentVo;
import hensuUserMypage.VisitVo;
import util.CommonUtil;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService service; 
	@Autowired   
	CommentService cmService;
	
	@GetMapping("/admin/board/restaurantList.do")
	public String restaurantList(RestaurantVo vo, Model model) {
		int totCount = service.restaurantCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		 
		
		List<RestaurantVo> list = service.restaurantList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
		return "admin/board/restaurantList";
	}
	@RequestMapping("/admin/board/restWrite.do")
	public String restWrite() {
		return "admin/board/restWrite";
	}
	@GetMapping("/admin/board/requestList.do")
	public String reqeustList(RestaurantQnaVo vo, Model model) {
		int totCount = service.restaurantQnaCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		 
		
		List<RestaurantQnaVo> list = service.restaurantQnaList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
		return "admin/board/requestList";
	}
	@RequestMapping("admin/restaurantDelAjax.do")
	public String userdelAjax(HttpServletRequest req, Model model, UserVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			service.restaurantDelete(Msg[i]);
		}
		return "include/result";
	}
	@RequestMapping("admin/restRegisterAjax.do")
	public String restRegister(HttpServletRequest req, Model model, RestaurantVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			service.restRegister(Msg[i]);
		}
		return "include/result";
	}

	@RequestMapping("admin/requestDelAjax.do")
	public String admindelAjax(HttpServletRequest req, Model model, UserVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			service.requestDelete(Msg[i]);
		}
		return "include/result";
	}
	
	@PostMapping("/restaurant/insert.do")
	public String insert(RestaurantVo vo, HttpServletRequest req) {
		if (service.restinsert(vo) > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "/res/admin/board/requestList.do");
		} else {
			req.setAttribute("msg", "등록실패");
		}
		return "include/return";
	}
	
	@GetMapping("admin/requestView.do")
	public String requestview(Model model,@RequestParam int rqna_no ) {
		model.addAttribute("vo",RestaurantQnaVo.no_select(rqna_no));
		CommentVo cv = new CommentVo();
		cv.setAdqna_no(rqna_no);
		cv.setTablename("restqna");
		model.addAttribute("list",cmService.adqselectList(cv));
		return "admin/board/requestView";
	}
	
	@PostMapping("user/list.do")
	public String list(Model model, RestaurantVo vo, HttpServletRequest req) {
		
		List<RestaurantVo> list = service.lists(vo);
		model.addAttribute("list",list);
		return "user/restaurantlist";
	}
	
	@RequestMapping("shop/shopmain/wishlistInsertAjax.do")
	public String wishinsert(HttpServletRequest req, Model model,WishlistVo vo,HttpSession sess) {
		if(sess.getAttribute("userInfo") != null) {
			vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
		}
		service.wishinsert(vo);
		return "include/result";
	}
	@RequestMapping("shop/shopmain/wishlistDelAjax.do")
	public String wishDel(HttpServletRequest req, Model model,WishlistVo vo,HttpSession sess) {
		if(sess.getAttribute("userInfo") != null) {
			vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
		}
		service.wishlistDelete(vo);
		return "include/result";
	}  
	
	@GetMapping("shop/shopmain/emailCheck.do")
	public String emailCheck(Model model, WishlistVo vo) {
		model.addAttribute("result", service.wishCount(vo));
		return "include/result";
	}    
}
