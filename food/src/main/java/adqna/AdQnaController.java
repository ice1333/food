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
	
	@GetMapping("adqna/write.do") // 로그인 완성후 다시
	public String write(HttpSession sess,AdQnaVo vo) {
//		UserVo uv= (UserVo)sess.getAttribute("userInfo");
		UserVo uv= new UserVo();
		uv.setU_no(1);
		uv.setU_name("전창혁");
		
		int u_no=uv.getU_no();
		String u_name=uv.getU_name();
		vo.setU_no(u_no);
		vo.setU_name(u_name);
		return "adqna/write";
	}
	
	
	
	
	@PostMapping("adqna/insert.do")
	public String insert(HttpServletRequest req, MultipartFile file,HttpSession ses,AdQnaVo vo,MultipartFile file2) {
		
		
		if (!file.isEmpty()) {//사용자가 파일을 첨부했다면
			try {
				String path= req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String filename2 = file2.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf("."));
				String ext2 = filename2.substring(filename2.lastIndexOf("."));//확장자 .jpg
				String filename_real = System.currentTimeMillis() + ext;
				String filename_real2 = System.currentTimeMillis() +1 + ext2;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일 저장
				file2.transferTo(new File(path+filename_real2));
				vo.setFilename_org(filename);
				vo.setFilename_real(filename_real);
				vo.setFilename_org2(filename2);
				vo.setFilename_real2(filename_real2);
				
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		int r = adqnaService.adqnainsert(vo);
		System.out.println("r:"+r);
		
		if(r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록오류");
			req.setAttribute("url", "write.do");
		}
		return "admin/include/return";

	}
	
	
	
	@PostMapping("adqna/update.do")
	public String update(Model model, HttpSession sess,MultipartFile file,HttpServletRequest req,AdQnaVo vo,MultipartFile file2) {
		if("1".equals(req.getParameter("delCheck"))) {
			AdQnaVo av = adqnaService.edit(vo.getAdqna_no());
			File f = new File(req.getRealPath("/upload/")+av.getFilename_org());
			f.delete();
			vo.setFilename_org("");
			vo.setFilename_real("");
			vo.setFilename_org2("");
			vo.setFilename_real2("");
		}
		if (file!=null&&!file.isEmpty()) {
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String filename2 = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf("."));
				String ext2 = filename2.substring(filename2.lastIndexOf("."));// 뒤에서부터 . 까지 잘라옴(.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				String filename_real2 = System.currentTimeMillis() +1 + ext;
				// 
				file.transferTo(new File(path+filename_real));
				file.transferTo(new File(path+filename_real2));// 경로에 파일을 저장 서버에저장할떄 한글로저장x
				vo.setFilename_org(filename);
				vo.setFilename_real(filename_real);
				vo.setFilename_org2(filename2);
				vo.setFilename_real2(filename_real2);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
		}
		int r = adqnaService.adqnaUpdate(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?adqna_no="+vo.getAdqna_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?adqna_no="+vo.getAdqna_no()); // 실패했을때 수정페이지로 이동
		}
		return "include/return";
	}
	
	
	
	@GetMapping("adqna/Udelete.do")
	public String Udelete(Model model,AdQnaVo vo) {
		int r = adqnaService.delete(vo);
		if (r>0) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("url", "index.do");
		}else {
			model.addAttribute("msg", "삭제 오류");
			model.addAttribute("msg", "view.do?adqna_no="+vo.getAdqna_no());
		}
		return"include/return";
	}
	
}
