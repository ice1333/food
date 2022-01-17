package adqna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//관리자에는 목록이랑 상세 -

import comment.CommentService;
import comment.CommentVo;
import util.CommonUtil;

@Controller
public class AdQnaController {

	@Autowired
	AdQnaService adqnaService;
	@Autowired
	CommentService cmService;	
	
	//관리자 광고 문의 페이지
	
	@GetMapping("admin/adqnaindex.do") 
	public String adqnaindex(Model model, HttpServletRequest req, AdQnaVo vo) {		
		
		int totCount = adqnaService.adqnacount(vo); //총갯수
		int totPage = totCount / 10;		//총페이지
		if (totCount % 10 > 0 ) totPage++; 
		
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		
		List<AdQnaVo> list = adqnaService.selectList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage", totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("adqnaindex.do", vo.getPage(), totPage, 10));
		return "admin/adqna/adqnaindex";
	}
	
	
	@GetMapping("admin/adqnaview.do")
	public String adqnaview(Model model,@RequestParam int adqna_no ) {
		model.addAttribute("vo",adqnaService.no_select(adqna_no));
		CommentVo cv = new CommentVo();
		cv.setAdqna_no(adqna_no);
		cv.setTablename("adqna");
		model.addAttribute("list",cmService.adqselectList(cv));
		return "admin/adqna/adqnaview";
	}
	
	@RequestMapping("admin/delAjax.do")
	public String delAjax(HttpServletRequest req, Model model, AdQnaVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			adqnaService.adqnadelete(Msg[i]);
		}
		return "admin/include/result";
	}
	
	@GetMapping("admin/delete.do") 
	public String delete(Model model, AdQnaVo vo) {
		model.addAttribute("vo",adqnaService.delete(vo));
		return "admin/adqna/adqnaindex";
	}
	
	
	
	
	
	
}
