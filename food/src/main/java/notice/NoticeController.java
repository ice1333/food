package notice;

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
import org.springframework.web.multipart.MultipartFile;

import util.CommonUtil;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;

	@GetMapping("/admin/noticeindex.do")
	public String index(Model model, HttpServletRequest req, NoticeVo vo) {
		
		int totCount = noticeService.count(vo); //총개수
		int totPage = totCount / 10; //총페이지수
		if(totCount % 10 > 0) totPage++;
				
		int startIdx = (vo.getPage()-1) * 10;
		vo.setStartIdx(startIdx);
		
		
		List<NoticeVo> list = noticeService.selectList(vo);
		model.addAttribute("list", list);
		model.addAttribute("totPage", totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("PageArea",CommonUtil.getPageArea("noticeindex.do", vo.getPage(), totPage, 10));
		
		return "admin/notice/index";
	}
	
	@PostMapping("/admin/noticeinsert.do")
	public String insert(NoticeVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		//vo.setA_no(((AdminVo)sess.getAttribute("userInfo")).getA_no());
		
		if (!file.isEmpty()) {//사용자가 파일을 첨부했다면
			try {
				String path= req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".")); //확장자 .jpg
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일 저장
				vo.setN_fileorg(filename);
				vo.setN_filereal(filename_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		int r = noticeService.insert(vo);
		System.out.println("r:"+r);
		
		if(r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "noticeindex.do");
		} else {
			req.setAttribute("msg", "등록오류");
			req.setAttribute("url", "noticewrite.do");
		}
		return "admin/include/return";
	}
	
	@RequestMapping("/admin/noticewrite.do")
	public String write() {
		return "admin/notice/write";
	}
	
	
	@GetMapping("/admin/noticeview.do")
	public String view(Model model,@RequestParam int n_no) {
		model.addAttribute("data", noticeService.view(n_no));
		return "admin/notice/view3";
	}
	
	@GetMapping("/admin/noticeedit.do")
	public String edit(Model model,@RequestParam int n_no) {
		model.addAttribute("data", noticeService.edit(n_no));
		return "admin/notice/edit";
	}
	
	@PostMapping("/admin/noticeupdate.do")
	public String update(Model model, NoticeVo vo, MultipartFile file, HttpServletRequest req) {
		//사용자가 체크박스를 체크했는지 여부 확인
		if("1".equals(req.getParameter("delCheck"))) {
			NoticeVo bv = noticeService.edit(vo.getN_no());
			File f = new File(req.getRealPath("/upload/")+ bv.getN_filereal());
			f.delete();
			vo.setN_fileorg("");
			vo.setN_filereal("");
		}
		if (file != null && !file.isEmpty()) {//사용자가 파일을 첨부했다면
			try {
				String path= req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".")); //확장자 .jpg
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일 저장
				vo.setN_fileorg(filename);
				vo.setN_filereal(filename_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = noticeService.update(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "noticeview.do?n_no="+vo.getN_no());//성공했을때	
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "noticeedit.do?n_no="+vo.getN_no());//실패했을때
		}
		return "include/return";
	}
	
	@GetMapping("/admin/noticedelete.do")
	public String delete(Model model, NoticeVo vo) {
		int r = noticeService.delete(vo);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");//성공했을때	목록페이지로 이동
		} else {
			model.addAttribute("msg", "삭제 오류");
			model.addAttribute("url", "noticeview.do?n_no="+vo.getN_no());//실패했을때 상세페이지로
		}
		return "include/return";
	}	
//	@GetMapping("/admin/notice/deleteAjax.do")
//	public String deleteAjax(Model model, NoticeVo vo) {
//		model.addAttribute("result", noticeService.delete(vo));
//		return "include/result";
//	}	
	@RequestMapping("admin/noticedelAjax.do")
	public String delAjax(HttpServletRequest req, Model model, NoticeVo vo) {
		
		String[] Msg = req.getParameterValues("valueArr");
		int size = Msg.length;
		for(int i=0; i<size; i++) {
			noticeService.checkDelete(Msg[i]);
		}
		return "include/result";
	}
	
	//사용자
	@GetMapping("/user/noticeindex.do")
	public String index2(Model model, HttpServletRequest req, NoticeVo vo) {
		
		int totCount = noticeService.count(vo); //총개수
		int totPage = totCount / 10; //총페이지수
		if(totCount % 10 > 0) totPage++;
				
		int startIdx = (vo.getPage()-1) * 10;
		vo.setStartIdx(startIdx);
		
		
		List<NoticeVo> list = noticeService.selectList(vo);
		model.addAttribute("list", list);
		model.addAttribute("totPage", totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("PageArea",CommonUtil.getPageArea("noticeindex.do", vo.getPage(), totPage, 10));
		
		return "notice/index";
	}
	@GetMapping("/user/noticeview.do")
	public String view2(Model model,@RequestParam int n_no) {
		model.addAttribute("data", noticeService.view2(n_no));
		return "notice/view";
	}
	
	
	
}
