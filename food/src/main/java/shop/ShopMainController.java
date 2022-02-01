package shop;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import restaurant.RestaurantService;
import restaurant.RestaurantVo;
import user.UserVo;

@Controller
public class ShopMainController {

	@Autowired
	RestaurantService service; 
	
	@GetMapping("shop/shopmain.do")
	public String main(Model model, @RequestParam int r_no) {
		RestaurantVo vo = new RestaurantVo();
		
		model.addAttribute("data", service.selectone(r_no));
		
		System.out.println(vo.getR_address());
		return "shop/shopmain";
	}
	
	@GetMapping("shop/join.do")
	public String shopJoin() {
		return "shop/shopJoin";
	}
	@PostMapping("/shop/insert.do")
	public String insert(RestaurantVo vo, HttpServletRequest req, MultipartFile file,MultipartFile file1,MultipartFile file2,MultipartFile file3, HttpSession sess) {
		vo.setU_no(((UserVo)sess.getAttribute("userInfo")).getU_no());
		//파일저장 
		
		if (!file.isEmpty() && !file1.isEmpty()&& !file2.isEmpty() && !file3.isEmpty()) { // 사용자가 파일을 첨부했다면 
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String filename1 = file1.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String filename2 = file2.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String filename3 = file3.getOriginalFilename(); // 사용자가 업로드한 원본 파일
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				String ext1 = filename1.substring(filename1.lastIndexOf(".")); // 확장자 (.jpg)
				String ext2 = filename2.substring(filename2.lastIndexOf(".")); // 확장자 (.jpg)
				String ext3 = filename3.substring(filename3.lastIndexOf(".")); // 확장자 (.jpg)
				String filename_real = System.currentTimeMillis() + ext;
				String filename_real1 = System.currentTimeMillis()-1 + ext1;
				String filename_real2 = System.currentTimeMillis()-2 + ext2;
				String filename_real3 = System.currentTimeMillis()-3 + ext3;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장 
				file1.transferTo(new File(path+filename_real1)); // 경로에 파일을 저장 
				file2.transferTo(new File(path+filename_real2)); // 경로에 파일을 저장 
				file3.transferTo(new File(path+filename_real3)); // 경로에 파일을 저장 
				
				vo.setR_filename_org(filename);
				vo.setR_filename_org1(filename1);
				vo.setR_filename_org2(filename2);
				vo.setR_filename_org3(filename3);
				vo.setR_filename_real(filename_real);
				vo.setR_filename_real1(filename_real1);
				vo.setR_filename_real2(filename_real2);
				vo.setR_filename_real3(filename_real3);
				
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int r = service.restinsert(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "정상적으로 등록되었습니다");
		req.setAttribute("url", "/res/user/main.do");
		} else {
			req.setAttribute("msg", "등록 오류 ");
			req.setAttribute("url", "join.do");
		}
		
		return "include/return";
		}
}