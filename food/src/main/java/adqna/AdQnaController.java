package adqna;

import java.io.File;
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
//관리자에는 목록이랑 상세 -
import org.springframework.web.multipart.MultipartFile;

import admin.UserVo;
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
	
	
	
	
	
	
	
	@GetMapping("adqna/index.do")
	public String index(Model model, HttpServletRequest req, AdQnaVo vo) {
		int totCount = adqnaService.adqnacount(vo); //총갯수
		int totPage = totCount / 10;		//총페이지
		if (totCount % 10 > 0 ) totPage++; 
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);
		
		List<AdQnaVo> list = adqnaService.selectList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage", totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10));
		return "adqna/index";
		
	}
	
	
	@GetMapping("adqna/edit.do")
	public String edit(Model model,@RequestParam int adqna_no) {
		model.addAttribute("vo",adqnaService.no_select(adqna_no));
		return "adqna/edit";
	}
	
	@GetMapping("adqna/view.do")
	public String view(Model model,@RequestParam int adqna_no) {
		model.addAttribute("vo",adqnaService.no_select(adqna_no));
		return "adqna/view";
	}
	
	@GetMapping("adqna/write.do")
	public String write(Model model,HttpSession sess,AdQnaVo vo) {
//		UserVo uv= (UserVo)sess.getAttribute("userInfo");
//		
//		int u_no=uv.getU_no();
//		String u_name=uv.getU_name();
//		
//		vo.setU_no(u_no);
//		vo.setU_name(u_name);
//		model.addAttribute("vo",uv.getU_name());
		return "adqna/write";
	}
	
	
	@PostMapping("adqna/insert.do")
	public String insert(HttpServletRequest req, MultipartFile file,HttpSession ses) {
		
	return "";	
	}
	
	@PostMapping("adqna/update.do")
	public String update(Model model, HttpSession sess,MultipartFile file,HttpServletRequest req,AdQnaVo vo) {
		if(req.getParamter("delCheck")!=null) {
			AdQnaVo av = adqnaService.edit(vo.getAdqna_no());
			File f = new File(req.getRealPath("/upload/")+av.getAq_filename_real());
			f.delete();
			vo.setAq_filename_org("");
			vo.setAq_filename_real("");
		}
		if (file!=null&&!file.isEmpty()) {
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".")); // 뒤에서부터 . 까지 잘라옴(.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				// 
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 서버에저장할떄 한글로저장x
				vo.setFilename_org(filename);
				vo.setFilename_real(filename_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "";
	}
	
	@GetMapping("adqna/delete.do")
	public String userdelete() {
		return"";
	}
	
}
